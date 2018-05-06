#include "Pwm.h"
#include "Pwm_Private.h"
#include <xc.h>
#include "Adc_1.h"


void PwmInit()
{
	TRISCbits.RC2=1;
        TRISCbits.RC1=1;
        TRISGbits.RG0=1;

	CCP1CON=0b00001100;
        CCP2CON=0b00001100;
        CCP3CON=0b00001100;

	CCPR1L=0x00;
        CCPR2L=0x00;
        CCPR3L=0x00;

	T2CON=0b00000101;
	while (!PIR1bits.TMR2IF);

	TRISCbits.RC2=0;
        TRISCbits.RC1=0;
        TRISGbits.RG0=0;
}

void InteruptInit()
{
    INTCONbits.GIE=1;
    INTCONbits.INT0IE=1;
    INTCONbits.INT0IF=0;
    INTCON2bits.INTEDG0=1;
}

void setDuty(uint8 chanId,uint8 duty)
{
    switch(chanId)
    {
        case RC2_0:
        {
            CCPR1L = duty;
            break;//blue
            // ledul albastru merge la 70% mereu
                        //potentiometrul merge pana la 255
            //asta inseamna ca 70/100 * 255 = 178 . 
        }//rc2 este blue pt ca l-am infipt in pinul pc2 de pe placa si firul de curent duce la ledul blue 
        case RC1_0:
        {
            CCPR2L = duty;
            break;//G
        }
        case RG0_0:
        {
            CCPR3L = duty;
            break;//R   
        }
    }
}

void setPeriod(uint8 period)
{
	PR2 = period;
}
//aplicatia 2 sa creasca ledul verde de la 0 la 100 
void LedAction()
{
    
}
static uint8 unit = 0;
static int state = 0;
void LedControl()
{   
    //aplicatia 3 . led rosu care se modifica cu potentiometru
    uint8 potiValue;
    Adc_GetMess(&potiValue);
    setDuty(RG0_0,potiValue);
    //////////////////////
    
    //aplicatia 1 . led albastru la 70%
    setDuty(RC2_0,178);//aplicatia 1
    //////////////////
    
    //aplicatia 2 , led galben oscileaza automat intre 0 si 100%
    if(unit < 255 && state == 0){
     setDuty(RC1_0,unit);
     unit++;
    }
    if (unit == 255 && state == 0){
        state = 1;
    }
    if (unit <= 255 && state == 1){
        setDuty(RC1_0,unit);
        unit--;
    }
    if (unit == 0 && state == 1){
        state = 0;
    }
     _delay(25000);
////////////////
     
    //Add your code here
    
}
