/*
 ============================================================================
 Name        : DigitalOutputs.c
 Author      : Catalin Triculescu
 Version     :
 Copyright   : Hella University Workshop
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <p18f8722.h>

#include "DigitalOutputs.h"


// configuration bits
#pragma config OSC = HS         // Oscillator Selection bits (HS oscillator)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDT = OFF        // Watchdog Timer (WDT disabled (control is placed on the SWDTEN bit))

byte nrLED;
byte leftButtonEv = 0;
byte rightButtonEv = 0;


/*******************************************************************************
 * Init LEDs Function
 */
void initLEDs(void)
{
	/* set all PortD bits as Output */
	TRISD = 0x0; 
	/* set state of the pins as STD_OFF */
	LATD = 0x0; 
} /* void initLEDs(void) */



/*******************************************************************************
 * Init Function
 */
void init(void)
{

    initLEDs();

} /* void init(void) */


/* -- write LED -- */
void setLED(byte nrLED, unsigned state)
{
    /* check what state is desired for nrLED */
    if (ON == state){
        /* if the bit should be set to ON we use the OR operation */
        LATD = LATD |   (ON << nrLED);
    } else {
        /* we set the bit with on and negates the operation */
        LATD = LATD & ~ (ON << nrLED);
    }
} /* void setLED(byte nrLED, unsigned state) */

void sequence1(void)
{
    /* sequence start */

    //put your code here

     uint8 i;
    
    init();
    
    while(1)
    {
        for (i=0; i<50; i++)
	{
            _delay(50000);
	}
        LATD = 0b00111100;

        for (i=0; i<50; i++)
        {
               _delay(50000);
        }
        LATD = 0b11000011;
    }
    
    /* sequence end */
}

void sequence2(void)
{
    init();
int i;
        static int state = 0;
        static int operation = 1;
        for (i=0; i<50; i++)
        {
            _delay(5000);
        }
        
        LATD = 1 << state ;
        state += operation;
        if (state >= 8)
            operation = -1;
        else
            if(state == 0)
                operation = 1;
    
        for (i=0; i<50; i++)
        {
            _delay(5000);
        }
  
  
}



void sequence3(void)
{
	// face 1000 0100 0010 0001 1001 0101 0011
	/* sequence start */

	//put your code here
	int i;
	int static limit = 7;
	static int state = 0;
	static int value = 0;
	for (i = 0; i<50; i++)
	{
		_delay(10000);
	}
	LATD = value | 1 << state;
	state++;
	if (state > limit) {
		value = value | 1 << limit;
		limit--;
		state = 0;
	}
	if (value == 0XFF) {
		value = 0;
		limit = 7;
	}
	for (i = 0; i<50; i++)
	{
		_delay(10000);
	}
	LATD = value


		/* sequence end */
}

/*******************************************************************************
 * Main Function
 */
void main(void)
{ init();

    while(1)
        sequence2();
    /*
    uint8 i;
    init();

    while(1)
    {
        for (i=0; i<50; i++)
	{
            _delay(50000);
	}
        LATD = 0b11111111;

        for (i=0; i<50; i++)
        {
               _delay(50000);
        }
        LATD = 0b00000000;
    }*/
} /* void main(void) */
