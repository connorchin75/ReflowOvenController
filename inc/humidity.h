#include <GPIO.h>
#include <Timer.h>

#define HUMIDITY_PIN 0x08

unsigned int get_input(void){
   unsigned int cur_state;
   cur_state = (HUMIDITY_PIN & gpio_read(GPIO_D)) == HUMIDITY_PIN; // if the input at Humidity pin is high return a 1
   return cur_state;
}

void start_humidity_timer(void){
   timer_set_config(TIMER_MODE_UP|TIMER_CLOCK_RATE_4096|TIMER_ENABLE, TIMER_B);
   //set the CR0 value to have the timer trigger after every 8.3ms or 199 cycles
   timer_write_CCR(0x00C7, 0, TIMER_B);
}

unsigned int rising_edge(void){
   unsigned int tpw_start = 0;
   tpw_start = timer_read(TIMER_B);
   return tpw_start;
}

unsigned int get_humidity(unsigned int tpw_start, unsigned int humidity){
   //read the timer value
   unsigned int tpw_end = 0;
   unsigned int tpw = 0;
   //read the timer to see what the current counter value is at the falling edge
   tpw_end = timer_read(TIMER_B);
   if (tpw_end > tpw_start){
      //this implies that the timer has not reset between tpw_start and tpw_end
      tpw = tpw_end - tpw_start; 
   }else{
      //this section is reached if the counter resets before tpw_end is read
      tpw = (0x00C7 - tpw_start) + tpw_end;
   }
   //calculate humidity
   //scale by 100 to avoid floating points then divide by 199 which is number of counter increments in a period
   //the rest of the formula is taken from the datasheet of the humidity sensor
   humidity = ((100*tpw)/(199))*125/100 -6;
   
   return humidity;
}

