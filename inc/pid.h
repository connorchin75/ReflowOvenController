#include <Timer.h>
#include <XPD.h>

#define LED_PIN1 0x80
#define LED_PIN2 0x2

struct Pid {
   unsigned int kp;
   unsigned int ki;
   unsigned int kd;
   unsigned int prev_error;
   unsigned int acc_error;
   unsigned int max_output;
};

void timer_initialization(void){
   //initialize timer A and begin counting
   timer_set_config(TIMER_MODE_UP|TIMER_CLOCK_RATE_4096|TIMER_ENABLE, TIMER_A);
   //initialize the compare register for the 1 second counter
   timer_set_config_ccm(TIMER_CCM_COMP_NOT_CAP, 1, TIMER_A);
   //initialize the compare register for the 2 second counter
   timer_set_config_ccm(TIMER_CCM_COMP_NOT_CAP, 2, TIMER_A);
   //set the CR0 value to have the timer trigger after every 2 seconds or 48000 cycles
   timer_write_CCR(0xBB80, 0, TIMER_A);
   //set the CR1 value to trigger every 1 seconds or 24000 cycles
   timer_write_CCR(0x5DC0, 1, TIMER_A);
   //set the CR2 value to trigger every 2 seconds or 48000 cycles
   timer_write_CCR(0xBB80, 2, TIMER_A);
}

//this function toggles the LED every 2 seconds
unsigned int led_control2(unsigned int led_state){
   if((timer_get_config_ccm(2,TIMER_A)>>15) == 1){
      if (led_state == 0){
         gpio_write(gpio_read(GPIO_D)&~(LED_PIN1), GPIO_D);
         led_state = 1;
      }else{
         gpio_write(gpio_read(GPIO_D)|LED_PIN1, GPIO_D);
         led_state = 0;
      }
   }
   return led_state;
}

//this function toggles the LED every 1 second
unsigned int led_control1(unsigned int led_state){
   if(((timer_get_config(TIMER_A)>>15)|(timer_get_config_ccm(1, TIMER_A)>>15)) == 1){
      if (led_state == 0){
         gpio_write(gpio_read(GPIO_J)&~(LED_PIN2), GPIO_J);
         led_state = 1;
      }else{
         gpio_write(gpio_read(GPIO_J)|LED_PIN2, GPIO_J);
         led_state = 0;
      }
   }
   return led_state;
}

void pid_pin_initialization(void){  
   //intitializing PD7 as an output
   gpio_set_config(0x80 << 8, GPIO_D);
   //initialize PJ1 as an output
   gpio_set_config(0x2 << 8, GPIO_J);
}

//use this function to set the PID parameters for PID computation
void set_pid_parameters(struct Pid *pid, unsigned int kp_val,  unsigned int ki_val,  unsigned int kd_val){
    pid->kp = kp_val;
    pid->ki = ki_val;
    pid->kd = kd_val;
    pid->prev_error = 0; //zero out the prev_error value once new PID parameters are set
    pid->acc_error = 0; //zero out the acc_error value once new PID parameters are set
    pid->max_output = 2000;
}

//This function computes the PID action for the controller to take on the next iteration
unsigned int pid_compute(struct Pid *pid, unsigned int target_temp, unsigned int measured_temp){
   unsigned int cur_error;
   unsigned int error_diff; //this term stores the error difference for derivative action
   unsigned int output;
   //calculate the current error between the measured and target temp
   cur_error = target_temp - measured_temp;
   //add the error to the error accumulator for the integral term
   pid->acc_error += cur_error;
   //find the error difference between current and previous PID computations
   error_diff = cur_error - (pid->prev_error);
   //set the previous error term to the current error
   pid->prev_error = cur_error;
   //calculate the controller output value
   output = (pid->kp * cur_error) + (pid->ki * pid->acc_error) + (pid->kd * error_diff);
   //constrain the output to be within the limits
   if (output > pid->max_output){
      output = pid->max_output;
   }
   if (output < 0){
      output = 0;
   }
   return output;
}