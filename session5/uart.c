

#include <p18f8722.h>
#include <delays.h>


#define _XTAL_FREQ      10000000
#define UART_BAUD_RATE  9600


char UART_Init(void)
{
    unsigned int x;
    x = (_XTAL_FREQ - UART_BAUD_RATE*64)/(UART_BAUD_RATE*64); //SPBRG for Low Baud Rate

    // UART pins direction
    TRISCbits.TRISC6 = 0;   // TX
    TRISCbits.TRISC7 = 1;   // RX

    /* according to PIC manual */
    TXSTA1bits.SYNC = 0;    // Selecting Asynchronous Mode
    SPBRG = x;              // Writing SPBRG register
    TXSTAbits.TXEN =1;      // Enables Transmissio
    RCSTAbits.CREN =1;      // Enables Continuous Reception
    PIE1bits.RCIE = 1;
    RCSTA1bits.SPEN = 1;    // Enables Serial Port
    
    return 0;
} /* char UART_Init(const long int baudrate) */


void UART_Write(char data)
{
  while(!TRMT1);            // Waiting for Previous Data to Transmit completly
  TXREG = data;             // Writing data to Transmit Register, Starts transmission
} /* void UART_Write(char data) */


char UART_Data_Ready()
{
  return RCIF;
} /* char UART_Data_Ready() */


char UART_Read()
{
  while(!RCIF); //Waits for Reception to complete
  return RCREG; //Returns the 8 bit data
} /* char UART_Read() */


void UART_Read_Text(char *Output, unsigned int length)
{
  int i;
  for(int i=0;i<length;i++)
    Output[i] = UART_Read();
} /* void UART_Read_Text(char *Output, unsigned int length) */


void UART_putc(char data)
{
    TXREG = data;
    while(PIR1bits.TXIF==0);
    PIR1bits.TXIF = 0;
} /* void UART_putc(char data) */


void UART_puts(char *s)
{
    do
    {
        UART_putc(*s);
        s++;
        Delay10TCYx(250);
    } while(*s != 0);
} /* void UART_puts(char *s) */