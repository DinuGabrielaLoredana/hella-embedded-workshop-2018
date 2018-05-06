/*
 * File:   newmain.c
 * Author: Dragos
 *
 * Created on February 2, 2014, 11:46 PM
 */

#include <stdio.h>
#include <stdlib.h>

#include <p18f8722.h>
//#include <delays.h>

#include "lcd.h"

#define USE_SW_SPI  0
#if USE_SW_SPI
#include "swspi.h"
#else
#include <spi.h>
#endif


// this is our chip select (CS) pin according to our pic18 explorer board's connections
#define CS PORTAbits.RA2

// addresses from MCP23S17's datasheet, think of the IODIR as TRIS and GPIO as PORT for the MCP23S17 (no the PIC micro)
#define IODIRA_ADDRESS 0x00
#define IODIRB_ADDRESS 0x01
#define GPIOA_ADDRESS 0x12
#define GPIOB_ADDRESS 0x13

// configuration bits
#pragma config OSC = HS         // Oscillator Selection bits (HS oscillator)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDT = OFF        // Watchdog Timer (WDT disabled (control is placed on the SWDTEN bit))




void setIODIR(char, char);
void setGPIO(char, char);
void lcdCommand(char);

void LcdInit(void);
void LcdClear(void);
void LcdGoTo(char pos);
void LcdChar(unsigned char letter);
void LcdWriteString(const char *s);


/*
 * used to set the values of the ports ( think of it as when you use a PORT register)
 */
void setGPIO(char address, char value)
{
#if USE_SW_SPI // use SW SPI
    SWSPIClearCS();         // we are about to initiate transmission
    // pins A2,A1 and A0 of the MCP23S17 chip are equal to 0 because they are grounded
    // we are just going to be writing so R/W=0 also
    SWSPIWrite(0x40);       // write command 0b0100[A2][A1][A0][R/W] = 0b01000000 = 0x40
    SWSPIWrite(address);    // select register by providing address
    SWSPIWrite(value);      // set value
    SWSPISetCS(); // we are ending the transmission
#else // use HW SPI
    CS=0;                   // we are about to initiate transmission
    // pins A2,A1 and A0 of the MCP23S17 chip are equal to 0 because they are grounded
    // we are just going to be writing so R/W=0 also
    WriteSPI1(0x40);        // write command 0b0100[A2][A1][A0][R/W] = 0b01000000 = 0x40
    WriteSPI1(address);     // select register by providing address
    WriteSPI1(value);       // set value
    CS=1;                   // we are ending the transmission
#endif
}

/*
 * used to set the directions of the ports (like when you use TRIS registers)
 * this function is actually identical to setGPIO, but I think a different
 * for setting the port directio helps with keeping the code organized
 */
void setIODIR(char address, char dir)
{
#if USE_SW_SPI // use SW SPI
    SWSPIClearCS();         // we are about to initiate transmission
    SWSPIWrite(0x40);       // write command (0b0100[A2][A1][A0][R/W]) also equal to 0x40
    SWSPIWrite(address);    // select IODIRB
    SWSPIWrite(dir);        // set direction
    SWSPISetCS();           // we are ending the transmission
#else // use HW SPI
    CS=0;                   // we are about to initiate transmission
    WriteSPI1(0x40);        // write command (0b0100[A2][A1][A0][R/W]) also equal to 0x40
    WriteSPI1(address);     // select IODIRB
    WriteSPI1(dir);         // set direction
    CS=1;                   // we are ending the transmission
#endif
}


/*******************************************************************************
 * Check Inputs Function
 */
void lcdCommand(char command)
{
    setGPIO(GPIOA_ADDRESS,0x00); // E=0
    //Delay10TCYx(0);
    setGPIO(GPIOB_ADDRESS, command); // send data
    //Delay10TCYx(0);
    setGPIO(GPIOA_ADDRESS,0x40); // E=1
    //Delay10TCYx(0);
    setGPIO(GPIOA_ADDRESS,0x00); // E=0
    //Delay10TCYx(0);
}


/*******************************************************************************
 * PUBLIC FUNCTIONs                                                        BEGIN
 */


/*******************************************************************************
 * Check Inputs Function
 */
void LcdInit(void)
{
#if USE_SW_SPI // use SW SPI
    SWSPIOpen();
#else // use HW SPI
    TRISAbits.RA2=0; // our chip select pin needs to be an output so that we can toggle it
    CS=1; // set CS pin to high, meaning we are sending any information to the MCP23S17 chip
    // configure SPI: the MCP23S17 chip's max frequency is 10MHz, let's use 10MHz/64 (Note FOSC=10Mhz, our external oscillator)
    OpenSPI1(SPI_FOSC_64, MODE_10, SMPEND); // frequency, master-slave mode, sampling type
#endif

    // set LCD pins DB0-DB7 as outputs
    setIODIR(IODIRB_ADDRESS,0x00);
    // set RS and E LCD pins as outputs
    setIODIR(IODIRA_ADDRESS,0x00);
    // RS=0, E=0
    setGPIO(IODIRA_ADDRESS,0x00);

    // Function set: 8 bit, 2 lines, 5x8
    lcdCommand(0b00111111);

    // NO Cursor, NO blicking
    lcdCommand(0b00001100);

    // clear display
    lcdCommand(0b00000001);

    // entry mode
    lcdCommand(0b00000110);

//    // send characters
//    LcdWriteString("LCD init ..."); // using the string function
//
//    Delay1KTCYx(100);

    LcdClear();

} /* void LcdInit(void) */


/*******************************************************************************
 * Check Inputs Function
 */
void LcdClear(void)
{
    /* clear display */
    lcdCommand(0x01);
} /* void LcdClear(void) */


/*******************************************************************************
 * Check Inputs Function
 */
void LcdGoTo(char pos)
{
    // add 0x80 to be able to use HD44780 position convention
    lcdCommand(0x80+pos);
}


/*******************************************************************************
 * Check Inputs Function
 */
void LcdChar(unsigned char letter)
{
    setGPIO(GPIOA_ADDRESS,0x80); // RS=1, we going to send data to be displayed
    //Delay10TCYx(0); // let things settle down
    setGPIO(GPIOB_ADDRESS,letter); // send display character
    // Now we need to toggle the enable pin (EN) for the display to take effect
    setGPIO(GPIOA_ADDRESS, 0xc0); // RS=1, EN=1
    //Delay10TCYx(0); // let things settle down, this time just needs to be long enough for the chip to detect it as high
    setGPIO(GPIOA_ADDRESS,0x00); // RS=0, EN=0 // this completes the enable pin toggle
    //Delay10TCYx(0);
} /* void LcdChar(unsigned char letter) */


/*******************************************************************************
 * Check Inputs Function
 */
void LcdWriteString(const char *s)
{
    while(*s)
    {
        LcdChar(*s++);
    }
} /* void LcdWriteString(char *s) */



/*******************************************************************************
 * PUBLIC FUNCTIONs                                                          END
 */