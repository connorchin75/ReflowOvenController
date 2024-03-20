#include <SystemClock.h>
#include <IOConfig.h>
#include <GPIO.h>
#include <SPI.h>
#include <XPD.h>

#include "wait.h"

#define channel_A 0x01
#define channel_B 0x02
#define button 0x04
// PH2 is B
// PH1 is A
// PH0 is button 

// define a rotary encoder structure
struct rotary_encoder{
    volatile signed char encoder_pos;
    volatile unsigned char prev_pinstate;
    volatile unsigned int rot_flag;
};

unsigned int button_read(void){
    unsigned int button_press=0;
    if ((gpio_read(GPIO_H) & button)== button){
        button_press = 0;
        // if reads high - button has not been pressed
    }
    else{
        button_press = 1;
        // if reads low - button has been pressed
    }
    return button_press;
}

//this get_encoder_pos function was developed with the assistance of Jason Shukla in Group X
struct rotary_encoder get_encoder_pos(struct rotary_encoder encoder1){
    unsigned char pinstate = ((gpio_read(GPIO_H) & channel_B) | (gpio_read(GPIO_H) & channel_A));
    if(pinstate != encoder1.prev_pinstate){
        switch(encoder1.prev_pinstate){
            case 0:
                if (pinstate == 1) {encoder1.encoder_pos++;}
                if (pinstate == 2) {encoder1.encoder_pos--;}
                break;
            case 1:
                if (pinstate == 3) {encoder1.encoder_pos++;}
                if (pinstate == 0) {encoder1.encoder_pos--;}
                break;
            case 2:
                if (pinstate == 0) {encoder1.encoder_pos++;}
                if (pinstate == 3) {encoder1.encoder_pos--;}
                break;
            case 3:
                if (pinstate == 2) {encoder1.encoder_pos++;}
                if (pinstate == 1) {encoder1.encoder_pos--;}
                break;
        }//end switch statement
        encoder1.prev_pinstate = pinstate;
    }// end if statement
    if(encoder1.encoder_pos > 3){
        //CW rotation detected
        encoder1.rot_flag = 1;
        encoder1.encoder_pos = 0;
    }else if(encoder1.encoder_pos < -3){
        //CCW rotation detected
        encoder1.rot_flag = 2;
        encoder1.encoder_pos = 0;
    }
    return encoder1;
}