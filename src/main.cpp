#include <SystemClock.h>
#include <IOConfig.h>
#include <XPD.h>
#include <GPIO.h>
#include <Thread.h>

#include "wait.h"

/// Configures GPIO to be Input/Output as well as io cell configuration
void InitGPIO(){
   //set the drive strength of PD3 to 16mA
   uint16_t io_config_flags = IO_DRIVE_16mA;
   io_set_config(io_config_flags, io_PD3);
   // set the direction of PD3 to output
   gpio_set_config(0x02 << 8, GPIO_D);
}

void * ButtonLEDThread(void * ) {
   //This thread will always remain active
  while (true) {
      gpio_write(0x02, GPIO_D);
      wait_seconds(1);
      gpio_write(0x0, GPIO_D);
      wait_seconds(1);
      }
  }

// main() runs in thread 0
int main(void){
   // Configure a pull-up on pin PG0
  // This pull-up prevents an XPD write from stalling execution if
  // there is no XPD attached.
  io_set_config(0b1110011, io_PG0);

  InitGPIO();

  thread_setup(ButtonLEDThread, nullptr, 1);
  thread_run(1);
}