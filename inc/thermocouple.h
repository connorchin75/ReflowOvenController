#include <SystemClock.h>
#include <IOConfig.h>
#include <GPIO.h>
#include <SPI.h>
#include <XPD.h>

#include "wait.h"

/***************************************/
/***** INITIALIZATION AND PINOUTS ******/
/***************************************/

// define pinouts
#define CS_TEMP 0x02 ////SDIO0/PJ1 / pin 8
#define MISO 	0x14 //MISO1/PD0 / pin 20
#define SCLK 	0x16 //SCLK1/PD2 / pin 22


void thermocouple_pin_init(void){
	// set the direction of PJ0 to output
   gpio_set_config(CS_TEMP << 8, GPIO_J);
        // 0x01 << 8 = 0000 0001 0000 0000b
        // pins : 7654 3210 0000 0000
        // upper byte is high = output
        // cleared bits = input
	//set the CS_TEMP high at the start (Chip select is an active low signal)
	gpio_write((gpio_read(GPIO_J) | CS_TEMP), GPIO_J);
	
}

/*********************************/
/***** LOWER LEVEL FUNCTIONS ******/
/*********************************/

uint16_t readUpperData(void){
		
	uint16_t buffer = 0;
	uint16_t result = 0;

	//select SPI device to read from
	gpio_write((gpio_read(GPIO_J) &~ (CS_TEMP)), GPIO_J); //only changes the CS_TEMP pin to low
		// gpio j = 0000 0000
	//result from thermocouple should be 14 bits
	//note that the thermocouple has 32 bits of information. The first 14 (D31 - D18) are the temperature data. 
			//The following bits are reserved for either error detection or for the internal temperature data.
			// Chose to only read the first 14 bits.

	//read 8 bits at a time
	for (int i = 0; i<2; i++){
		buffer = SPI_read(SPI1); //reads from MISO pin. note that SPI needs to be in master mode
		result = result <<8;
		result = result | buffer;
	}
	//result now has 14 bits of data as MSB, then a reserved bit, and a fault bit as the LSB. 

	//turn off CS_temp
	gpio_write((gpio_read(GPIO_J) | CS_TEMP), GPIO_J); //only changes the CS_TEMP pin to high
	return result;
}

uint16_t readLowerData(void){
		
	uint16_t buffer = 0;
	uint16_t result = 0;
	uint16_t upper = 0; //this will be the top 16 bits (D31 - D16)


	//select SPI device to read from
	gpio_write((gpio_read(GPIO_J)  &~ (CS_TEMP)), GPIO_J); //only changes the CS_TEMP pin to low

	//note that the thermocouple has 32 bits of information. 
			//D31 - D18 : 14 bit temperature data
			//D17 is reserved
			//D16 is the Fault Bit (if = 1)
			//D15 - D4 : 12-bit internal temperature (cold junction)
			//D3 is reserved
			//D2 : SCV Bit (1 = short to Vcc)
			//D1 : SCG Bit (1 = short to gnd)
			//D0 : OC Bit (1 = open circuit)

	//read upper 16 bits into first variable. this is essentially ignored information
	for (int i = 0; i<2; i++){
		buffer = SPI_read(SPI1); //reads from MISO pin. note that SPI needs to be in master mode
		upper = upper <<8;
		upper = upper | buffer;
	}
	//upper now has 14 bits of data as MSB, then a reserved bit, and a fault bit as the LSB.

	//read next 16 bits into results variable
	for (int i = 0; i<2; i++){
		buffer = SPI_read(SPI1); //reads from MISO pin. note that SPI needs to be in master mode
		result = result <<8;
		result = result | buffer;
	}
	//result now has 12 bits of internal temperature data, 1 reserved bit, and 3 error bits

	//turn off CS_temp
	gpio_write((gpio_read(GPIO_J) | CS_TEMP), GPIO_J); //only changes the CS_TEMP pin to high

	return result;
}


/*********************************/
/***** HIGH LEVEL FUNCTIONS ******/
/*********************************/

int isFault(void){

	int isFault = 0;
	uint16_t rawdata = 0;

	rawdata = readUpperData();
	if ((rawdata & 0x0001) == 0x0001){ //if the fault bit (LSB) is 1
		isFault = 1;
	}
	return isFault;
}

int getFault(void){
	// xpd_puts("Thermocouple: Entered Fault Function\n");
	uint16_t rawdata = 0;

	rawdata = readLowerData();
	
	rawdata = rawdata & 0x0001; //grabs the bottom 4 LSBs

	//the bottom 4 bits:
	// D3 is reserved
	// D2 is Short to Vcc flag
	// D1 is Short to Gnd flag
	// D0 is Open Circuit flag
	if(((rawdata & 1) == 1) && ((rawdata & 3) != 3)){
		// xpd_puts("Thermocouple: Open Circuit detected\n");
		return 1; //open circuit
	}else if(((rawdata & 2) == 1) || ((rawdata & 3) == 3)){
		// xpd_puts("Thermocouple: Short to Gnd detected\n");
		return 2; //shorted to Gnd
	}else if(((rawdata & 4) == 1) || ((rawdata & 3) == 3)){
		// xpd_puts("Thermocouple: Short to Vcc detected\n");
		return 3; //shorted to Vcc
	}else{
		return 0; //Pmod working properly
	}
}

int getTemp(void){

	int temperature = 0;
	uint16_t rawdata = 0;

	rawdata = readUpperData();

	if ((rawdata & 0x0001) == 0x0001){//if the fault bit (LSB) is 1
		//error detected
		// xpd_puts("Thermocouple Error detected.\n");
		getFault();
		temperature = 0;
	}
	else{
		temperature = rawdata >> 2; //ignore rightmost two bits (reserved and fault bit)

		//temperature is now organized like this:
		// D13 : Sign
		// D12 : 2^10
		// D11 : 2^9
		// D10 : 2^8
		// D9  : 2^7
		// D8  : 2^6
		// D7  : 2^5
		// D6  : 2^4
		// D5  : 2^3
		// D4  : 2^2
		// D3  : 2^1
		// D2  : 2^0
		// D1  : 2^-1
		// D0  : 2^-2
		//note: the 2 LSB are decimal values

		//since the Xinc2 can't handle floats, we will ignore the 2 LSB.
		temperature = temperature >> 2;
	}
	return temperature;
}

int getAMBTemp(void){

	int ambTemp = 0;
	uint16_t rawdata = 0;

	rawdata = readLowerData();

	ambTemp = rawdata >> 4; //this will grab the internal / ambient temperature bits. the 4 LSB are flags

	//again, the Xinc2 can't handle floats, so we ignore the bottom 4 bits
	ambTemp = ambTemp >> 4;

	return ambTemp; //note that ambTemp has a signed bit
}