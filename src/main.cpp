#include <SystemClock.h>
#include <IOConfig.h>
#include <XPD.h>
#include <GPIO.h>
#include <Thread.h>

#include "wait.h"
#include "oled.h"
#include "thermocouple.h"
#include "pid.h"
#include "rotary_encoder.h"

// -- GLOBAL VARIABLES -- //
int temp = 0; //semaphore 1
int btn_pressed = 0; //semaphore 2
int encoder_pos = 0; //semaphore 3
int humidity = 0; //semaphore 4
int screen_status = 0; //semaphore 5
int profile = 0; //semaphore 6
int chosen_profile = 0; //semaphore 7
int progress = 0; //semaphore 8

unsigned int* temp_profile[3]; //array of pointers

/// Configures GPIO to be Input/Output, io cell configuration, and clock frequency
void InitGPIO(){
   //set the system clock to 98.304 MHz 
   sys_clock_init(crys_24_576_MHz, _98_304_MHz);
   //initialize SPI1 as a master device, at 98.304 MHz, with clock rate divided by 16 and enable the SPI1 device
   SPI_set_config_optimal(_98_304_MHz,SPI1);
   
   // configure GPIO pins

   //configure port A
   //initialize PA0 (oled_RES_PIN), PA1 (oled_RS_PIN) and PA2 (oled_CS_PIN) as outputs
   gpio_set_config(0x07 << 8, GPIO_A);
   //set required starting outputs for GPIOA pins
   //set the oled_CS_PIN high at the start (Chip select is an active low signal)
   gpio_write(gpio_read(GPIO_A)|0x04 , GPIO_A);

   //configure port D
   //initialize PD4 (oled_SHDN_PIN), PD5 (pid_SSR1_output), PD6 (pid_SSR2_output)
   gpio_set_config(0x70 << 8, GPIO_D);
   //set required starting outputs for GPIOD pins
   //set the oled_SHDN_PIN high at the start (Shutdown is an active low signal)
   gpio_write(gpio_read(GPIO_D)|0x10, GPIO_D);

   //configure port J
   //initialize PJ0 (thermocouple_CS_PIN) as an output
   gpio_set_config(0x01 << 8, GPIO_J);
   //set required starting outputs for GPIOJ pins
   //set the CS_TEMP high at the start (Chip select is an active low signal)
	gpio_write(gpio_read(GPIO_J) | 0x01, GPIO_J);
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

void * skeletonOLEDThread(void *){
   enum scenario_enum {
      START_SCREEN,
      CHANGE_PROFILE,
      DISPLAY_PROGRESS,
      STARTING_PROCESS,
      END_PROCESS
   };
   enum scenario_enum scenario;
   int last_encoder_pos = 0;

   int MAX_HUMIDITY = 40;
   
   //start up oled
   OLED_Init_160128RGB();
   //clear oled
   OLED_FillScreen_160128RGB(BLACK);
   while(true){
      switch(scenario){
         case START_SCREEN:
            OLED_main_page();
            //check if there's a btn press
            sem_lock(3); //encoder position
            sem_lock(2); //btn press
            if (btn_pressed == 1){
               //start process
               scenario = STARTING_PROCESS;
            }
            if (encoder_pos != last_encoder_pos){
               last_encoder_pos = encoder_pos;
               scenario = CHANGE_PROFILE;
            }
            sem_unlock(3);
            sem_unlock(2);
            break;


         case CHANGE_PROFILE:
            sem_lock(2);
            if (btn_pressed == 1){
               //start process
               scenario = START_SCREEN;
            }
            sem_unlock(2);

            sem_lock(3); //encoder position
            if (encoder_pos > last_encoder_pos){ //dial moved clockwise. increase index of profile.
               last_encoder_pos = encoder_pos;
               chosen_profile++;
               OLED_profile_page(chosen_profile);
            }
            if (encoder_pos < last_encoder_pos){ //dial moved counter-clockwise. decrease index of profile
               last_encoder_pos = encoder_pos;
               chosen_profile--;
               OLED_profile_page(chosen_profile);
            }
            sem_unlock(3);
            
            break;


         case STARTING_PROCESS:
            OLED_starting_page();
            //this will be a page that will indicate that we are about to start the heating process
            //add a wait here
            scenario = DISPLAY_PROGRESS;
            break;


         case DISPLAY_PROGRESS:
            OLED_display_progress();
            if (btn_pressed ==1){
               scenario = END_PROCESS;
            }
            
            sem_lock(4);
            //update displayed humidity
            OLED_update_humidity(humidity);
            //check if it's over the maximum humidity
            if (humidity > MAX_HUMIDITY){
               OLED_display_warning(); //might want a new state for this?
            }
            sem_unlock(4);
            
            sem_lock(1);
            //update displayed temp
            OLED_update_temp(temp);
            sem_unlock(1);
            
            //update displayed progress
            sem_lock(8);
            if (progress == 100){
               scenario = END_PROCESS;
            }
            sem_unlock(8);
            break;


         case END_PROCESS:
            OLED_end_progress();
            sem_lock(3);
            if (btn_pressed ==1){
               scenario = START_SCREEN;
            }
            sem_unlock(3);
            break;

      }
   }
}

void * TempThread(void *) {
   // int current_temp = 0;
   // int decimal_temp = 0;
   // int after_decimal_temp = 0;
   while (true){
      sem_lock(1);
      temp = getTemp();
      sem_unlock(1);

   //   xpd_puts("Detected Temp: ");
   //   xpd_echo_int(current_temp, XPD_Flag_SignedDecimal);
   //   xpd_puts(" \n");

      	// have not tested the below code that should print the decimal values of temp:
	// decimal_temp = current_temp >> 2; //2 LSB are decimal points
      // after_decimal_temp = ((2^-1) *(current_temp & 0x02)) + ((2^-2) * (current_temp & 0x01)); // this shouldd? grab the last two bits to find the value of the decimal places

      // xpd_puts("Decimal value of Temp: ");
      // xpd_echo_int(decimal_temp, XPD_Flag_SignedDecimal);
      // xpd_puts(".");
      // xpd_echo_int(after_decimal_temp, XPD_Flag_UnsignedDecimal);
      // xpd_puts(" \n");

      wait_ms(1000);
   }
}


void * RotEncodThread(void *) {
   int encoder_pos = 0;
   int button_press=0;
   while (true){
      encoder_pos = rotary_encoder_read();
      button_press = button_read();
      xpd_puts("Detected Position: ");
      xpd_echo_int(encoder_pos, XPD_Flag_SignedDecimal);
      xpd_puts(" \n");
      xpd_puts("Detected Button Press: ");
      xpd_echo_int(button_press, XPD_Flag_SignedDecimal);
      xpd_puts(" \n");
      wait_ms(1000);
	
      
   }

}

void * PIDThread(void * ) {
   //This thread will always remain active
   timer_initialization();
   unsigned int target_temp = 24;
   unsigned int cur_temp = 0;
   unsigned int output = 0;
   unsigned int pid_status = 0;
   //initialize the PID controller
   struct Pid pid1;
   struct Pid *pid = &pid1;
   set_pid_parameters(pid, 500, 20, 1);
   while (true) {
      //check to see if 1 second has elapsed to compute a PID action
      pid_status = check_pid(pid_status);
      if (pid_status == 1){
         //compute PID action
         output = pid_compute(pid, target_temp, cur_temp);
         //simulate the change in temperature
         cur_temp = simulate_temp(output, cur_temp);
         pid_status = 0;
      }
      //implement PID action
      heating_action(output);
   }
}

// main() runs in thread 0
int main(void){
   // Configure a pull-up on pin PG0
   // This pull-up prevents an XPD write from stalling execution if
   // there is no XPD attached.
   io_set_config(0b1110011, io_PG0);

   InitGPIO();
   
   temp_profile[0] = generate_RSS_profile(75, 165, 240); //soak, spike, cooling times
   temp_profile[1] = generate_RSS_profile(30, 30, 180);
   temp_profile[2] = generate_RSS_profile(60, 75, 200);

   thread_setup(OLEDThread, nullptr, 1);
   thread_run(1);
   thread_setup(TempThread, nullptr, 2);
   thread_run(2);
   thread_setup(PIDThread, nullptr, 3);
   thread_run(3);
   return 0;
}
