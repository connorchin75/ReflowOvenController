#include <SystemClock.h>
#include <IOConfig.h>
#include <XPD.h>
#include <GPIO.h>
#include <Thread.h>

#include "wait.h"
#include "oled.h"
#include "thermocouple.h"
#include "pid.h"

/// Configures GPIO to be Input/Output, io cell configuration, and clock frequency
void InitGPIO(){
   //set the system clock to 98.304 MHz 
   sys_clock_init(crys_24_576_MHz, _98_304_MHz);
   //initialize SPI1 as a master device, at 98.304 MHz, with clock rate divided by 16 and enable the SPI1 device
   SPI_set_config_optimal(_98_304_MHz,SPI1);
   // configure oled pins
   oled_pin_initialization();
   //config thermocouple pins
   thermocouple_pin_init();
   // configuration for pid
   pid_pin_initialization();
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

   thread_setup(OLEDThread, nullptr, 1);
   thread_run(1);
   thread_setup(TempThread, nullptr, 2);
   thread_run(2);
   thread_setup(PIDThread, nullptr, 3);
   thread_run(3);
   return 0;
}