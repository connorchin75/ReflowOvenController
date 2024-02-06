#include <SystemClock.h>
#include <IOConfig.h>
#include <GPIO.h>
#include <SPI.h>
#include <XPD.h>

#include "wait.h"


#define channel_A 0x04
#define channel_B 0x02
#define button 0x01
// PH2 is B
// PH1 is A
// PH0 is button 
void_pin_init{
    //gpio_set_config(channel_A << 8, GPIOA);
    //gpio_set_config(channel_B << 8, GPIOA);
    //gpio_set_config(button << 8, GPIOA);
    uint16_t config_value=0
    config_value= (io_get_config(io_PH)) | 0x60 ;
    // 0x60 corresponds to 1100000 which will turn on pull up

    io_set_config(config_value, io_PH);

    
}

void rotary_encoder_read(void){
unsigned int PinALast = 0;
unsigned int PinA =0;
unsigned int encoder_pos =0;
PinA = (gpio_read(GPIO_H) & channel_A);
if ((PinALast != channel_A) && (PinA == channel_A)){
    // if PinALast is low, Pin A is high - rising edge detected 
    if((gpio_read(GPIO_H) & channel_B) != channel_B){
        encoder_pos=encoder_pos+1;
        // if PinB is low, that means A rising edge occured first and encoder moved cw
    }
    else{
        encoder_pos=encoder_pos-1;
        //if PinB is high, that means B rising edge occured first and encoder move ccw
    }
    
}
PinAlast=PinA;
return encoder_pos;

}


void button_read(void){
    unsigned int button_press=0;
    if ((gpio_read(GPIO_H) & button)== button){
        button_press=0;
        // if reads high - button has NOT been pressed
    }
    else{
        button_press=1;
        // if reads low - button has been pressed

    }
    return button_press
}