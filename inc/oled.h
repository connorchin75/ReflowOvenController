#include <SystemClock.h>
#include <IOConfig.h>
#include <GPIO.h>
#include <SPI.h>
#include <XPD.h>

#include "wait.h"


//Define pin names as their bit shifted positions to improve code readability
#define CS_PIN 0x04 
#define RS_PIN 0x02
#define RES_PIN 0x01
#define SHDN_PIN 0x10

//Define colours as using 16 bit values
#define     RED  0x001F
#define   GREEN  0x1F00
#define    BLUE  0xF800
#define   WHITE  0xFFFF
#define   BLACK  0x0000

/*********************************/
/******** FONT TABLE 5x8 *********/
/************* START *************/
/*********************************/

// unsigned char arrow[2][5] = {{0x18,0x3C,0x7E,0x18,0x18},{0x18,0x18,0x7E,0x3C,0x18}};

unsigned char Ascii_1[105][5] = {     // Refer to "Times New Roman" Font Database...
                        //   Basic Characters
    {0x00,0x00,0x00,0x00,0x00},     //   (  0)    - 0x0000 Empty set
    {0x00,0x00,0x4F,0x00,0x00},     //   (  1)  ! - 0x0021 Exclamation Mark
    {0x00,0x07,0x00,0x07,0x00},     //   (  2)  " - 0x0022 Quotation Mark
    {0x14,0x7F,0x14,0x7F,0x14},     //   (  3)  # - 0x0023 Number Sign
    {0x24,0x2A,0x7F,0x2A,0x12},     //   (  4)  $ - 0x0024 Dollar Sign
    {0x23,0x13,0x08,0x64,0x62},     //   (  5)  % - 0x0025 Percent Sign
    {0x36,0x49,0x55,0x22,0x50},     //   (  6)  & - 0x0026 Ampersand
    {0x00,0x05,0x03,0x00,0x00},     //   (  7)  ' - 0x0027 Apostrophe
    {0x00,0x1C,0x22,0x41,0x00},     //   (  8)  ( - 0x0028 Left Parenthesis
    {0x00,0x41,0x22,0x1C,0x00},     //   (  9)  ) - 0x0029 Right Parenthesis
    {0x14,0x08,0x3E,0x08,0x14},     //   ( 10)  * - 0x002A Asterisk
    {0x08,0x08,0x3E,0x08,0x08},     //   ( 11)  + - 0x002B Plus Sign
    {0x00,0x50,0x30,0x00,0x00},     //   ( 12)  , - 0x002C Comma
    {0x08,0x08,0x08,0x08,0x08},     //   ( 13)  - - 0x002D Hyphen-Minus
    {0x00,0x60,0x60,0x00,0x00},     //   ( 14)  . - 0x002E Full Stop
    {0x20,0x10,0x08,0x04,0x02},     //   ( 15)  / - 0x002F Solidus
    {0x3E,0x51,0x49,0x45,0x3E},     //   ( 16)  0 - 0x0030 Digit Zero
    {0x00,0x42,0x7F,0x40,0x00},     //   ( 17)  1 - 0x0031 Digit One
    {0x42,0x61,0x51,0x49,0x46},     //   ( 18)  2 - 0x0032 Digit Two
    {0x21,0x41,0x45,0x4B,0x31},     //   ( 19)  3 - 0x0033 Digit Three
    {0x18,0x14,0x12,0x7F,0x10},     //   ( 20)  4 - 0x0034 Digit Four
    {0x27,0x45,0x45,0x45,0x39},     //   ( 21)  5 - 0x0035 Digit Five
    {0x3C,0x4A,0x49,0x49,0x30},     //   ( 22)  6 - 0x0036 Digit Six
    {0x01,0x71,0x09,0x05,0x03},     //   ( 23)  7 - 0x0037 Digit Seven
    {0x36,0x49,0x49,0x49,0x36},     //   ( 24)  8 - 0x0038 Digit Eight
    {0x06,0x49,0x49,0x29,0x1E},     //   ( 25)  9 - 0x0039 Dight Nine
    {0x00,0x36,0x36,0x00,0x00},     //   ( 26)  : - 0x003A Colon
    {0x00,0x56,0x36,0x00,0x00},     //   ( 27)  ; - 0x003B Semicolon
    {0x08,0x14,0x22,0x41,0x00},     //   ( 28)  < - 0x003C Less-Than Sign
    {0x14,0x14,0x14,0x14,0x14},     //   ( 29)  = - 0x003D Equals Sign
    {0x00,0x41,0x22,0x14,0x08},     //   ( 30)  > - 0x003E Greater-Than Sign
    {0x02,0x01,0x51,0x09,0x06},     //   ( 31)  ? - 0x003F Question Mark
    {0x32,0x49,0x79,0x41,0x3E},     //   ( 32)  @ - 0x0040 Commercial At
    {0x7E,0x11,0x11,0x11,0x7E},     //   ( 33)  A - 0x0041 Latin Capital Letter A
    {0x7F,0x49,0x49,0x49,0x36},     //   ( 34)  B - 0x0042 Latin Capital Letter B
    {0x3E,0x41,0x41,0x41,0x22},     //   ( 35)  C - 0x0043 Latin Capital Letter C
    {0x7F,0x41,0x41,0x22,0x1C},     //   ( 36)  D - 0x0044 Latin Capital Letter D
    {0x7F,0x49,0x49,0x49,0x41},     //   ( 37)  E - 0x0045 Latin Capital Letter E
    {0x7F,0x09,0x09,0x09,0x01},     //   ( 38)  F - 0x0046 Latin Capital Letter F
    {0x3E,0x41,0x49,0x49,0x7A},     //   ( 39)  G - 0x0047 Latin Capital Letter G
    {0x7F,0x08,0x08,0x08,0x7F},     //   ( 40)  H - 0x0048 Latin Capital Letter H
    {0x00,0x41,0x7F,0x41,0x00},     //   ( 41)  I - 0x0049 Latin Capital Letter I
    {0x20,0x40,0x41,0x3F,0x01},     //   ( 42)  J - 0x004A Latin Capital Letter J
    {0x7F,0x08,0x14,0x22,0x41},     //   ( 43)  K - 0x004B Latin Capital Letter K
    {0x7F,0x40,0x40,0x40,0x40},     //   ( 44)  L - 0x004C Latin Capital Letter L
    {0x7F,0x02,0x0C,0x02,0x7F},     //   ( 45)  M - 0x004D Latin Capital Letter M
    {0x7F,0x04,0x08,0x10,0x7F},     //   ( 46)  N - 0x004E Latin Capital Letter N
    {0x3E,0x41,0x41,0x41,0x3E},     //   ( 47)  O - 0x004F Latin Capital Letter O
    {0x7F,0x09,0x09,0x09,0x06},     //   ( 48)  P - 0x0050 Latin Capital Letter P
    {0x3E,0x41,0x51,0x21,0x5E},     //   ( 49)  Q - 0x0051 Latin Capital Letter Q
    {0x7F,0x09,0x19,0x29,0x46},     //   ( 50)  R - 0x0052 Latin Capital Letter R
    {0x46,0x49,0x49,0x49,0x31},     //   ( 51)  S - 0x0053 Latin Capital Letter S
    {0x01,0x01,0x7F,0x01,0x01},     //   ( 52)  T - 0x0054 Latin Capital Letter T
    {0x3F,0x40,0x40,0x40,0x3F},     //   ( 53)  U - 0x0055 Latin Capital Letter U
    {0x1F,0x20,0x40,0x20,0x1F},     //   ( 54)  V - 0x0056 Latin Capital Letter V
    {0x3F,0x40,0x38,0x40,0x3F},     //   ( 55)  W - 0x0057 Latin Capital Letter W
    {0x63,0x14,0x08,0x14,0x63},     //   ( 56)  X - 0x0058 Latin Capital Letter X
    {0x07,0x08,0x70,0x08,0x07},     //   ( 57)  Y - 0x0059 Latin Capital Letter Y
    {0x61,0x51,0x49,0x45,0x43},     //   ( 58)  Z - 0x005A Latin Capital Letter Z
    {0x00,0x7F,0x41,0x41,0x00},     //   ( 59)  [ - 0x005B Left Square Bracket
    {0x02,0x04,0x08,0x10,0x20},     //   ( 60)  \ - 0x005C Reverse Solidus
    {0x00,0x41,0x41,0x7F,0x00},     //   ( 61)  ] - 0x005D Right Square Bracket
    {0x04,0x02,0x01,0x02,0x04},     //   ( 62)  ^ - 0x005E Circumflex Accent
    {0x40,0x40,0x40,0x40,0x40},     //   ( 63)  _ - 0x005F Low Line
    {0x01,0x02,0x04,0x00,0x00},     //   ( 64)  ` - 0x0060 Grave Accent
    {0x20,0x54,0x54,0x54,0x78},     //   ( 65)  a - 0x0061 Latin Small Letter A
    {0x7F,0x48,0x44,0x44,0x38},     //   ( 66)  b - 0x0062 Latin Small Letter B
    {0x38,0x44,0x44,0x44,0x20},     //   ( 67)  c - 0x0063 Latin Small Letter C
    {0x38,0x44,0x44,0x48,0x7F},     //   ( 68)  d - 0x0064 Latin Small Letter D
    {0x38,0x54,0x54,0x54,0x18},     //   ( 69)  e - 0x0065 Latin Small Letter E
    {0x08,0x7E,0x09,0x01,0x02},     //   ( 70)  f - 0x0066 Latin Small Letter F
    {0x06,0x49,0x49,0x49,0x3F},     //   ( 71)  g - 0x0067 Latin Small Letter G
    {0x7F,0x08,0x04,0x04,0x78},     //   ( 72)  h - 0x0068 Latin Small Letter H
    {0x00,0x44,0x7D,0x40,0x00},     //   ( 73)  i - 0x0069 Latin Small Letter I
    {0x20,0x40,0x44,0x3D,0x00},     //   ( 74)  j - 0x006A Latin Small Letter J
    {0x7F,0x10,0x28,0x44,0x00},     //   ( 75)  k - 0x006B Latin Small Letter K
    {0x00,0x41,0x7F,0x40,0x00},     //   ( 76)  l - 0x006C Latin Small Letter L
    {0x7C,0x04,0x18,0x04,0x7C},     //   ( 77)  m - 0x006D Latin Small Letter M
    {0x7C,0x08,0x04,0x04,0x78},     //   ( 78)  n - 0x006E Latin Small Letter N
    {0x38,0x44,0x44,0x44,0x38},     //   ( 79)  o - 0x006F Latin Small Letter O
    {0x7C,0x14,0x14,0x14,0x08},     //   ( 80)  p - 0x0070 Latin Small Letter P
    {0x08,0x14,0x14,0x18,0x7C},     //   ( 81)  q - 0x0071 Latin Small Letter Q
    {0x7C,0x08,0x04,0x04,0x08},     //   ( 82)  r - 0x0072 Latin Small Letter R
    {0x48,0x54,0x54,0x54,0x20},     //   ( 83)  s - 0x0073 Latin Small Letter S
    {0x04,0x3F,0x44,0x40,0x20},     //   ( 84)  t - 0x0074 Latin Small Letter T
    {0x3C,0x40,0x40,0x20,0x7C},     //   ( 85)  u - 0x0075 Latin Small Letter U
    {0x1C,0x20,0x40,0x20,0x1C},     //   ( 86)  v - 0x0076 Latin Small Letter V
    {0x3C,0x40,0x30,0x40,0x3C},     //   ( 87)  w - 0x0077 Latin Small Letter W
    {0x44,0x28,0x10,0x28,0x44},     //   ( 88)  x - 0x0078 Latin Small Letter XFF
    {0x0C,0x50,0x50,0x50,0x3C},     //   ( 89)  y - 0x0079 Latin Small Letter Y
    {0x44,0x64,0x54,0x4C,0x44},     //   ( 90)  z - 0x007A Latin Small Letter Z
    {0x00,0x08,0x36,0x41,0x00},     //   ( 91)  { - 0x007B Left Curly Bracket
    {0x00,0x00,0x7F,0x00,0x00},     //   ( 92)  | - 0x007C Vertical Line
    {0x00,0x41,0x36,0x08,0x00},     //   ( 93)  } - 0x007D Right Curly Bracket
    {0x02,0x01,0x02,0x04,0x02},     //   ( 94)  ~ - 0x007E Tilde
    {0x08,0x0C,0x0E,0x0C,0x08},     //   ( 95)  upward facing triangle/arrow
    {0x08,0x18,0x38,0x18,0x08},     //   ( 96)  downward facing triangle/arrow
    {0x00,0x0F,0x09,0x09,0x0F},      //   ( 97)  degree symbol
    {0x18,0x3C,0x7E,0x18,0x18},      // ( 98) left arrow
    {0x18,0x18,0x7E,0x3C,0x18},      // (99) right arrow
    {0x1C,0x22,0xC1,0x22,0x1C},         //(100) pal, head
    {0x02,0x04,0xFF,0x04,0x02},         //(101) stretched pal, body
    {0x02,0x01,0x00,0x01,0x02},         //(102) stretched pal, legs
    {0x18,0x04,0xFF,0x04,0x18},         //(103) compact pal, body
    {0x00,0x0F,0x00,0x0F,0x00},         //(104) compact pal, legs

};

/*===============================*/
/*======= FONT TABLE 5x8 ========*/
/*============= END =============*/
/*===============================*/

//This function takes in a single digit and outputs the coresponding ascii index
int Num_To_ASCII(unsigned int num)
{
    unsigned int ascii_index = 100; //starts as an invalid entry
    //0 to 9 maps from 16 to 25
    switch (num){
        case 0:
            ascii_index = 16;
            break;
        case 1:
            ascii_index = 17;
            break;
        case 2:
            ascii_index = 18;
            break;
        case 3:
            ascii_index = 19;
            break;
        case 4:
            ascii_index = 20;
            break;
        case 5:
            ascii_index = 21;
            break;
        case 6:
            ascii_index = 22;
            break;
        case 7:
            ascii_index = 23;
            break;
        case 8:
            ascii_index = 24;
            break;
        case 9:
            ascii_index = 25;
            break;     
    }
    return ascii_index;
}

//This function takes in a single letter and outputs the coresponding ascii index. case insensitive.
int char_to_ASCII(char entry){
    unsigned int ascii_index = 99; //starts as an invalid entry
    //a to z maps from 65 to 90
    //A to Z maps to 33 to 58
    //0 to 9 maps to 16 to 25
    //space to / maps to 0 to 15

    if (entry >= 'a' && entry <= 'z') { // Lowercase letters
        ascii_index = entry - 'a' + 65;
    } else if (entry >= 'A' && entry <= 'Z') { // Uppercase letters
        ascii_index = entry - 'A' + 33;
    }else if (entry >= '0' && entry <='9'){
        //handling numeral conversion
        ascii_index = entry - '0' + 16;
    }else if (entry >= ':'){
        //handling special characters
        ascii_index = 26;
    }else if (entry >= ' ' && entry <='/'){
        //handling special characters
        ascii_index = entry - ' ';
    }
     return ascii_index;
}

/*********************************/
/****** LOW LEVEL FUNCTIONS ******/
/************* START *************/
/*********************************/

//Function to send OLED commands
void OLED_Command_160128RGB(unsigned char c)        // send command to OLED
{  
   //write the CS_PIN low to set the oled as the active device
   gpio_write(gpio_read(GPIO_A)&~(CS_PIN), GPIO_A);
   //set the RS_PIN low to signal a command being sent
   gpio_write(gpio_read(GPIO_A)&~(RS_PIN), GPIO_A);
   //Send end out the 8 bits of data required to execute the command via SPI
   SPI_write(c, SPI1);
   //write the CS_PIN high to disable the device after the transaction
   gpio_write(gpio_read(GPIO_A)|(CS_PIN), GPIO_A);
}

//Function to send data to the OLED
void OLED_Data_160128RGB(unsigned char d)        // send data to OLED
{ 
   //write the CS_PIN low to set the oled as the active device
   gpio_write(gpio_read(GPIO_A)&~(CS_PIN), GPIO_A);
   //set the RS_PIN high to signal data being sent
   gpio_write(gpio_read(GPIO_A)|(RS_PIN), GPIO_A);
   //Send end out the 8 bits of data required to execute the command via SPI
   SPI_write(d, SPI1);
   //write the CS_PIN high to disable the device after the transaction
   gpio_write(gpio_read(GPIO_A)|(CS_PIN), GPIO_A);
}

//Function to set the starting column location and ending column location
void OLED_SetColumnAddress_160128RGB(unsigned char x_start, unsigned char x_end)    // set column address start + end
{
    OLED_Command_160128RGB(0x17);
    OLED_Data_160128RGB(x_start);
    OLED_Command_160128RGB(0x18);
    OLED_Data_160128RGB(x_end);
}

//Function to set the starting and ending row location
void OLED_SetRowAddress_160128RGB(unsigned char y_start, unsigned char y_end){    // set row address start + end
    OLED_Command_160128RGB(0x19);
    OLED_Data_160128RGB(y_start);
    OLED_Command_160128RGB(0x1A);
    OLED_Data_160128RGB(y_end);
}

//Function to begin writing to the RAM which then writes to the OLED screen
void OLED_WriteMemoryStart_160128RGB(void){   // write to RAM command

    OLED_Command_160128RGB(0x22);
}

//Function to write a single pixel to the OLED
void OLED_Pixel_160128RGB(unsigned long color){    // write one pixel of a given color

   OLED_Data_160128RGB((color>>8));
   OLED_Data_160128RGB((color));
}

//Function to set the cursor position
void OLED_SetPosition_160128RGB(unsigned char x_pos, unsigned char y_pos){    // set x,y address

    OLED_Command_160128RGB(0x20);
    OLED_Data_160128RGB(x_pos);
    OLED_Command_160128RGB(0x21);
    OLED_Data_160128RGB(y_pos);
}

//Function to fill the screen with a given colour
void OLED_FillScreen_160128RGB(unsigned long colour){    // fill screen with a given color

    unsigned int i;
    OLED_SetPosition_160128RGB(0,0);
    OLED_WriteMemoryStart_160128RGB();
    for(i=0;i<20480;i++){
        OLED_Pixel_160128RGB(colour);
    }
}

/*===============================*/
/*===== LOW LEVEL FUNCTIONS =====*/
/*============= END =============*/
/*===============================*/

/*********************************/
/***** HIGH LEVEL FUNCTIONS ******/
/************ START **************/
/*********************************/

//Function to print out a single character to a given position
void OLED_Text_160128RGB(unsigned char x_pos, unsigned char y_pos, unsigned char letter, unsigned long textColour, unsigned long backgroundColour){  // function to show text
    int i;
    int count;
    unsigned char mask = 0x80;
    
    for(i=0;i<8;i++){     // each character is 8 pixels tall
    
        OLED_SetPosition_160128RGB(x_pos,y_pos);
        OLED_WriteMemoryStart_160128RGB();
        for (count=0;count<5;count++){    // each character is 5 pixels wide
            if((Ascii_1[letter][count] & mask) == mask)
                OLED_Pixel_160128RGB(textColour);
            else
                OLED_Pixel_160128RGB(backgroundColour);
        }
        y_pos++;
        mask = mask >> 1;
   }
}

//Function to print out a single character of a larger size at a position in the OLED
void OLED_Text2x_160128RGB(unsigned char x_pos, unsigned char y_pos, unsigned char letter, unsigned long textColor, unsigned long backgroundColor){  // function to show text (2x size){
    int i;
    unsigned int count;
    unsigned char mask = 0x80;

    for(i=1;i<=16;i++){     // each character is 16 pixels tall
        OLED_SetPosition_160128RGB(x_pos,y_pos);
        OLED_WriteMemoryStart_160128RGB();
        for (count=0;count<10;count++){    // each character is 10 pixels wide
            if((Ascii_1[letter][(count>>1)] & mask) == mask)
                OLED_Pixel_160128RGB(textColor);
            else
                OLED_Pixel_160128RGB(backgroundColor);
        }
        y_pos++;

        if((i%2)==0){
          mask = mask >> 1;
        }
   }
}

//Prints a data value to the OLED (selection == 0 for temperature. selection == 1 for humidity or progress. selection == 2 for temperature's mantissa)
void OLED_Print_Sensor_Val(unsigned char x_pos, unsigned char y_pos, unsigned int data, unsigned int selection,unsigned long textColor=WHITE, unsigned long backgroundColor=BLACK ){
    unsigned int ascii_index;

    //first determine the number of digits required for the temperature
    //all temperatures will be assumed to be greater than 0 degrees and less than 1000 degrees
    unsigned int digits = 0;
    if(data <= 9){
        digits = 1;
    }else if(data<100){
        digits = 2;
    }else{
        digits = 3;
    }

    switch (digits){
        case 1:
            //get ascii index for digit
            ascii_index = Num_To_ASCII(data);
            //print the digit
            OLED_Text_160128RGB(x_pos, y_pos, ascii_index, textColor, backgroundColor);
            break;
        case 2:
            //determine the digit in the ten's column
            ascii_index = Num_To_ASCII((data/10)%10);
            //print the digit
            OLED_Text_160128RGB(x_pos, y_pos, ascii_index, textColor, backgroundColor);
            //determine the digit in the ones's column
            ascii_index = Num_To_ASCII(data%10);
            //print the digit
            OLED_Text_160128RGB(x_pos + 7, y_pos, ascii_index, textColor, backgroundColor);
            break;
        case 3:
            //determine the digit in the 100's column
            ascii_index = Num_To_ASCII((data/100)%10);
            //print the digit
            OLED_Text_160128RGB(x_pos, y_pos, ascii_index, textColor, backgroundColor);
            //determine the digit in the ten's column
            ascii_index = Num_To_ASCII((data/10)%10);
            //print the digit
            OLED_Text_160128RGB(x_pos + 7, y_pos, ascii_index, textColor, backgroundColor);
            //determine the digit in the ones's column
            ascii_index = Num_To_ASCII(data%10);
            //print the digit
            OLED_Text_160128RGB(x_pos + 14, y_pos, ascii_index, textColor, backgroundColor);
            break;
    }
    if(selection == 0){
        //print a decimal point for temperature
        OLED_Text_160128RGB(x_pos + 7*digits, y_pos, 97, textColor, backgroundColor); //degree symbol
        OLED_Text_160128RGB(x_pos + 7*digits + 7, y_pos, 35, textColor, backgroundColor); //Celsius
        digits = digits + 2;
        Clear_Data_Chars(x_pos + 7*digits, y_pos, BLACK); //clear extra character to right of the degC (only happens if the amt of digits changed since last print)
    }else if(selection == 1){
        //print the percent sign for humidity
        OLED_Text_160128RGB(x_pos + 7*digits, y_pos, 5, textColor, backgroundColor);
        digits = digits + 1;
        Clear_Data_Chars(x_pos + 7*digits, y_pos, BLACK); //clear extra character to right of the percent sign (only happens if the amt of digits changed since last print)
    }
    
}

//Clears 7 characters of pixels using the default font size
void Clear_Data_Chars(unsigned char x_pos, unsigned char y_pos, unsigned long backgroundColour){
    //The x_pos should be 7 pixels from the last printed character to be kept
    unsigned char y_temp;
    unsigned int i;
    unsigned int j;
    unsigned int k;
    OLED_SetPosition_160128RGB(x_pos,y_pos);
    OLED_WriteMemoryStart_160128RGB();
    for(i=0;i<7;i++){
        y_temp = y_pos;
        for(j=0;j<8;j++){ // each character is 8 pixels tall
            OLED_SetPosition_160128RGB(x_pos,y_temp);
            OLED_WriteMemoryStart_160128RGB();
            for (k=0;k<5;k++){    // each character is 5 pixels wide
                OLED_Pixel_160128RGB(backgroundColour);
            }
            y_temp++;
        }
        x_pos +=7;
    }
}

//This function draws a hollow box outline with a width of 1 pixel
void Draw_Box(unsigned char x_pos, unsigned char y_pos, unsigned long shapeColour, unsigned long backgroundColour, unsigned int height, unsigned int width){
    unsigned int i;
    unsigned int j;
    for(i=0;i<height;i++){ //iterating over the height of the box
        OLED_SetPosition_160128RGB(x_pos,y_pos);
        OLED_WriteMemoryStart_160128RGB();
        for(j=0;j<width;j++){ //iterating over the width of the box
            if((j==0)||(j==(width-1))||(i==0)||(i==(height-1))){
                OLED_Pixel_160128RGB(shapeColour);
            }else{
                OLED_Pixel_160128RGB(backgroundColour);
            }
        }
        y_pos+=1;
    }
}

void Draw_Bar(unsigned char x_pos, unsigned char y_pos, unsigned long shapeColour, unsigned long backgroundColour, unsigned int height, unsigned int maxWidth, unsigned int percent){
    unsigned int i;
    unsigned int j;
    unsigned int fillWidth = (maxWidth * percent)/100;
    for(i=0;i<height;i++){ //iterating over the height of the box
        OLED_SetPosition_160128RGB(x_pos,y_pos);
        OLED_WriteMemoryStart_160128RGB();
        for(j=0;j<fillWidth;j++) //iterating over the width of the box
        {
            OLED_Pixel_160128RGB(shapeColour);
        }
        y_pos+=1;
    }
}

void draw_lil_guy(unsigned char x_pos, unsigned char y_pos, unsigned long shapeColour, unsigned long backgroundColour, unsigned int position){

    unsigned int lil_guy[2][24] = {
        {0x0000, 0x0802, 0x0404, 0x0208, 0x0110, 0x00A0, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x00E0, 
        0x0250, 0x0248, 0x0444, 0x00E0, 0x0011, 0x0208, 0x0404, 0x0404, 0x0208, 0x0110, 0x00E0, 0x0000},
        {0x0000, 0x00A0, 0x00A0, 0x00A0, 0x00A0, 0x00A0, 0x0040, 0x0250, 0x0250, 0x0250, 0x0250, 0x00E0, 
        0x0040, 0x0040, 0x0040, 0x0444, 0x00E0, 0x0208, 0x0404, 0x0404, 0x0208, 0x0110, 0x00E0, 0x0000}
    };

    int i;
    int count;
    unsigned int height = 24;
    unsigned int width = 13;
    unsigned int mask = 0x1000;

    for(i=0; i<height; i++){
        mask = 0x1000;
        OLED_SetPosition_160128RGB(x_pos,y_pos);
        OLED_WriteMemoryStart_160128RGB();
        for (count=0;count<width;count++){
            if((lil_guy[position][i] & mask) == mask){
                OLED_Pixel_160128RGB(shapeColour);
                // wait_ms(1000);
            }else{
                OLED_Pixel_160128RGB(backgroundColour);
            };
            mask = mask >> 1;
            
            //x pos automatically increased
        }
        y_pos++; //height is increased
    }

};

//size = 1x or 2x
void OLED_write_text(int charsize, unsigned char x_pos, unsigned char y_pos, unsigned char *toWrite, int length, unsigned long textColor, unsigned long backgroundColor){
    unsigned int ascii_index;
    for (int i=0; i < length; i++){
        ascii_index = char_to_ASCII(toWrite[i]); //get ascii index for character
        if(charsize == 1){
            OLED_Text_160128RGB(x_pos + i*7, y_pos, ascii_index, textColor, backgroundColor);
        }else if(charsize == 2){
            OLED_Text2x_160128RGB(x_pos + i*12, y_pos, ascii_index, textColor, backgroundColor); //print the character
        }
    }
};



/*===============================*/
/*==== HIGH LEVEL FUNCTIONS =====*/
/*============= END =============*/
/*===============================*/


/*********************************/
/******** INITIALIZATION *********/
/************ START **************/
/*********************************/

//Function to initialize the OLED properly
void OLED_Init_160128RGB(void)      //OLED initialization
{     
   gpio_write(gpio_read(GPIO_A)&~(RES_PIN), GPIO_A);
   wait_ms(2);
   gpio_write(gpio_read(GPIO_A)|RES_PIN, GPIO_A);
   wait_ms(2);
    
   // display off, analog reset
   OLED_Command_160128RGB(0x04);
   OLED_Data_160128RGB(0x01);
   wait_ms(1);
    
   // normal mode
   OLED_Command_160128RGB(0x04); 
   OLED_Data_160128RGB(0x00); 
   wait_ms(1);
    
   // display off
   OLED_Command_160128RGB(0x06);
   OLED_Data_160128RGB(0x00);
   wait_ms(1);
    
   // turn on internal oscillator using external resistor
   OLED_Command_160128RGB(0x02);
   OLED_Data_160128RGB(0x01); 
    
   // 90 hz frame rate, divider 0
   OLED_Command_160128RGB(0x03);
   OLED_Data_160128RGB(0x30); 
    
   // duty cycle 127
   OLED_Command_160128RGB(0x28);
   OLED_Data_160128RGB(0x7F);
    
   // start on line 0
   OLED_Command_160128RGB(0x29);
   OLED_Data_160128RGB(0x00); 
    
    // rgb_if
   OLED_Command_160128RGB(0x14);
   OLED_Data_160128RGB(0x31); 
    
   // Set Memory Write Mode
   OLED_Command_160128RGB(0x16);
   OLED_Data_160128RGB(0x66);
    
   // driving current r g b (uA)
   OLED_Command_160128RGB(0x10);
   OLED_Data_160128RGB(0x45);
   OLED_Command_160128RGB(0x11);
   OLED_Data_160128RGB(0x34);
   OLED_Command_160128RGB(0x12);
   OLED_Data_160128RGB(0x33);
    
   // precharge time r g b
   OLED_Command_160128RGB(0x08);
   OLED_Data_160128RGB(0x04);
   OLED_Command_160128RGB(0x09);
   OLED_Data_160128RGB(0x05);
   OLED_Command_160128RGB(0x0A);
   OLED_Data_160128RGB(0x05);
    
   // precharge current r g b (uA)
   OLED_Command_160128RGB(0x0B);
   OLED_Data_160128RGB(0x9D);
   OLED_Command_160128RGB(0x0C);
   OLED_Data_160128RGB(0x8C);
   OLED_Command_160128RGB(0x0D);
   OLED_Data_160128RGB(0x57);
   
   // Set Reference Voltage Controlled by External Resister
   OLED_Command_160128RGB(0x80);
   OLED_Data_160128RGB(0x00);
    
   // mode set
   OLED_Command_160128RGB(0x13);
   OLED_Data_160128RGB(0xA0);
    
   OLED_SetColumnAddress_160128RGB(0, 159);
   OLED_SetRowAddress_160128RGB(0, 127);

   // Display On
   OLED_Command_160128RGB(0x06);
   OLED_Data_160128RGB(0x01); 
}

/*===============================*/
/*======= INITIALIZATION ========*/
/*============= END =============*/
/*===============================*/



/*===============================*/
/*========== SCREENS ===========*/
/*============ START ============*/
/*===============================*/


void OLED_profile_page(unsigned int selected_profile){
    //these characters are 16 pixels tall and 10 pixels wide.
    //leave 2 pixels in between each character
    unsigned char text[9] = {'P','r','o','f','i','l','e', ' ', '#'};
    unsigned char profile[1] = {selected_profile + 48}; // adding 48 converts a single int to char numeral
    OLED_write_text(2, 5, 100, text, 9, WHITE, BLACK);
    OLED_write_text(2, 120, 100, profile, 1, WHITE, BLACK);

    unsigned char text2[10] = {'s','o','a','k',' ','t','i','m','e','='};
    OLED_write_text(1, 20, 77, text2, 10, WHITE, BLACK);

    unsigned char text3[11] = {'s','p','i','k','e',' ','t','i','m','e','='};
    OLED_write_text(1, 20, 64, text3, 11, WHITE, BLACK);

    OLED_Text2x_160128RGB(15, 15, 98, WHITE, BLACK); //left-facing arrow
    OLED_Text2x_160128RGB(133, 15, 99, WHITE, BLACK); //right-facing arrow
    if(selected_profile%2 ==1){
        OLED_Text_160128RGB(80, 26, 100, WHITE, BLACK); //head
        OLED_Text_160128RGB(80, 18, 101, WHITE, BLACK); //body
        OLED_Text_160128RGB(80, 10, 102, WHITE, BLACK); //legs
    }
    else{
        OLED_Text_160128RGB(80, 26, 100, WHITE, BLACK); //head
        OLED_Text_160128RGB(80, 18, 103, WHITE, BLACK); //body
        OLED_Text_160128RGB(80, 10, 104, WHITE, BLACK); //legs
    }    
};

void OLED_profile_times(unsigned int selected_profile_array[]){
    unsigned char text4[13] = {'c','o','o','l','i','n','g',' ','t','i','m','e','='};
    OLED_write_text(1, 20, 51, text4, 13, WHITE, BLACK);

    OLED_Print_Sensor_Val(97, 77, selected_profile_array[0],3, BLUE);
    OLED_Print_Sensor_Val(104, 64, selected_profile_array[1],3, BLUE);
    OLED_Print_Sensor_Val(118, 51, selected_profile_array[2],3, BLUE);
    unsigned char text[1] ={'s'};
    OLED_write_text(1,118,77,text,1,WHITE,BLACK);
    OLED_write_text(1,125,64,text,1,WHITE,BLACK);
    OLED_write_text(1,139,51,text,1,WHITE,BLACK);
}

void OLED_starting_page(){
    OLED_FillScreen_160128RGB(BLACK);                // fill screen with black
    unsigned char text1[8] = {'S','T','A','R','T','I','N','G'};
    unsigned char text2[8] = {'R','E','F','L','O','W','.','.'};
    OLED_write_text(2, 5, 83, text1, 8, GREEN, BLACK);
    OLED_write_text(2, 5, 31, text2, 8, GREEN, BLACK);
};

void OLED_display_progress(unsigned int selected_profile){
    OLED_Init_160128RGB();                                      // initialize display
    OLED_FillScreen_160128RGB(BLACK);                           // fill screen with black

    unsigned char arr1[9] = {'P','r','o','f','i','l','e', ':', '#'};
    OLED_write_text(1, 5, 105, arr1, 8, WHITE, BLACK);

    unsigned char profile[1] = {selected_profile + 48}; // adding 48 converts a single int to char numeral
    OLED_write_text(1, 101, 105, profile, 1, WHITE, BLACK);

    unsigned char arr_progress[9] = {'P','r','o','g','r','e','s','s', ':'};
    OLED_write_text(1, 20, 50, arr_progress, 9, WHITE, BLACK);

    unsigned char arr_temp[12] = {'T','e','m','p','e','r','a','t','u','r','e', ':'};
    OLED_write_text(1, 20, 30, arr_temp, 12, WHITE, BLACK);

    unsigned char arr_hum[9] = {'H','u','m','i','d','i','t','y',':'};
    OLED_write_text(1, 20, 10, arr_hum, 9, WHITE, BLACK);

    Draw_Box(20, 70, BLUE, BLACK, 30, 128);                     // draw box for progress bar
    Draw_Bar(23, 73, BLUE, BLACK, 24, 122, 0);                  // draw 0% into progress bar
};

void OLED_update_humidity(unsigned int humidity){
    unsigned char x_pos = 83;
    unsigned char y_pos = 10;
    OLED_Print_Sensor_Val(x_pos, y_pos, humidity, 1); // selection = 1 : %
};

void OLED_update_temp(int temp){
    unsigned char x_pos = 104;
    unsigned char y_pos = 30;
    OLED_Print_Sensor_Val(x_pos, y_pos, temp, 0);
};

void OLED_update_progress(int progress){
    unsigned char x_pos = 83;
    unsigned char y_pos = 50;
    OLED_Print_Sensor_Val(x_pos, y_pos, progress, 1);  // selection = 1 : %
    Draw_Bar(23, 73, BLUE, BLACK, 26, 122, progress); //fill the progress bar to the correct amount
};

void OLED_end_progress(){
    unsigned char text[9] = {'C','o','m','p','l','e','t','e', '!'};
    OLED_write_text(2, 5, 100, text, 9, WHITE, BLACK);

    unsigned char text2[14]={'O','p','e','n',' ','O','v','e','n',' ','D','o','o','r'};
    OLED_write_text(1, 5, 75, text2, 14, WHITE, BLACK);
};

void OLED_display_warning(){
    //WARNING
    unsigned char text[7] = {'W','A','R','N','I','N','G'};
    OLED_write_text(2, 9, 98, text, 7, RED, BLACK);

    //Humidity is greater
    unsigned char text1[19] = {'H','u','m','i','d','i','t','y',' ','i','s',' ','g','r','e','a','t','e','r'};
    OLED_write_text(1, 9, 83, text1, 19, WHITE, BLACK);

    //than maximum
    unsigned char text2[12] ={'t','h','a','n',' ','m','a','x','i','m','u','m'};
    OLED_write_text(1, 9, 71, text2, 12, WHITE, BLACK);

    unsigned char arr_hum[9] = {'H','u','m','i','d','i','t','y',':'};
    OLED_write_text(1, 20, 10, arr_hum, 9, WHITE, BLACK);

    // OLED_Print_Sensor_Val(83, 10, humidity, 1); //happens in main function
}

void OLED_acknowledge(){
    //Push button
    unsigned char text3[11] = {'P','u','s','h',' ','b','u','t','t','o','n'};
    OLED_write_text(1, 9, 42, text3, 11, BLUE, BLACK);

    //to acknowledge
    unsigned char text4[14] = {'t','o',' ','a','c','k','n','o','w','l','e','d','g','e'};
    OLED_write_text(1, 9, 30, text4, 14, BLUE, BLACK);
};


/*===============================*/
/*========== SCREENS ===========*/
/*============= END =============*/
/*===============================*/
