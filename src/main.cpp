#include <SystemClock.h>
#include <IOConfig.h>
#include <XPD.h>
#include <GPIO.h>
#include <Thread.h>

#include "wait.h"
#include "oled.h"

/// Configures GPIO to be Input/Output, io cell configuration, and clock frequency
void InitGPIO(){
   //set the system clock to 98.304 MHz 
   sys_clock_init(crys_24_576_MHz, _98_304_MHz);
   // configure oled pins
   oled_pin_initialization();
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

// main() runs in thread 0
int main(void){
   // Configure a pull-up on pin PG0
  // This pull-up prevents an XPD write from stalling execution if
  // there is no XPD attached.
  io_set_config(0b1110011, io_PG0);

  InitGPIO();

  thread_setup(OLEDThread, nullptr, 1);
  thread_run(1);
}