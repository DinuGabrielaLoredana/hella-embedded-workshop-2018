/* 
 * File:   SWSPI.h
 * Author: iovadr1
 *
 * Created on March 13, 2014, 1:38 PM
 */

#ifndef SWSPI_H
#define	SWSPI_H

#ifdef	__cplusplus
extern "C" {
#endif


/*
 * CS   - RA2
 * SCK  - RC3
 * SO   - RC5
 * SI   - RC4
 */


#define SW_CS_PIN         PORTAbits.RA2      // Chip Select
#define TRIS_SW_CS_PIN    TRISAbits.TRISA2
#define SW_DIN_PIN        PORTCbits.RC4     // Data in
#define TRIS_SW_DIN_PIN   TRISCbits.TRISC4
#define SW_DOUT_PIN       PORTCbits.RC5    // Data out
#define TRIS_SW_DOUT_PIN  TRISCbits.TRISC5
#define SW_SCK_PIN        PORTCbits.RC3     // Clock
#define TRIS_SW_SCK_PIN   TRISCbits.TRISC3


// Define the mode for software SPI
// Refer to the SPI module for PIC17C756 for definitions of CKP and CKE
// Only one mode can be uncommented, otherwise the software will not work

//#define MODE0  		// Setting for SPI bus Mode 0,0
//#define MODE1  		// Setting for SPI bus Mode 0,1
//#define MODE2  		// Setting for SPI bus Mode 1,0
//#define MODE3  		// Setting for SPI bus Mode 1,1


void SWSPIOpen(void);
char SWSPIWrite( char output);
void SWSPISetCS(void);
void SWSPIClearCS(void);




#ifdef	__cplusplus
}
#endif

#endif	/* SWSPI_H */

