/* 
 * File:   TimersLCD.c
 * Author: Dragos
 *
 * Created on February 2, 2014, 11:39 PM
 */

#include <stdio.h>
#include <stdlib.h>

#include <p18f8722.h>

#include "TimersLCD.h"
#include "lcd.h"
#include "uart.h"


// configuration bits
#pragma config OSC = HS         // Oscillator Selection bits (HS oscillator)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDT = OFF        // Watchdog Timer (WDT disabled (control is placed on the SWDTEN bit))



#define DBG_MSG 0
#if (DBG_MSG == 1)
#define DBG(x)  UART_puts((char *)x)    // debug messages on UART
#else
#define DBG(x)                  // debug messages are lost
#endif


typedef unsigned char byte;

void checkInputs(void);
void initButtons(void);
void init(void);
void initTmr(void);
void main(void);


/*******************************************************************************
 * Global variables
 */
byte leftButtonEv = 0;
byte rightButtonEv = 0;

/* timer related variables */
unsigned char tick = 0;
unsigned char ev = 0;
//unsigned char cnt = 0;

/* used to format print messages */
char mesaj[20] = {0};



/************************************** CHANGE ONLY THIS PART OF CODE - START */
/**********************  USE THIS PLACE TO DEFINE ADDITIONAL GLOBAL VARIABLES */

/* counts how many 100ms ticks passed
 * name: tick100ms
 * type: unsigned char
 * it should be incremented each 100ms based on the event provided by timer interrupt
 * if the old value was 9, then the new value is 0
 */
unsigned char tick100ms = 0;

/* counts the seconds
 * name: sec
 * type: unsigned char
 * it should be incremented each 1s
 * if the old value was 59, then the new value is 0
 */
unsigned char secunde = 0;

/* counts the minutes
 * name: min
 * type: unsigned char
 * it should be incremented after 60s passed
 */
unsigned char minute = 0;

/* counts the hours */
unsigned char ore = 0;

//unsigned char count = 0;

/**********************  USE THIS PLACE TO DEFINE ADDITIONAL GLOBAL VARIABLES */
/**************************************** CHANGE ONLY THIS PART OF CODE - END */




/*******************************************************************************
 * Check Inputs Function
 */
void checkInputs(void)
{
    byte leftButton = 0;
    byte rightButton = 0;
    static byte leftButton_old = 0;
    static byte rightButton_old = 0;

/* RB0 - check left push button event */
    leftButton = PORTBbits.RB0;
    if (   (leftButton == 0) /* push button pressed */
        && (leftButton != leftButton_old) /* not pressed before */
       )
    {
        leftButtonEv = 1;
    }
    leftButton_old = leftButton;

/* RA5 - check right push button event */
    rightButton = PORTAbits.RA5;
    if (   (rightButton == 0) /* push button pressed */
        && (rightButton != rightButton_old) /* not pressed before */
       )
    {
        rightButtonEv = 1;
    }
    rightButton_old = rightButton;
} /* void checkInputs(void) */




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
 * Init Timer Function
 */
void initTmr(void)
{
    PORTJbits.RJ6 = 0;
    PORTJbits.RJ7 = 0;
    TRISJbits.TRISJ7 = 0;   // This sets pin RB7 to output
    TRISJbits.TRISJ6 = 0;   // This sets pin RB6 to output

// START - TMR0 setup
    TMR0 = 0;
    T0CON = 0;
    T0CONbits.TMR0ON = 0;   // timer OFF
    T0CONbits.T08BIT = 0;   // 16bit timer
    T0CONbits.T0CS = 0;     // internal source clock
    T0CONbits.T0SE = 0;     // source edge Low-2-High
    T0CONbits.PSA = 0;      // prescaler active
    T0CONbits.T0PS = 1;     // prescaler 3 bits (Fosc/4)/presc 1:4 => timer clock = (10MHz/4) / 4 = 625Khz
    /* 10Hz */
    /* 10Hz = 0.01KHz => 100ms period
     * 625Khz / 0.01khz => 62500
     * 65535 - 62500 = 3035 = 0BDBx
     */
    TMR0H = 0x0B;           //
    TMR0L = 0xDB;           //
    T0IE = 1; //enable TMR0 overflow interrupts
    GIE = 1; //enable Global interrupts
    T0CONbits.TMR0ON = 1;   // timer ON
// END - TMR0 setup
} /* void initTmr(void) */


/*******************************************************************************
 *  Interrupt Service Routine (keyword "interrupt" tells the compiler it's an ISR)
 */
void interrupt ISR(void)
{
// TMR0 interrupt
    if (T0IE && T0IF)
    {
        T0IF  = 0;              // clear interrupt flag
        T0CONbits.TMR0ON = 0;   // Turn timer off to reset count register
        TMR0H = 0x0B;           // reload counter for 100ms interrupt
        TMR0L = 0xDB;           //


        T0CONbits.TMR0ON = 1;   // Turn timer back on
        ev = 1;

        PORTJbits.RJ0 = tick&1;
    }

    // process other interrupt sources here, if required
}


/*******************************************************************************
 * Init Function
 */
void init(void)
{
    MEMCONbits.EBDIS=1;
    
    /* init UART */
    UART_Init();
    UART_puts((char *)"\n\rInitializing...\n\r");

    /* init buttons */
    initButtons();

    /* init TMR */
    initTmr();

    /* init LCD */
    LcdInit();

    DBG("-> Init done.\n\r");
} /* void init(void) */



/*******************************************************************************
 * Main Function
 */
void main(void)
{
    init();

    TRISDbits.RD0 = 0;

    PORTJbits.RJ0 = 0;
    TRISJbits.TRISJ0 = 0;
    PORTJbits.RJ1 = 0;
    TRISJbits.TRISJ1 = 0;
    PORTJbits.RJ2 = 0;
    TRISJbits.TRISJ2 = 0;

    LcdGoTo(0x00+0); /* 0x00 is the offset for the first line on LCD, 0 is the first char on the line */
    /* LCD 16/line |0123456789012345| */
    LcdWriteString("Embedded  system");

    while(1) /************************************************** ENDLESS LOOP */
    {

        while (ev == 0);    /* wait timer event */
        ev = 0;             /* once detected, clear the event to be able to wait for the next one */

        checkInputs(); /* verify button events */

/******************************************************************************/
/************************************** CHANGE ONLY THIS PART OF CODE - START */

/* switch been example and exercise
 * 1 - example is running
 * 0 - exercise is running
 */
#if 0

/*************** JUST a small timer example counting the seconds only - START */
        /* it should look like
         *     |0123456789012345|
         *     |Embedded  system|   1st line
         *     |            1234|   2nd line
         */

        /* count 100ms tick */
        tick100ms++;

        /* 10x100ms => 1s passed */
        if (tick100ms == 10) 
        {
            /* reset counter */
            tick100ms = 0; 

            /* count the seconds */
            secunde++;
        }

        /* display on LCD SSSSSS */
        /* 0x40 is the offset for the second line on LCD, 0 is the first char on the line, 15 is the last char on the line */
        LcdGoTo(0x40+12);
        /* format the seconds value in a string */
        sprintf(mesaj, "%04d", secunde);
        /* put the message on LCD */
        LcdWriteString(mesaj);

/***************** JUST a small timer example counting the seconds only - END */

#else

/************************** PUT your code here to implement the watch - START */
        /* it should look like
         *     |0123456789012345|
         *     |Embedded  system|   1st line
         *     |    00:02:34    |   2nd line
         */

        /* count 100ms tick */
        /* YOUR CODE */
            tick100ms++;
        if (tick100ms == 10) /* 10x100ms => 1s passed */
        {
            /* reset 100ms counter */
            /* YOUR CODE */
             tick100ms = 0; 
            /* count the seconds */
            /* YOUR CODE */
              secunde++;
            /* adjust the seconds counter in range of 0..59*/
            if (secunde == 60)
            {
                /* reset seconds counter */
                /* YOUR CODE */
                secunde = 0;
                /* count the minutes counter */
                /* YOUR CODE */
                minute++;
                /* adjust the minutes counter in range of 0..59 */
                if (minute == 60)
                {
                    /* reset the minutes counter */
                    /* YOUR CODE */
                    minute = 0;
                    /* count the hours counter */
                    /* YOUR CODE */
                    ore++;
                }
            }
        }

        /* if left button pressed */
        if (leftButtonEv == 1)
        {
            /* reset time counters: tick100ms, sec, min, hour */
            tick100ms = 0;
            secunde = 0;
            ore=0;
            minute = 0;
            /* YOUR CODE */
            /* YOUR CODE */
            /* YOUR CODE */
            /* YOUR CODE */
        }

        /* display on LCD HH:MM:SS */
        /* 0x40 is the offset for the second line on LCD, 0 is the first char on the line */
        /* YOUR CODE */
        LcdGoTo(0x40+8);
        /* format the seconds value in a string */
        /* YOUR CODE */
        sprintf(mesaj, "%02d:%02d:%02d", ore,minute,secunde);
        
        
        /* put the message on LCD */
        /* YOUR CODE */
        LcdWriteString(mesaj);
/**************************** PUT your code here to implement the watch - END */
#endif

/**************************************** CHANGE ONLY THIS PART OF CODE - END */
/******************************************************************************/

        /* clear events */
        leftButtonEv = 0; /* clear event from left button */
        rightButtonEv = 0; /* clear event from right button */

    } /********************************************************* ENDLESS LOOP */
} /* void main(void) */




/*
 
 /*#else */
//#if 1
//       tick100ms++;
//       
//        if (tick100ms == 10) 
//        {
//            /* reset counter */
//            tick100ms = 0; 
//
//            /* count the seconds */
//            secunde++;
//        }
//       if (secunde  == 60) 
//        {
//            /* reset counter */
//            secunde = 0; 
//
//            /* count the seconds */
//            minute++;
//        }
//       if (minute == 60) 
//        {
//            /* reset counter */
//            minute = 0; 
//
//            /* count the seconds */
//            ore++;
//        }
//       if (ore == 12) 
//        {
//            /* reset counter */
//            ore = 0; 
//
//            
//        }
//       
//       
//        LcdGoTo(0x40+8);
//        sprintf(mesajo, "%04d", ore);
//        sprintf(mesajm, "%04d",minute);
//        sprintf(mesajs, "%04d",secunde);
//        mesaj[0]=mesajo[0];
//        mesaj[1]=mesajo[1];
//        mesaj[2]=':';
//        mesaj[3]=mesajm[0];
//        mesaj[4]=mesajm[1];
//        mesaj[5]=':';
//        mesaj[6]=mesajs[0];
//        mesaj[7]=mesajs[1];
//
//
//        LcdWriteString(mesaj);
//
//       
//       
//       
//       
//       
//       
//       
//  #else  
// 
