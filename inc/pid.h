#include <Timer.h>
#include <XPD.h>
#include "wait.h"

#define PD5 0x20
#define PD6 0x40

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
   if((pid->acc_error + cur_error) > 210){
      pid->acc_error = 210;
   }else if((pid->acc_error + cur_error) < -210){
      pid->acc_error = -210;
   }
   else{
      pid->acc_error += cur_error;
   }
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
   // xpd_puts("Total Output:");
   // xpd_echo_int(output, XPD_Flag_SignedDecimal);
   // xpd_puts(" \n");

   // xpd_puts("Proportional Output:");
   // xpd_echo_int(pid->kp * cur_error, XPD_Flag_SignedDecimal);
   // xpd_puts(" \n");

   // xpd_puts("Integral Output:");
   // xpd_echo_int(pid->ki * pid->acc_error, XPD_Flag_SignedDecimal);
   // xpd_puts(" \n");

   // xpd_puts("Derivative Output:");
   // xpd_echo_int(pid->kd * error_diff, XPD_Flag_SignedDecimal);
   // xpd_puts(" \n");
   // xpd_puts("Current Temp:");
   // xpd_echo_int(measured_temp, XPD_Flag_UnsignedDecimal);
   // xpd_puts(" \n");
   // xpd_puts("Target Temp:");
   // xpd_echo_int(target_temp, XPD_Flag_UnsignedDecimal);
   // xpd_puts(" \n");
   
   return output;
}

//This function determines whether the heating elements should be turned on/off 
void heating_action(unsigned int duration){
   //first convert the duration into a cycle count that can be directly compared to the timer cycle count
   unsigned int dur_cycles = duration * 24; //system runs at 24KHz
   if (dur_cycles >= timer_read(TIMER_A)){
      //turn on both heating elements
      gpio_write(gpio_read(GPIO_D)|(PD5|PD6), GPIO_D);
   }else{
      //turn off both heating elements
      gpio_write(gpio_read(GPIO_D)&~(PD5|PD6), GPIO_D);
   }
}