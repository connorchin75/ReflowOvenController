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
<<<<<<< HEAD
#include "rotatry_encoder.h"
#include "humidity.h"

//Initialize Global Variables here
unsigned int light = 0;
=======
#include "rotary_encoder.h"
#include "profile.h"

// -- GLOBAL VARIABLES -- //
int current_temp = 23; //semaphore 0
int humidity = 0; //semaphore 1
int btn_pressed = 0; //semaphore 2
int encoder_pos = 0; //semaphore 3
int chosen_profile = 0; //semaphore 4 
int target_temp; // semaphore 5
int progress = 0; //semaphore 6

unsigned int* profile_pointer[3];    //array of pointers
>>>>>>> 704e71f27d5c7acc93bc8385b8539dfdae144157

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
<<<<<<< HEAD
   //PD5 (pid_SSR1_output), PD6 (pid_SSR2_output)
   //configure pin PD5 to have maximum current output since it is used to drive the SSR
   io_set_config(IO_DRIVE_16mA, io_PD5);
   //configure pin PD5 to have maximum current output since it is used to drive the SSR
   io_set_config(IO_DRIVE_16mA, io_PD6);
   // set PD4 (oled_SHDN_PIN), PD5 (pid_SSR1_output), PD6 (pid_SSR2_output) to be outputs
   // note this also means all other port D pins such as PD3 will be set to inputs
   gpio_set_config(0x60 << 8, GPIO_D);
   //set required starting outputs for GPIOD pins
=======
   //initialize PD5 (pid_SSR1_output), PD6 (pid_SSR2_output)
   gpio_set_config(0x60 << 8, GPIO_D);
>>>>>>> 704e71f27d5c7acc93bc8385b8539dfdae144157

   //configure port J
   //initialize PJ1 (thermocouple_CS_PIN) as an output
   gpio_set_config(0x02 << 8, GPIO_J);
   //set required starting outputs for GPIOJ pins
   //set the CS_TEMP high at the start (Chip select is an active low signal)
	gpio_write(gpio_read(GPIO_J) | 0x02, GPIO_J);

   //init pins for rotary encoder
   //pin_init();
}


void * stateOLEDThread(void *){
   enum scenario_enum {
      CHANGE_PROFILE,
      DISPLAY_PROGRESS,
      STARTING_PROCESS,
      HUMIDITY_WARNING,
      END_PROCESS
   };
   enum scenario_enum scenario;
   int last_encoder_pos = 0;

   int MAX_HUMIDITY = 40;

   int wait_timer =0;
   
   //start up oled
   OLED_Init_160128RGB();
   //clear oled
   OLED_FillScreen_160128RGB(BLACK);
   while(true){
      switch(scenario){
         case CHANGE_PROFILE:            
            sem_lock(4);
            OLED_profile_page(chosen_profile);
            sem_unlock(4);
            sem_lock(2);
            if (btn_pressed == 1){
               //start process
               sem_unlock(2);
               scenario = STARTING_PROCESS;
               // sem_lock(4);
               // chosen_profile_pointer = ;
               // sem_unlock(4);
               break;
            }
            sem_unlock(2);

            sem_lock(3); //encoder position
            if (encoder_pos > last_encoder_pos){ //dial moved clockwise. increase index of profile.
               last_encoder_pos = encoder_pos;
               sem_unlock(3);
               sem_lock(4);
               if (chosen_profile == 0){
                  chosen_profile = 1;
               }
               else if(chosen_profile == 1){
                  chosen_profile = 2;
               }
               else if(chosen_profile == 2){
                  chosen_profile = 0;
               }
               sem_unlock(4);
               // OLED_profile_page(chosen_profile);
            }
            else{
               sem_unlock(3);
            }


            sem_lock(3);
            if (encoder_pos < last_encoder_pos){ //dial moved counter-clockwise. decrease index of profile
               last_encoder_pos = encoder_pos;
               sem_unlock(3);
               sem_lock(4);
               if (chosen_profile == 0){
                  chosen_profile = 2;
               }
               else if(chosen_profile == 1){
                  chosen_profile = 0;
               }
               else if(chosen_profile == 2){
                  chosen_profile = 1;
               }
               sem_unlock(4);
               // OLED_profile_page(chosen_profile);
            }
            else{
               sem_unlock(3);
            }
            break;


         case STARTING_PROCESS:
            xpd_puts("starting_process state\n");
            OLED_starting_page();
            //this will be a page that will indicate that we are about to start the heating process
            wait_timer++;
            if (wait_timer >1000){
               wait_timer = 0;
               scenario = DISPLAY_PROGRESS;
            }
            else{
               scenario = STARTING_PROCESS;
            }
            break;


         case DISPLAY_PROGRESS:
            xpd_puts("display_progress state\n");
            OLED_display_progress();
            sem_lock(2);
            if (btn_pressed == 1){
               sem_unlock(2);
               scenario = END_PROCESS;
               break;
            }
            sem_unlock(2);
            
            //update displayed progress
            sem_lock(6);
            if (progress == 100){
               sem_unlock(6);
               scenario = END_PROCESS;
               break;
            }
            sem_unlock(6);

            sem_lock(0);
            //update displayed temp
            OLED_update_temp(current_temp);
            sem_unlock(0);

            sem_lock(1);
            //update displayed humidity
            OLED_update_humidity(humidity);
            //check if it's over the maximum humidity
            if (humidity > MAX_HUMIDITY){
               sem_unlock(1);
               scenario = HUMIDITY_WARNING;
               break;
            }
            sem_unlock(1);
            break;
         

         case HUMIDITY_WARNING:
            xpd_puts("humidity warning state\n");
            OLED_display_warning();
            sem_lock(2);
            if (btn_pressed == 1){
               sem_unlock(2);
               scenario = DISPLAY_PROGRESS;
               break;
            }
            sem_unlock(2);
            break;


         case END_PROCESS:
            xpd_puts("end_process state\n");
            OLED_end_progress();
            sem_lock(2);
            if (btn_pressed == 1){
               sem_unlock(2);
               scenario = CHANGE_PROFILE;
               break;
            }
            sem_unlock(2);
            break;

      }
   }
}


void * OLEDThread(void * ) {
   //This thread will always remain active
   unsigned int progress;
   while (true) {
      //start up oled
      OLED_Init_160128RGB();
      xpd_puts("Initialized OLED\n");
      OLED_FillScreen_160128RGB(BLACK);
      xpd_puts("Cleared OLED\n");
      wait_ms(5);
      for(int i=0; i<1000; i++){
         draw_lil_guy(20, 20, GREEN, BLACK, 0);
         draw_lil_guy(40, 20, GREEN, BLACK, 1);
         unsigned char x_pos = 104;
         unsigned char y_pos = 30;
         sem_lock(0);
         OLED_Print_Sensor_Val(x_pos, y_pos, current_temp, 0);
         sem_unlock(0);
         wait_ms(100);
      }


      // // OLED_Start_Page();
      // // wait_ms(10000);
      // // OLED_FillScreen_160128RGB(BLACK);
      // // draw_arrow(50, 50, RED, BLACK, 2);
      // draw_lil_guy(20, 20, GREEN, BLACK, 0);
      // draw_lil_guy(40, 20, GREEN, BLACK, 1);
      // // wait_ms(10000);

      // // OLED_Start_Page();
      // xpd_puts("Printing progress on OLED \n");
      // for(progress=0;progress<101;progress++){
      //    unsigned char x_pos = 104;
      //    unsigned char y_pos = 30;
      //    sem_lock(0);
      //    OLED_Print_Sensor_Val(x_pos, y_pos, current_temp, 0);
      //    sem_unlock(0);
      //    wait_ms(250);
      // }
      //    Clear_Data_Chars(83, 50, BLACK); //clear previous progress reading
      //    OLED_Print_Sensor_Val(83, 50, progress, 1); //print new progress reading
      //    Draw_Bar(23, 73, BLUE, BLACK, 26, 122, progress); //fill the progress bar to the correct amount
      //    // current_temp = getTemp();
        
         // OLED_update_temp(current_temp);
         // OLED_Print_Sensor_Val(104, 30, current_temp, 0); //print new temperature reading
         // int temp = current_temp;
         

         // decimal_temp = temp >> 2; //2 LSB are decimal points
         
         // mantissa_temp = ((2^-1) *(temp & 0x02)) + ((2^-2) * (temp & 0x01)); // this shouldd? grab the last two bits to find the value of the decimal places
         
         // OLED_Print_Sensor_Val(x_pos, y_pos, mantissa_temp, 2);
         
         
   }
}

void * TempThread(void *) {
   // int current_temp = 0;
   // int decimal_temp = 0;
   // int after_decimal_temp = 0;
   while (true){
      sem_lock(0);
      current_temp = getTemp();
      sem_unlock(0);
      xpd_puts("Detected Temp: ");
      xpd_echo_int(current_temp, XPD_Flag_SignedDecimal);
      xpd_puts(" \n");
      wait_ms(500);

      // decimal_temp = current_temp >> 2; //2 LSB are decimal points
      // after_decimal_temp = ((2^-1) *(current_temp & 0x02)) + ((2^-2) * (current_temp & 0x01)); // this shouldd? grab the last two bits to find the value of the decimal places

      // xpd_puts("Decimal value of Temp: ");
      // xpd_echo_int(decimal_temp, XPD_Flag_SignedDecimal);
      // xpd_puts(".");
      // xpd_echo_int(after_decimal_temp, XPD_Flag_UnsignedDecimal);
      // xpd_puts(" \n");

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

   profile_pointer[0] = generate_RSS_profile(75, 165, 240); //soak, spike, cooling times
   profile_pointer[1] = generate_RSS_profile(30, 30, 180);
   profile_pointer[2] = generate_RSS_profile(60, 75, 200);

   thread_setup(stateOLEDThread, nullptr, 1);
   thread_run(1);
   thread_setup(TempThread, nullptr, 2);
   thread_run(2);
<<<<<<< HEAD
   thread_setup(PIDThread, nullptr, 3);
   thread_run(3);
   thread_setup(RotEncodThread, nullptr, 4);
   thread_run(4);
   thread_setup(HumidityThread, nullptr, 5);
   thread_run(5);
=======
//    thread_setup(PIDThread, nullptr, 3);
//    thread_run(3);
>>>>>>> 704e71f27d5c7acc93bc8385b8539dfdae144157
   return 0;
}
