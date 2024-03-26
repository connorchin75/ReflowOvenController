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
volatile unsigned int progress = 0; //semaphore 7 this is a scaled version of target_temp
struct profile selected_profile;
volatile unsigned int progress_scaler = 141;
struct profile* temp_ptr = &selected_profile;
volatile unsigned int print_humidity = 0; //semaphore 8

//define possible temperature curve parameters
unsigned int profile_array[PROFILE_LIST_SIZE][6] = {{30, 120, 210, 5, 1, 2}, {90, 180, 240, 3, 0, 3}, {90, 180, 232, 2, 0, 2}};
/// Configures GPIO to be Input/Output, io cell configuration, and clock frequency
void InitGPIO(){
   //set the system clock to 98.304 MHz 
   sys_clock_init(crys_24_576_MHz, _98_304_MHz);
   //initialize SPI1 as a master device, at 98.304 MHz, with clock rate divided by 16 and enable the SPI1 device
   SPI_set_config_optimal(_98_304_MHz,SPI1);
   
   // configure GPIO pins

   //configure port A
   //initialize PA0 (oled_RES_PIN), PA1 (oled_RS_PIN), PA2 (oled_CS_PIN), PA3(TESTING PIN) and PA7 (humidity_select_pin) as outputs 
   gpio_set_config(0x87 << 8, GPIO_A);
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
      //scale the temperature according to calibration equation
      current_temp = (current_temp * 109 - 283)/100;
      sem_unlock(0);
   }
}

void * RotEncodThread(void *) {
   // struct rotary_encoder rot_encoder = {R_START,0x0};
   while (true){
      sem_lock(3);
      r_encoder = get_encoder_pos(r_encoder);
      sem_unlock(3);
      sem_lock(2);
      btn_press = button_read();
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
   sem_lock(7); //reset the progress counter at each start of the thread
   progress = 0;
   sem_unlock(7);

   set_pid_parameters(pid, 250, 2, 280);
   //max of proportional term should be around 120
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
            sem_lock(7); //progress
            progress = (target_temp_index + 1)*100/progress_scaler;
            sem_unlock(7);
            time_count = 0;
            sem_lock(8);
            print_humidity = 1;
            sem_unlock(8);
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
         sem_lock(1);
         humidity = get_humidity(tpw_start, humidity);
         sem_unlock(1);
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
      HUMIDITY_CHECK,
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
            OLED_profile_times(profile_array[profile_index-1]);
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
               scene = HUMIDITY_CHECK;
               OLED_FillScreen_160128RGB(BLACK);// fill screen with black
               // generate the temperature profile depending on which profile has been selected
               //generate_RSS_profile(temp_ptr, profile_array[profile_index-1][0], profile_array[profile_index-1][1], profile_array[profile_index-1][2], profile_array[profile_index-1][3], profile_array[profile_index-1][4], profile_array[profile_index-1][5]);
               // generate_RSS_profile(temp_ptr, 30, 120, 210, 5, 1, 2);
               switch(profile_index){
                  case 1:
                     generate_RSS_profile1(temp_ptr);
                  break;
                  
                  case 2:
                     generate_RSS_profile2(temp_ptr);
                  break;

                  case 3:
                     generate_RSS_profile3(temp_ptr);
                  break;
               }//end switch statement
               // selected_profile = generate_test_profile(selected_profile);
               //do a check to see whether the profile is shorter than 240s 
               // if ((profile_array[profile_index-1][2]) < 240){
               //    progress_scaler = (profile_array[profile_index-1][2])/2;
               // }
            }
            sem_unlock(2);
            break;
         
         case HUMIDITY_CHECK:
            sem_lock(1);
            if (humidity > 60){
               OLED_display_warning();
               OLED_update_humidity(humidity); //display the humidity
               sem_unlock(1);
               wait_ms(100);
               OLED_acknowledge();
               //check for button press
               sem_lock(2);
               btn_press = button_read();
               if (btn_press == 1){
                  sem_unlock(2);
                  scene = STARTING_PROCESS;
                  wait_ms(500);
                  OLED_FillScreen_160128RGB(BLACK);                // fill screen with black
               }
               sem_unlock(2);
            }else{
               sem_unlock(1);
               scene = STARTING_PROCESS;
            }
            break;


         case STARTING_PROCESS:
            OLED_starting_page();
            //this will be a page that will indicate that we are about to start the heating process

            //start the temperature sensor thread
            thread_run(3);
            //let the temperature sensor boot up
            wait_ms(1000);
            sem_lock(0);
            //verify that temperature is less than 100 before turning on the heating elements
            if (current_temp < 100){
               //turn on both heating elements to begin preheating.
               gpio_write(gpio_read(GPIO_D)|(PD5|PD6), GPIO_D);
            }
            sem_unlock(0);
            wait_ms(1000);
            //after a short delay enter the display progress screen
            OLED_FillScreen_160128RGB(BLACK);
            scene = DISPLAY_PROGRESS;
            break;
            

         case DISPLAY_PROGRESS:
            //lock the temp, humidity and target_temp_index when printing the screen
            sem_lock(0);
            sem_lock(1);
            sem_lock(6);
            // OLED_main_page(current_temp, humidity, progress);
            sem_lock(4);
            OLED_display_progress(profile_index);
            sem_unlock(4);
            
            sem_unlock(6);
            sem_unlock(1);
            sem_unlock(0);
            //start the humidity sensor thread
            thread_run(4);
            //start the PID controller thread
            thread_run(5);
            while((progress < 101) && (scene == DISPLAY_PROGRESS)){
               //start temperature
               //start humidity thread
               sem_lock(0);
               sem_lock(6);

               //check for button press
               sem_lock(2);
               if (btn_press == 1){
                  scene = END_PROCESS;
               }
               sem_unlock(2);

               sem_lock(7);
               OLED_update_progress(progress);
               sem_unlock(7);

               OLED_update_temp(current_temp);
               
               //only update humidity every 2 seconds
               sem_lock(8);
               if(print_humidity == 1){
                  sem_lock(1);
                  OLED_update_humidity(humidity);
                  sem_unlock(1);
                  print_humidity = 0;
               }
               sem_unlock(8);
               sem_unlock(6);
               sem_unlock(0);
            }
            //stop the temp and humidity and pid threads
            thread_stop(3);
            thread_stop(4);
            thread_stop(5);
            //turn off the heating elements
            gpio_write(gpio_read(GPIO_D)&~(PD5|PD6), GPIO_D);

            scene = END_PROCESS;
            
            OLED_FillScreen_160128RGB(BLACK);                // fill screen with black
            break;
                

         case END_PROCESS:
            OLED_end_progress();
            wait_ms(100);
            OLED_acknowledge();
            // check for button press
            sem_lock(2);
            btn_press = button_read();
            if (btn_press == 1){
               scene = CHANGE_PROFILE;
               wait_ms(1000); //this will help avoid detecting two btn presses
               OLED_FillScreen_160128RGB(BLACK);                // fill screen with black
            }
            sem_unlock(2);
            // scene = CHANGE_PROFILE;
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
