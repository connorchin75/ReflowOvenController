#include <SystemClock.h>
#include <IOConfig.h>
#include <XPD.h>
#include <GPIO.h>
#include <Thread.h>
#include <Semaphore.h>

#include "wait.h"
#include "oled.h"
#include "thermocouple.h"
#include "pid.h"
#include "rotatry_encoder.h"
#include "humidity.h"

//Initialize Global Variables here
unsigned int light = 0;

/// Configures GPIO to be Input/Output, io cell configuration, and clock frequency
void InitGPIO(){
   //set the system clock to 98.304 MHz 
   sys_clock_init(crys_24_576_MHz, _98_304_MHz);
   //initialize SPI1 as a master device, at 98.304 MHz, with clock rate divided by 16 and enable the SPI1 device
   SPI_set_config_optimal(_98_304_MHz,SPI1);
   
   // configure GPIO pins

   //configure port A
   //initialize PA0 (oled_RES_PIN), PA1 (oled_RS_PIN), PA2 (oled_CS_PIN), PA3(TESTING PIN) and PA7 (humidity_select_pin) as outputs 
   gpio_set_config(0x8F << 8, GPIO_A); // change back to 0x87 AFTER TESTING IS COMPLETE
   //set required starting outputs for GPIOA pins
   //set the oled_CS_PIN high at the start (Chip select is an active low signal)
   gpio_write(gpio_read(GPIO_A)|0x04 , GPIO_A);
   //set the humidity_select_pin high at the start (Select the humidity output)
   gpio_write(gpio_read(GPIO_A)|0x80, GPIO_A);

   //configure port D
   //PD5 (pid_SSR1_output), PD6 (pid_SSR2_output)
   //configure pin PD5 to have maximum current output since it is used to drive the SSR
   io_set_config(IO_DRIVE_16mA, io_PD5);
   //configure pin PD5 to have maximum current output since it is used to drive the SSR
   io_set_config(IO_DRIVE_16mA, io_PD6);
   // set PD4 (oled_SHDN_PIN), PD5 (pid_SSR1_output), PD6 (pid_SSR2_output) to be outputs
   // note this also means all other port D pins such as PD3 will be set to inputs
   gpio_set_config(0x60 << 8, GPIO_D);
   //set required starting outputs for GPIOD pins

   //configure port J
   //initialize PJ1 (thermocouple_CS_PIN) as an output
   gpio_set_config(0x02 << 8, GPIO_J);
   //set required starting outputs for GPIOJ pins
   //set the CS_TEMP high at the start (Chip select is an active low signal)
	gpio_write(gpio_read(GPIO_J) | 0x02, GPIO_J);

   //init pins for rotary encoder
   //pin_init();
}

void * OLEDThread(void * ) {
   //This thread will always remain active
   unsigned int progress;
   while (true) {
      //start up oled
      OLED_Init_160128RGB();
      OLED_Start_Page();
      for(progress=0;progress<101;progress++){
         Clear_Data_Chars(83, 50, BLACK); //clear previous progress reading
         OLED_Print_Sensor_Val(83, 50, progress, 1); //print new progress reading
         Draw_Bar(23, 73, BLUE, BLACK, 26, 122, progress); //fill the progress bar to the correct amount
         wait_ms(500);
      }
   }
}

void * TempThread(void *) {
   int current_temp = 0;
   while (true){
      // xpd_puts("Detected Temp: ");
      // xpd_echo_int(current_temp, XPD_Flag_SignedDecimal);
      // xpd_puts(" \n");
      wait_ms(1000);
      current_temp = getTemp();
   }
}

void * PIDThread(void * ) {
   //This thread will always remain active

   // timer_initialization();
   // unsigned int target_temp = 24;
   // unsigned int cur_temp = 0;
   // unsigned int output = 0;
   // unsigned int pid_status = 0;
   // //initialize the PID controller
   // struct Pid pid1;
   // struct Pid *pid = &pid1;
   // set_pid_parameters(pid, 500, 20, 1);
   // while (true) {
   //    //check to see if 1 second has elapsed to compute a PID action
   //    pid_status = check_pid(pid_status);
   //    if (pid_status == 1){
   //       //compute PID action
   //       //Semaphore lock 0
   //       output = pid_compute(pid, target_temp, cur_temp);
   //       //Semaphore unlock 0
   //       //simulate the change in temperature
   //       cur_temp = simulate_temp(output, cur_temp);
   //       pid_status = 0;
   //    }
   //    //implement PID action
   //    heating_action(output);
   // }
   while (true){
      //turn on SSR output 2
      gpio_write(gpio_read(GPIO_D) | 0x40, GPIO_D);
      //turn on SSR output 1
      gpio_write(gpio_read(GPIO_D) | 0x20, GPIO_D);
      xpd_puts("Value on output while on:");
      xpd_echo_int(gpio_read(GPIO_D), XPD_Flag_Hex);
      xpd_puts(" \n");
      wait_ms(5000);
      //turn off SSR output 2
      gpio_write(gpio_read(GPIO_D)&~(0x40), GPIO_D);
      //turn off SSR output 1
      gpio_write(gpio_read(GPIO_D)&~(0x20), GPIO_D);
      xpd_puts("Value on output while off");
      xpd_echo_int(gpio_read(GPIO_D), XPD_Flag_Hex);
      xpd_puts(" \n");
      wait_ms(5000);

   }
}

void * RotEncodThread(void *) {
   int encoder_pos = 0;
   int button_press=0;
   while (true){
      encoder_pos = rotary_encoder_read();
      button_press = button_read();
      wait_ms(1000);
   }
}

void * HumidityThread(void *) {
   unsigned int prev_state = 0; // start with the previous state at 0
   unsigned int cur_state = 0;
   unsigned int humidity = 0;
   unsigned int counter = 0;
   unsigned int tpw_start = 0;
   //start the running timer
   start_humidity_timer();

   while (true){
      // //check the input value 
      cur_state = get_input();
      if(cur_state == 1 && prev_state ==0){
         //rising edge detected
         tpw_start = rising_edge();
         //set previous state to the most recent state
         prev_state = cur_state;
      }else if(cur_state == 0 && prev_state == 1){
         //falling edge detected
         //end the timer and get the tpw value
         humidity = get_humidity(tpw_start);
         //set previous state to the most recent state
         prev_state = cur_state; 
         counter++;
      }
      if (counter > 100){
         counter = 0;
      }
   }
}
// main() runs in thread 0
int main(void){
   // Configure a pull-up on pin PG0
   // This pull-up prevents an XPD write from stalling execution if
   // there is no XPD attached.
   io_set_config(0b1110011, io_PG0);

   InitGPIO();

   thread_setup(OLEDThread, nullptr, 1);
   thread_run(1);
   thread_setup(TempThread, nullptr, 2);
   thread_run(2);
   thread_setup(PIDThread, nullptr, 3);
   thread_run(3);
   thread_setup(RotEncodThread, nullptr, 4);
   thread_run(4);
   thread_setup(HumidityThread, nullptr, 5);
   thread_run(5);
   return 0;
}