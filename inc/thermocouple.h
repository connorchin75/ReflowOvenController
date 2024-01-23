#include <stdint.h>

/* ------------------------------------------------------------ */
/*					Object Class Declarations					*/
/* ------------------------------------------------------------ */
int thermocouple::chipSelect  = -1;

class thermocouple
{
	public:
	
		thermocouple();
		void begin(int CS);
		
		
		double getTemp();
		double getAMBTemp();
		void readData();		
		uint16_t getFault();
		double celToFar(double celsius);	
		

	private:
		
		
		uint32_t data;
		
		static int chipSelect; 
		int fault;
		int SCV;
		int SCG;
		int OC;		
		
};


extern "C" {
  #include <stdint.h>
}

/* Begin()
    Input:
        CS is the desired chip select pin for the SPI interface. Need 
        this value to access into our read and write register functions
    Description:
        initializes the class parameters and calls for the IC to be initialized
*/
void thermocouple::begin(int CS){	
	//Configure SPI 0 with the appropriate "best" standard
    SPI_set_config_optimal(sys_freq, SPI0)
	chipSelect = CS;	
}

/* getTemp()
    Description:
        call readData and return that value
*/
double thermocouple::getTemp(){
	
	int modded = 0;
	int buffer = 0;
	double temp = 0;
	
	readData();
	
	buffer = data & 0xFFFC0000;	
	
	//shift over to LSB 
	buffer = buffer >> 18;
	
	
	modded = buffer % 4;
	temp = (double) (buffer / 4);	
	
	
	temp = temp + (modded * .25);

	return temp;
	
}

/*  getAMBTemp()
    Output:
        double temperature of chip
    Description:
        will extract the chip temperature data from the data stream
*/
double thermocouple::getAMBTemp(){
	
	int buffer = 0;
	double ambTemp = 0;
	int modded = 0;
	
	readData();
	
	buffer = data & 0x0000FFF0;		
	
	buffer = buffer >> 4;	
	
	modded = buffer % 16;
	ambTemp = (double) (buffer / 16);	
	
	ambTemp = ambTemp + (modded * .0625);
	
	return ambTemp;

}



/*  readData()
    Description:
        will read the bitstream from the thermocouple and store it into data member "data"
*/
void thermocouple::readData(){
	
	//Serial.println("Entered update data");
	
	uint32_t buffer = 0;
	//clear current data int
	data = 0;
	
	double result = 0.0;
	
	//read in 32 bits of data 
	
    gpio_write(gpio_read(GPIO_A)|0x01, GPIO_A);
	digitalWrite(chipSelect, LOW); //start reading
	
	for(int i = 0; i<4; i++){
		buffer = SPI_read(SPI0);
		data = data << 8;
		data = data | buffer;
	}
	
	digitalWrite(chipSelect, HIGH);

}


/*  getFault()
    Output:
        uint16_t fault code which tells you what is failing
    Description:
        will read the bitstream from the thermocouple and store it into data member "data"
*/
uint16_t thermocouple::getFault(){
	
	readData();	

	if((data & 65536) == 65536){	
		Serial.println("Entered fault");
		if((data & 1) == 1 && (data & 3) != 3)
			return 1;   //open connection	
		if((data & 3) == 3)
			return 2;	//SCG shorted to gnd				
		if((data & 4) == 4)
			return 3;	//SCV shorted to VCC		
	}
	
	//else zero Pmod is working correctly
	return 0;

}



/*  double celToFar(double celsius)
    Input:
        double celcius -> value to convert to farenheit
    Output:
        double farenheit -> converted farenheit value
    Description:
        converts a temperature in celcius to farenheit
*/
double thermocouple::celToFar(double celsius){	
	return (celsius * 1.8) + 32;
}
