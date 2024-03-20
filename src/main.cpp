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
#include "rotary_encoder.h"
#include "profile.h"
#include "humidity.h"

#define PROFILE_LIST_SIZE 3

// -- GLOBAL VARIABLES -- //
volatile unsigned int current_temp = 0; //semaphore 0
volatile unsigned int humidity = 0; //semaphore 1
volatile unsigned int btn_press = 0; //semaphore 2
struct rotary_encoder r_encoder = {0,3,0}; // semaphore 3 sets encoder position to 0, initial state to 11 and rot_flag = 0
volatile unsigned int profile_index = 1; //semaphore 4 
volatile unsigned int target_temp; // semaphore 5
volatile unsigned int target_temp_index = 0; //semaphore 6;
volatile unsigned int progress = 0; //semaphore 6 this is a scaled version of target_temp
struct profile selected_profile;

//Setup Profile Generation (actual generation occurs when process begins)
unsigned int profile_array[PROFILE_LIST_SIZE][3] = {{75, 165, 240},{80, 165, 220},{90, 152, 240}};

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
   //configure pin PD5 to have maximum current output since it is used to drive the SSR
   io_set_config(IO_DRIVE_16mA, io_PD5);
   //configure pin PD5 to have maximum current output since it is used to drive the SSR
   io_set_config(IO_DRIVE_16mA, io_PD6);
   // initialize PD5 (pid_SSR1_output), PD6 (pid_SSR2_output) to be outputs
   // note this also means all other port D pins such as PD3 will be set to inputs >> humidity sensor pin is an input 
   gpio_set_config(0x60 << 8, GPIO_D);
   //set required starting outputs for GPIOD pins

   //configure port J
   //initialize PJ1 (thermocouple_CS_PIN) as an output
   gpio_set_config(0x02 << 8, GPIO_J);
   //set required starting outputs for GPIOJ pins
   //set the CS_TEMP high at the start (Chip select is an active low signal)
	gpio_write(gpio_read(GPIO_J) | 0x02, GPIO_J);

   //configure port H
   // initialize PH0 (button) PH1 (channel A) and PH2 (channel B) as inputs

    uint16_t io_config_flags = IO_PULL_UP | IO_PULL_ENABLE;
    io_set_config(io_config_flags, io_PH);
   //note that by default, pins are set to inputs
}


void * TempThread(void *) {
   while (true){
      sem_lock(0);
      current_temp = getTemp();
      sem_unlock(0);
   }
}

void * RotEncodThread(void *) {
   // struct rotary_encoder rot_encoder = {R_START,0x0};
   while (true){
      sem_lock(3);
      // rot_encoder = rotary_process(rot_encoder);
      // xpd_echo_int(rot_encoder.state, XPD_Flag_SignedDecimal);
      // xpd_puts(" \n");
      // xpd_echo_int(r_encoder.rot_flag, XPD_Flag_UnsignedDecimal);
      // xpd_puts(" \n");
      r_encoder = get_encoder_pos(r_encoder);
      // xpd_echo_int(r_encoder.rot_flag, XPD_Flag_UnsignedDecimal);
      // xpd_puts(" \n");
      sem_unlock(3);
      sem_lock(2);
      btn_press = button_read();
      // xpd_echo_int(btn_press, XPD_Flag_SignedDecimal);
      // xpd_puts(" \n");
      sem_unlock(2);
   }
}

void * PIDThread(void * ) {
   //start the timers for the system
   timer_initialization();

   unsigned int time_count = 0;
   unsigned int output = 0;
   unsigned int pid_status = 1; //start with a PID computation at time 0;
   //initialize the PID controller
   struct Pid pid1;
   struct Pid *pid = &pid1;
   set_pid_parameters(pid, 500, 20, 1);
   while (true) {
      //check to see if 1 second has elapsed to compute a PID action
      pid_status = check_pid(pid_status);
      if (pid_status == 1){
         //compute PID action
         sem_lock(6);
         sem_lock(0);
         // xpd_echo_int(selected_profile.temp_targets[target_temp_index], XPD_Flag_UnsignedDecimal);
         // xpd_puts(" \n");
         output = pid_compute(pid, selected_profile.temp_targets[target_temp_index], current_temp);
         sem_unlock(0);
         //Semaphore unlock 0
         //simulate the change in temperature
         pid_status = 0;
         time_count ++;
         if(time_count == 2){
            //2 seconds has elapsed, increment the target temperature
            target_temp_index ++;
            progress = (target_temp_index + 1)*100/180;
            time_count = 0;
         }
         sem_unlock(6);
      }
      //implement PID action
      heating_action(output);
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

void * stateOLEDThread(void *){
   enum scenario_enum {
      CHANGE_PROFILE,
      DISPLAY_PROGRESS,
      STARTING_PROCESS,
      HUMIDITY_WARNING,
      END_PROCESS
   };
   enum scenario_enum scene = CHANGE_PROFILE;
   
   //start up oled
   OLED_Init_160128RGB();
   //clear oled
   OLED_FillScreen_160128RGB(BLACK);
   while(true){
      switch(scene){
         case CHANGE_PROFILE:
            //print the display page with given profile selection
            sem_lock(4);            
            OLED_profile_page(profile_index);
            // OLED_profile_page(r_encoder.encoder_pos);
            sem_unlock(4);
  
            //check for rotary encoder rotation
            sem_lock(3);
            if(r_encoder.rot_flag == 1){
               //CW rotation detected
               sem_lock(4);
               profile_index = profile_index + 1;
               //ensure that selected profile remains less than 9
               if (profile_index > PROFILE_LIST_SIZE){
                  profile_index = 1;
               }
               sem_unlock(4);
               r_encoder.rot_flag = 0;
            }else if(r_encoder.rot_flag == 2){
               //CCW rotation detected
               sem_lock(4);
               profile_index = profile_index - 1;
               //ensure that the profile remains larger than 1
               if (profile_index < 1){
                  profile_index = PROFILE_LIST_SIZE;
               }
               sem_unlock(4);
               r_encoder.rot_flag = 0;
            }
            sem_unlock(3);
            //check for button press
            sem_lock(2);
            btn_press = button_read();
            if (btn_press==1){
               //change to the next screen
               scene = STARTING_PROCESS;
               OLED_FillScreen_160128RGB(BLACK);// fill screen with black
               // generate the temperature profile depending on which profile has been selected
               // selected_profile = generate_RSS_profile(selected_profile, profile_array[profile_index-1][0], profile_array[profile_index-1][1], profile_array[profile_index-1][2]);
               //duplicating this line resolved screen issues
               // selected_profile = generate_RSS_profile(selected_profile, profile_array[profile_index-1][0], profile_array[profile_index-1][1], profile_array[profile_index-1][2]);
               selected_profile = generate_test_profile(selected_profile);
            }
            sem_unlock(2);
            break;
            

         case STARTING_PROCESS:
            OLED_starting_page();
            //this will be a page that will indicate that we are about to start the heating process
            wait_ms(2000);
            //after a short delay enter the display progress screen
            OLED_FillScreen_160128RGB(BLACK);
            scene = DISPLAY_PROGRESS;
            break;


         case DISPLAY_PROGRESS:
            //lock the temp, humidity and target_temp_index when printing the screen
            sem_lock(0);
            sem_lock(1);
            sem_lock(6);
            OLED_main_page(current_temp, humidity, progress);
            sem_unlock(6);
            sem_unlock(1);
            sem_unlock(0);
            //start the temperature sensor thread
            thread_run(3);
            //start the humidity sensor thread
            thread_run(4);
            //start the PID controller thread
            thread_run(5);
            while(progress < 101){
               //start temperature
               //start humidity thread
               sem_lock(0);
               sem_lock(1);
               sem_lock(6);
               OLED_main_page(current_temp, humidity, progress);
               sem_unlock(6);
               sem_unlock(1);
               sem_unlock(0);
            }
            //stop the temp and humidity and pid threads
            thread_stop(3);
            thread_stop(4);
            thread_stop(5);
            //turn off the heating elements
            gpio_write(gpio_read(GPIO_D)&~(0x20|0x40), GPIO_D);
            scene = END_PROCESS;
            break;
         

         case HUMIDITY_WARNING:
            break;

         case END_PROCESS:
            OLED_end_progress();
            wait_ms(2000);
            scene = CHANGE_PROFILE;
            break;
      }
   }
}
// main() runs in thread 0
int main(void){
   // Configure a pull-up on pin PG0
   // This pull-up prevents an XPD write from stalling execution if
   // there is no XPD attached.
   io_set_config(0b1110011, io_PG0);

   //initialize and configure pins
   InitGPIO();
   
   //setup and run OLED thread
   thread_setup(stateOLEDThread, nullptr, 1);
   thread_run(1);
   //setup and run rotary encoder thread
   thread_setup(RotEncodThread, nullptr, 2);
   thread_run(2);
   //setup temp thread, will activate it later in the code
   thread_setup(TempThread, nullptr, 3);
   //setup humidity thread, will activate it later in the code
   thread_setup(HumidityThread, nullptr, 4);
   //setup PID thread, will activate it later in the code
   thread_setup(PIDThread, nullptr, 5);
   
   return 0;
}
