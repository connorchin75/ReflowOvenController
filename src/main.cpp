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

   // set the direction of PD3 to output
    gpio_set_config(0x02 << 8, GPIO_D);
        // 0x02 << 8 = 0000 0010 0000 0000b
        // pins : 7654 3210 0000 0000
        // upper byte is high = output
        // cleared bits = input

    //initialize Pin PA0 to be an output
    gpio_set_config(0x01 << 8, GPIO_A);

    //Configures SPI 0 with the appropriate "best" standard
    SPI_set_config_optimal(sys_freq, SPI0);
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

void * TempThread(void *){
    // read temp
    double current_temp;
    while(true){
        current_temp = getTemp();
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
