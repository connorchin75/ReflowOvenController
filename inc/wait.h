#ifndef __WAIT_H__
#define __WAIT_H__

#include <SystemClock.h>

// Only works correctly at 98.304 MHz clock rate

void wait_ms(uint16_t ms) {
  for (uint16_t i = 0; i < ms; i++) {
    for (uint16_t j = 0; j < 1000; j++) {
      sys_clock_wait(48304);
      sys_clock_wait(50000);
    }
  }
}

void wait_seconds(uint16_t seconds) {
  for (uint16_t i = 0; i < seconds; i++)
    wait_ms(1000);
}

// sys_clock_wait can only wait a maximum of 65535 ticks
// use a loop to get a longer delay.
void long_wait()
{
  for (int i = 0; i < 5000; ++i) {
    sys_clock_wait(10000);
  }
}

#endif // _WAIT_H_ 