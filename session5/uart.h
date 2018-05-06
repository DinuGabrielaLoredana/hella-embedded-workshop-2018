/* 
 * File:   UART.h
 * Author: iovadr1
 *
 * Created on March 4, 2014, 11:44 AM
 */

#ifndef UART_H
#define	UART_H

#ifdef	__cplusplus
extern "C" {
#endif


char UART_Init(void);
void UART_puts(char *s);

#ifdef	__cplusplus
}
#endif

#endif	/* UART_H */

