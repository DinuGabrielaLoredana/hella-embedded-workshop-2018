/* ========================================================================== */
/*                                                                            */
/*   Filename.c                                                               */
/*   (c) 2001 Author                                                          */
/*                                                                            */
/*   Description                                                              */
/*                                                                            */
/* ========================================================================== */


#include <stdio.h>
#include <stdlib.h>

#include <p18f8722.h>
//#include <spi.h>
//#include <delays.h>
#include "LCD.h"
#include "AnalogInputs.h"


// configuration bits
#pragma config OSC = HS         // Oscillator Selection bits (HS oscillator)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDT = OFF        // Watchdog Timer (WDT disabled (control is placed on the SWDTEN bit))

void initButtons(void);
void checkInputs(void);
void sequence1(void); /*display on the LCD the state of the button - pressed or not pressed */

volatile int state = 4;
/*******************************************************************************
 * Init Buttons Function
 */
void initButtons(void)
{
    /* RB0 left push button */
    TRISB0 = 1; /* only RB0 as input */
    
    /* RA5 right push button */
    TRISA5 = 1; /* only RA5 as input */

} /* void initButtons(void) */

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
 * Init Buttons Function
 */
void initAdc(void)
{
    /* RA0 potentiometer */
    TRISA = TRISA | (1<<0); /* only RA0 as input */

    ADCON0 = 0b00000001; // (00) unimplemented (0000) channel AN0 (0)don't start yet (1) turn on analog to digital module, see page 270
    ADCON1 = 0b00000000; // (00) unimplemented (00) using AVDD and AVSS (0000) A/D port bits, see page 271
    ADCON2 = 0b00000010; // (0) left justified (0) unimplemented (000) 0 TAD (010) FOSC/32, see page 272
} /* void initButtons(void) */





/*******************************************************************************
   
 * sequence1 -  Function for displaing the value of the poti to the LATD
 */
void sequence1(void)
{
    byte potiValue = 0;
    
    /* start conversion*/
    /* -- your code here -- */
    ADCON0bits.GO_DONE = 1;

    /*  wait to finish conversion*/
    /* -- your code here -- */
    while(ADCON0bits.GO_DONE == 1){
    
        ;
    }
    
    /* read value of the input*/
    /* -- your code here -- */
    potiValue  =  ADRESH ;
    /*  process the output to  be written on the port D */
    /* -- your code here -- */
    LATD = potiValue;
    Delay10KTCYx(10);

} /* void sequence1(void) */
/*******************************************************************************

 * sequence2 -  Function for displaing the value of the poti to LCD
 */
void sequence2(void)
{
    byte potiValue = 0;
    char message[16] = "Poti value     ";
    
    /*ANALOG POT FOR TEMPERATURE SETTING*/
    ADCON0bits.GO_DONE = 1;
     while(ADCON0bits.GO_DONE == 1){
    
        ;
    }
    
    /* read value of the input*/
    /* -- your code here -- */
    potiValue  =  ADRESH ;

    /* -- your code here -- */
    int y = potiValue%1000/100;
    int x = potiValue%100/10;
    message[10] = '0' + y;
    message[11] = '0' + x;
    message[12] = '0' + potiValue% 10;
    LcdGoTo(0);
    LcdWriteString(message);

} /* void sequence2(void) */


/*******************************************************************************

 * sequence3 -  Function for displaing the value of the poti to the LATD
 */
void sequence3(void)
{
    LATD = 0b00000000;
    byte potiValue = 0;
    byte i =0; 
    ADCON0bits.GO_DONE = 1;

    /*  wait to finish conversion*/
    /* -- your code here -- */
    while(ADCON0bits.GO_DONE == 1){
    
        ;
    }
    
    /* read value of the input*/
    /* -- your code here -- */
    potiValue  =  ADRESH ;
    
    /* -- your code here -- */
   potiValue =  potiValue/32;
   

    LATD =1<<potiValue;

} /* void sequence3(void) */

/*******************************************************************************

 * sequence4 -  Function for displaing the value of the poti to the LATD
 */
void sequence4(void)
{
    byte potiValue = 0;
    byte ledValue =0;
    int i =0;
    
    
    LATD = 0b00000000;
   
    ADCON0bits.GO_DONE = 1;

    /*  wait to finish conversion*/
    /* -- your code here -- */
    while(ADCON0bits.GO_DONE == 1){
    
        ;
    }
    
    /* read value of the input*/
    /* -- your code here -- */
    potiValue  =  ADRESH ;
    /*for(i=7;i>=0;i--)
     if(potiVlue & 1<<i{
     * break}
     
     for(int i =0 ;i<=)
     */
    /* -- your code here -- */
   potiValue =  potiValue/32;
   for(i = 0; i<=potiValue;i++)
      LATD =1<<i; 
   
    
    /* -- your code here -- */

} /* void sequence4(void) */

void main()
{
  
  initButtons();
  initAdc();
  LcdInit();
  initLEDs();
  while(1)
  {
      switch(state)
      {
          case 1:
          {
              sequence1();
              break;
          }
          case 2:
          {
              sequence2();
              break;
          }
          case 3:
          {
              sequence3();
              break;
          }
          case 4:
          {
              sequence4();
              break;
          }
          default:
          {
              break;
          }
      }
   }
}
