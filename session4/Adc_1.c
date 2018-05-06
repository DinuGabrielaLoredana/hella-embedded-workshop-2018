#include "Adc_1.h"
#include "xc.h"
#include "plib/adc.h"

void Adc_GetMess(uint8 *Value)
{
    ADCON0 = 0b00000001;
    ADCON1 = 0b00001110;
    ADCON2 = 0b00111010;
    ADCON0bits.GO = 1;

    while(ADCON0bits.GO)
    {/*Do nothing wait for conversion*/
    }

    *Value = ADRESH;
}