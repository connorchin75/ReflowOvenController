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
   //set the drive strength of PD3 to 16mA
   uint16_t io_config_flags = IO_DRIVE_16mA;
   io_set_config(io_config_flags, io_PD3);
   // configure oled pins
   oled_pin_initialization();
   //oled pin configuration
}

void * ButtonLEDThread(void * ) {
   //This thread will always remain active
  while (true) {
      //this method of setting a bit allows you to only adjust a single bit in the port register
      gpio_write(gpio_read(GPIO_A)|0x20, GPIO_A);
      wait_seconds(1);
      // xpd_echo_int(gpio_read(GPIO_A), XPD_Flag_Hex);
      // xpd_putc('\n');
      //this method of clearing a bit only clears the specific bit
      gpio_write(gpio_read(GPIO_A)&~(0x20), GPIO_A);
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