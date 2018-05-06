#include "Pwm.h"

#include <xc.h>

#pragma config OSC = HS
#pragma config FCMEN = OFF
#pragma config IESO = OFF
#pragma config PWRT = OFF
#pragma config BOREN = OFF
#pragma config WDT = OFF
#pragma config MCLRE = ON
#pragma config LVP = OFF
#pragma config XINST = OFF

void interrupt intrerupt_ext (void)
{
    static uint8 tempValue = OLD_VALUE;

    if(INTCONbits.INT0IE && INTCONbits.INT0IF)
    {
        if(tempValue == OLD_VALUE)
        {
            setPeriod(0x7D);
            tempValue = NEW_VALUE;
        }
        else
        {
            setPeriod(0xFF);
            tempValue = OLD_VALUE;
        }
        INTCONbits.INT0IF = 0;
    }
}

void main()
{
   
    PwmInit();
    InteruptInit();
    setPeriod(0xFF);
    while(1)
    {
        LedControl();
    }
}
