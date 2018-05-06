/*
 * File:   LCD.h
 * Author: Dragos
 *
 * Created on February 2, 2014, 11:47 PM
 */

#ifndef LCD_H
#define	LCD_H

#ifdef	__cplusplus
extern "C" {
#endif



    void LcdInit(void);
    void LcdClear(void);
    void LcdGoTo(char pos);
    void LcdChar(unsigned char letter);
    void LcdWriteString(const char *s);


#ifdef	__cplusplus
}
#endif

#endif	/* LCD_H */

