#include <Timer.h>
#include <XPD.h>

#define PD5 0x20
#define LED_PIN2 0x4

struct Pid {
   unsigned int kp;
   unsigned int ki;
   unsigned int kd;
   signed int prev_error;
   signed int acc_error;
   signed int max_output;
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

void pid_pin_initialization(void){  
   //intitializing PD5 as an output
   gpio_set_config(0x20 << 8, GPIO_D);
   //initialize PH2 as an output
   gpio_set_config(0x4 << 8, GPIO_H);
}

//this function toggles the LED every 2 seconds
unsigned int led_control2(unsigned int led_state){
   if((timer_get_config_ccm(2,TIMER_A)>>15) == 1){
      if (led_state == 0){
         gpio_write(gpio_read(GPIO_D)&~(PD5), GPIO_D);
         led_state = 1;
      }else{
         gpio_write(gpio_read(GPIO_D)|PD5, GPIO_D);
         led_state = 0;
      }
   }
   return led_state;
}

//this function checks to see if 1 second has passed
unsigned int check_pid(unsigned int pid_status){
   if(((timer_get_config(TIMER_A)>>15)|(timer_get_config_ccm(1, TIMER_A)>>15)) == 1){
      pid_status = 1;
   }else{
      pid_status = 0;
   }
   return pid_status;
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
   signed int cur_error;
   signed int error_diff; //this term stores the error difference for derivative action
   signed int output;
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
   }else if(output <0){
      output = 0;
   }
   return output;
}

//This function determines whether the heating elements should be turned on/off 
void heating_action(unsigned int duration){
   //first conver the duration into a cycle count that can be directly compared to the timer cycle count
   unsigned int dur_cycles = duration * 24; //system runs at 24KHz
   if (dur_cycles >= timer_read(TIMER_A)){
      //turn on the heating element
      gpio_write(gpio_read(GPIO_D)|PD5, GPIO_D);
   }else{
      //turn off the heating element
      gpio_write(gpio_read(GPIO_D)&~(PD5), GPIO_D);
   }
}

unsigned int simulate_temp(unsigned int duration, unsigned int cur_temp){
   //approximating 2 degrees/sec increase when element is on and 0.13 degree decrease when the element is off
   //note that these temperatures are in milli degree celsius for the simulated temperature calculation. In the
   //actual system we will be using whole degrees
   unsigned int new_temp;
   unsigned int on_time;
   unsigned int off_time;
   if(timer_read(TIMER_A) < 24000){
      //the action is occuring after the first PID computation in the 2 second window
      if (duration >= 1000){
         on_time = 1000;
         off_time = 0;
      }else{
         on_time = 1000 - duration;
         off_time = 1000 - on_time;
      }
   }else{
      //the action is occuring after the second 'correction' PID computation during the 2 second window
      if (duration >= 1000){
         on_time = duration - 1000;
         off_time = 2000 - duration;
      }else{
         on_time = 0;
         off_time = 1000;
      }
   }
   //calculate the new temperature given the on and off times of the heating elements
   new_temp = cur_temp + ((on_time*5 - off_time)/1000);
   return new_temp;
}