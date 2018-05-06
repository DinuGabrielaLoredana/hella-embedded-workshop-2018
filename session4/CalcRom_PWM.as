opt subtitle "Microchip Technology Omniscient Code Generator (Lite mode) build 55553"

opt pagewidth 120

	opt lm

	processor	18F8722
porta	equ	0F80h
portb	equ	0F81h
portc	equ	0F82h
portd	equ	0F83h
porte	equ	0F84h
lata	equ	0F89h
latb	equ	0F8Ah
latc	equ	0F8Bh
latd	equ	0F8Ch
late	equ	0F8Dh
trisa	equ	0F92h
trisb	equ	0F93h
trisc	equ	0F94h
trisd	equ	0F95h
trise	equ	0F96h
pie1	equ	0F9Dh
pir1	equ	0F9Eh
ipr1	equ	0F9Fh
pie2	equ	0FA0h
pir2	equ	0FA1h
ipr2	equ	0FA2h
t3con	equ	0FB1h
tmr3l	equ	0FB2h
tmr3h	equ	0FB3h
ccp1con	equ	0FBDh
ccpr1l	equ	0FBEh
ccpr1h	equ	0FBFh
adcon1	equ	0FC1h
adcon0	equ	0FC2h
adresl	equ	0FC3h
adresh	equ	0FC4h
sspcon2	equ	0FC5h
sspcon1	equ	0FC6h
sspstat	equ	0FC7h
sspadd	equ	0FC8h
sspbuf	equ	0FC9h
t2con	equ	0FCAh
pr2	equ	0FCBh
tmr2	equ	0FCCh
t1con	equ	0FCDh
tmr1l	equ	0FCEh
tmr1h	equ	0FCFh
rcon	equ	0FD0h
wdtcon	equ	0FD1h
lvdcon	equ	0FD2h
osccon	equ	0FD3h
t0con	equ	0FD5h
tmr0l	equ	0FD6h
tmr0h	equ	0FD7h
status	equ	0FD8h
fsr2	equ	0FD9h
fsr2l	equ	0FD9h
fsr2h	equ	0FDAh
plusw2	equ	0FDBh
preinc2	equ	0FDCh
postdec2	equ	0FDDh
postinc2	equ	0FDEh
indf2	equ	0FDFh
bsr	equ	0FE0h
fsr1	equ	0FE1h
fsr1l	equ	0FE1h
fsr1h	equ	0FE2h
plusw1	equ	0FE3h
preinc1	equ	0FE4h
postdec1	equ	0FE5h
postinc1	equ	0FE6h
indf1	equ	0FE7h
wreg	equ	0FE8h
fsr0	equ	0FE9h
fsr0l	equ	0FE9h
fsr0h	equ	0FEAh
plusw0	equ	0FEBh
preinc0	equ	0FECh
postdec0	equ	0FEDh
postinc0	equ	0FEEh
indf0	equ	0FEFh
intcon3	equ	0FF0h
intcon2	equ	0FF1h
intcon	equ	0FF2h
prod	equ	0FF3h
prodl	equ	0FF3h
prodh	equ	0FF4h
tablat	equ	0FF5h
tblptr	equ	0FF6h
tblptrl	equ	0FF6h
tblptrh	equ	0FF7h
tblptru	equ	0FF8h
pcl	equ	0FF9h
pclat	equ	0FFAh
pclath	equ	0FFAh
pclatu	equ	0FFBh
stkptr	equ	0FFCh
tosl	equ	0FFDh
tosh	equ	0FFEh
tosu	equ	0FFFh
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,w
	movf indf1,w
endm
popf macro arg1
	movf postdec1,w
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 46 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP2CON2 equ 0F62h ;# 
# 202 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP2CON1 equ 0F63h ;# 
# 321 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP2STAT equ 0F64h ;# 
# 727 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP2ADD equ 0F65h ;# 
# 809 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP2BUF equ 0F66h ;# 
# 815 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP2DEL equ 0F67h ;# 
# 934 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP2AS equ 0F68h ;# 
# 1065 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP3DEL equ 0F69h ;# 
# 1184 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP3AS equ 0F6Ah ;# 
# 1315 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCSTA2 equ 0F6Bh ;# 
# 1494 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXSTA2 equ 0F6Ch ;# 
# 1655 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXREG2 equ 0F6Dh ;# 
# 1661 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCREG2 equ 0F6Eh ;# 
# 1667 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRG2 equ 0F6Fh ;# 
# 1673 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCP5CON equ 0F70h ;# 
# 1751 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR5 equ 0F71h ;# 
# 1757 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR5L equ 0F71h ;# 
# 1763 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR5H equ 0F72h ;# 
# 1769 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCP4CON equ 0F73h ;# 
# 1847 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR4 equ 0F74h ;# 
# 1853 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR4L equ 0F74h ;# 
# 1859 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR4H equ 0F75h ;# 
# 1865 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
T4CON equ 0F76h ;# 
# 1935 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PR4 equ 0F77h ;# 
# 1941 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR4 equ 0F78h ;# 
# 1947 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP1DEL equ 0F79h ;# 
# 2066 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
BAUDCON2 equ 0F7Ch ;# 
# 2184 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRGH2 equ 0F7Dh ;# 
# 2190 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
BAUDCON1 equ 0F7Eh ;# 
# 2195 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
BAUDCON equ 0F7Eh ;# 
# 2199 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
BAUDCTL equ 0F7Eh ;# 
# 2621 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRGH1 equ 0F7Fh ;# 
# 2626 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRGH equ 0F7Fh ;# 
# 2632 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTA equ 0F80h ;# 
# 2779 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTB equ 0F81h ;# 
# 2932 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTC equ 0F82h ;# 
# 3186 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTD equ 0F83h ;# 
# 3404 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTE equ 0F84h ;# 
# 3787 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTF equ 0F85h ;# 
# 3954 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTG equ 0F86h ;# 
# 4132 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTH equ 0F87h ;# 
# 4342 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTJ equ 0F88h ;# 
# 4547 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATA equ 0F89h ;# 
# 4679 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATB equ 0F8Ah ;# 
# 4811 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATC equ 0F8Bh ;# 
# 4943 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATD equ 0F8Ch ;# 
# 5075 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATE equ 0F8Dh ;# 
# 5207 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATF equ 0F8Eh ;# 
# 5339 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATG equ 0F8Fh ;# 
# 5432 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATH equ 0F90h ;# 
# 5564 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATJ equ 0F91h ;# 
# 5696 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISA equ 0F92h ;# 
# 5701 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRA equ 0F92h ;# 
# 5917 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISB equ 0F93h ;# 
# 5922 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRB equ 0F93h ;# 
# 6138 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISC equ 0F94h ;# 
# 6143 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRC equ 0F94h ;# 
# 6359 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISD equ 0F95h ;# 
# 6364 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRD equ 0F95h ;# 
# 6580 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISE equ 0F96h ;# 
# 6585 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRE equ 0F96h ;# 
# 6801 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISF equ 0F97h ;# 
# 6806 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRF equ 0F97h ;# 
# 7022 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISG equ 0F98h ;# 
# 7027 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRG equ 0F98h ;# 
# 7171 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISH equ 0F99h ;# 
# 7176 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRH equ 0F99h ;# 
# 7392 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISJ equ 0F9Ah ;# 
# 7397 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRJ equ 0F9Ah ;# 
# 7613 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
OSCTUNE equ 0F9Bh ;# 
# 7677 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
MEMCON equ 0F9Ch ;# 
# 7737 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIE1 equ 0F9Dh ;# 
# 7819 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIR1 equ 0F9Eh ;# 
# 7901 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
IPR1 equ 0F9Fh ;# 
# 7983 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIE2 equ 0FA0h ;# 
# 8054 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIR2 equ 0FA1h ;# 
# 8125 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
IPR2 equ 0FA2h ;# 
# 8196 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIE3 equ 0FA3h ;# 
# 8319 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIR3 equ 0FA4h ;# 
# 8398 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
IPR3 equ 0FA5h ;# 
# 8477 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
EECON1 equ 0FA6h ;# 
# 8542 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
EECON2 equ 0FA7h ;# 
# 8548 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
EEDATA equ 0FA8h ;# 
# 8554 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
EEADR equ 0FA9h ;# 
# 8560 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
EEADRH equ 0FAAh ;# 
# 8566 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCSTA1 equ 0FABh ;# 
# 8571 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCSTA equ 0FABh ;# 
# 8889 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXSTA1 equ 0FACh ;# 
# 8894 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXSTA equ 0FACh ;# 
# 9176 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXREG1 equ 0FADh ;# 
# 9181 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXREG equ 0FADh ;# 
# 9187 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCREG1 equ 0FAEh ;# 
# 9192 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCREG equ 0FAEh ;# 
# 9198 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRG1 equ 0FAFh ;# 
# 9203 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRG equ 0FAFh ;# 
# 9209 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PSPCON equ 0FB0h ;# 
# 9247 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
T3CON equ 0FB1h ;# 
# 9369 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR3 equ 0FB2h ;# 
# 9375 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR3L equ 0FB2h ;# 
# 9381 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR3H equ 0FB3h ;# 
# 9387 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CMCON equ 0FB4h ;# 
# 9482 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CVRCON equ 0FB5h ;# 
# 9560 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP1AS equ 0FB6h ;# 
# 9691 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCP3CON equ 0FB7h ;# 
# 9696 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP3CON equ 0FB7h ;# 
# 9882 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR3 equ 0FB8h ;# 
# 9888 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR3L equ 0FB8h ;# 
# 9894 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR3H equ 0FB9h ;# 
# 9900 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCP2CON equ 0FBAh ;# 
# 9905 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP2CON equ 0FBAh ;# 
# 10091 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR2 equ 0FBBh ;# 
# 10097 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR2L equ 0FBBh ;# 
# 10103 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR2H equ 0FBCh ;# 
# 10109 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCP1CON equ 0FBDh ;# 
# 10114 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP1CON equ 0FBDh ;# 
# 10300 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR1 equ 0FBEh ;# 
# 10306 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR1L equ 0FBEh ;# 
# 10312 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR1H equ 0FBFh ;# 
# 10318 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADCON2 equ 0FC0h ;# 
# 10388 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADCON1 equ 0FC1h ;# 
# 10478 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADCON0 equ 0FC2h ;# 
# 10600 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADRES equ 0FC3h ;# 
# 10606 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADRESL equ 0FC3h ;# 
# 10612 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADRESH equ 0FC4h ;# 
# 10618 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP1CON2 equ 0FC5h ;# 
# 10623 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSPCON2 equ 0FC5h ;# 
# 11061 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP1CON1 equ 0FC6h ;# 
# 11066 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSPCON1 equ 0FC6h ;# 
# 11340 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP1STAT equ 0FC7h ;# 
# 11345 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSPSTAT equ 0FC7h ;# 
# 12013 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP1ADD equ 0FC8h ;# 
# 12018 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSPADD equ 0FC8h ;# 
# 12318 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP1BUF equ 0FC9h ;# 
# 12323 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSPBUF equ 0FC9h ;# 
# 12329 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
T2CON equ 0FCAh ;# 
# 12399 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PR2 equ 0FCBh ;# 
# 12405 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR2 equ 0FCCh ;# 
# 12411 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
T1CON equ 0FCDh ;# 
# 12524 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR1 equ 0FCEh ;# 
# 12530 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR1L equ 0FCEh ;# 
# 12536 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR1H equ 0FCFh ;# 
# 12542 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCON equ 0FD0h ;# 
# 12674 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
WDTCON equ 0FD1h ;# 
# 12701 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
HLVDCON equ 0FD2h ;# 
# 12706 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LVDCON equ 0FD2h ;# 
# 12972 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
OSCCON equ 0FD3h ;# 
# 13054 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
T0CON equ 0FD5h ;# 
# 13129 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR0 equ 0FD6h ;# 
# 13135 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR0L equ 0FD6h ;# 
# 13141 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR0H equ 0FD7h ;# 
# 13147 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
STATUS equ 0FD8h ;# 
# 13225 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR2 equ 0FD9h ;# 
# 13231 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR2L equ 0FD9h ;# 
# 13237 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR2H equ 0FDAh ;# 
# 13243 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PLUSW2 equ 0FDBh ;# 
# 13249 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PREINC2 equ 0FDCh ;# 
# 13255 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTDEC2 equ 0FDDh ;# 
# 13261 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTINC2 equ 0FDEh ;# 
# 13267 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INDF2 equ 0FDFh ;# 
# 13273 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
BSR equ 0FE0h ;# 
# 13279 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR1 equ 0FE1h ;# 
# 13285 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR1L equ 0FE1h ;# 
# 13291 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR1H equ 0FE2h ;# 
# 13297 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PLUSW1 equ 0FE3h ;# 
# 13303 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PREINC1 equ 0FE4h ;# 
# 13309 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTDEC1 equ 0FE5h ;# 
# 13315 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTINC1 equ 0FE6h ;# 
# 13321 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INDF1 equ 0FE7h ;# 
# 13327 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
WREG equ 0FE8h ;# 
# 13333 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR0 equ 0FE9h ;# 
# 13339 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR0L equ 0FE9h ;# 
# 13345 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR0H equ 0FEAh ;# 
# 13351 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PLUSW0 equ 0FEBh ;# 
# 13357 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PREINC0 equ 0FECh ;# 
# 13363 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTDEC0 equ 0FEDh ;# 
# 13369 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTINC0 equ 0FEEh ;# 
# 13375 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INDF0 equ 0FEFh ;# 
# 13381 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INTCON3 equ 0FF0h ;# 
# 13492 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INTCON2 equ 0FF1h ;# 
# 13584 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INTCON equ 0FF2h ;# 
# 13720 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PROD equ 0FF3h ;# 
# 13726 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PRODL equ 0FF3h ;# 
# 13732 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PRODH equ 0FF4h ;# 
# 13738 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TABLAT equ 0FF5h ;# 
# 13746 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TBLPTR equ 0FF6h ;# 
# 13752 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TBLPTRL equ 0FF6h ;# 
# 13758 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TBLPTRH equ 0FF7h ;# 
# 13764 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TBLPTRU equ 0FF8h ;# 
# 13772 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PCLAT equ 0FF9h ;# 
# 13779 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PC equ 0FF9h ;# 
# 13785 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PCL equ 0FF9h ;# 
# 13791 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PCLATH equ 0FFAh ;# 
# 13797 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PCLATU equ 0FFBh ;# 
# 13803 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
STKPTR equ 0FFCh ;# 
# 13908 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TOS equ 0FFDh ;# 
# 13914 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TOSL equ 0FFDh ;# 
# 13920 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TOSH equ 0FFEh ;# 
# 13926 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TOSU equ 0FFFh ;# 
# 46 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP2CON2 equ 0F62h ;# 
# 202 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP2CON1 equ 0F63h ;# 
# 321 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP2STAT equ 0F64h ;# 
# 727 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP2ADD equ 0F65h ;# 
# 809 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP2BUF equ 0F66h ;# 
# 815 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP2DEL equ 0F67h ;# 
# 934 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP2AS equ 0F68h ;# 
# 1065 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP3DEL equ 0F69h ;# 
# 1184 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP3AS equ 0F6Ah ;# 
# 1315 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCSTA2 equ 0F6Bh ;# 
# 1494 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXSTA2 equ 0F6Ch ;# 
# 1655 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXREG2 equ 0F6Dh ;# 
# 1661 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCREG2 equ 0F6Eh ;# 
# 1667 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRG2 equ 0F6Fh ;# 
# 1673 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCP5CON equ 0F70h ;# 
# 1751 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR5 equ 0F71h ;# 
# 1757 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR5L equ 0F71h ;# 
# 1763 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR5H equ 0F72h ;# 
# 1769 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCP4CON equ 0F73h ;# 
# 1847 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR4 equ 0F74h ;# 
# 1853 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR4L equ 0F74h ;# 
# 1859 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR4H equ 0F75h ;# 
# 1865 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
T4CON equ 0F76h ;# 
# 1935 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PR4 equ 0F77h ;# 
# 1941 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR4 equ 0F78h ;# 
# 1947 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP1DEL equ 0F79h ;# 
# 2066 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
BAUDCON2 equ 0F7Ch ;# 
# 2184 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRGH2 equ 0F7Dh ;# 
# 2190 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
BAUDCON1 equ 0F7Eh ;# 
# 2195 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
BAUDCON equ 0F7Eh ;# 
# 2199 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
BAUDCTL equ 0F7Eh ;# 
# 2621 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRGH1 equ 0F7Fh ;# 
# 2626 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRGH equ 0F7Fh ;# 
# 2632 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTA equ 0F80h ;# 
# 2779 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTB equ 0F81h ;# 
# 2932 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTC equ 0F82h ;# 
# 3186 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTD equ 0F83h ;# 
# 3404 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTE equ 0F84h ;# 
# 3787 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTF equ 0F85h ;# 
# 3954 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTG equ 0F86h ;# 
# 4132 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTH equ 0F87h ;# 
# 4342 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PORTJ equ 0F88h ;# 
# 4547 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATA equ 0F89h ;# 
# 4679 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATB equ 0F8Ah ;# 
# 4811 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATC equ 0F8Bh ;# 
# 4943 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATD equ 0F8Ch ;# 
# 5075 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATE equ 0F8Dh ;# 
# 5207 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATF equ 0F8Eh ;# 
# 5339 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATG equ 0F8Fh ;# 
# 5432 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATH equ 0F90h ;# 
# 5564 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LATJ equ 0F91h ;# 
# 5696 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISA equ 0F92h ;# 
# 5701 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRA equ 0F92h ;# 
# 5917 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISB equ 0F93h ;# 
# 5922 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRB equ 0F93h ;# 
# 6138 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISC equ 0F94h ;# 
# 6143 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRC equ 0F94h ;# 
# 6359 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISD equ 0F95h ;# 
# 6364 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRD equ 0F95h ;# 
# 6580 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISE equ 0F96h ;# 
# 6585 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRE equ 0F96h ;# 
# 6801 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISF equ 0F97h ;# 
# 6806 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRF equ 0F97h ;# 
# 7022 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISG equ 0F98h ;# 
# 7027 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRG equ 0F98h ;# 
# 7171 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISH equ 0F99h ;# 
# 7176 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRH equ 0F99h ;# 
# 7392 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TRISJ equ 0F9Ah ;# 
# 7397 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
DDRJ equ 0F9Ah ;# 
# 7613 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
OSCTUNE equ 0F9Bh ;# 
# 7677 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
MEMCON equ 0F9Ch ;# 
# 7737 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIE1 equ 0F9Dh ;# 
# 7819 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIR1 equ 0F9Eh ;# 
# 7901 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
IPR1 equ 0F9Fh ;# 
# 7983 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIE2 equ 0FA0h ;# 
# 8054 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIR2 equ 0FA1h ;# 
# 8125 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
IPR2 equ 0FA2h ;# 
# 8196 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIE3 equ 0FA3h ;# 
# 8319 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PIR3 equ 0FA4h ;# 
# 8398 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
IPR3 equ 0FA5h ;# 
# 8477 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
EECON1 equ 0FA6h ;# 
# 8542 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
EECON2 equ 0FA7h ;# 
# 8548 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
EEDATA equ 0FA8h ;# 
# 8554 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
EEADR equ 0FA9h ;# 
# 8560 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
EEADRH equ 0FAAh ;# 
# 8566 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCSTA1 equ 0FABh ;# 
# 8571 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCSTA equ 0FABh ;# 
# 8889 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXSTA1 equ 0FACh ;# 
# 8894 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXSTA equ 0FACh ;# 
# 9176 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXREG1 equ 0FADh ;# 
# 9181 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TXREG equ 0FADh ;# 
# 9187 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCREG1 equ 0FAEh ;# 
# 9192 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCREG equ 0FAEh ;# 
# 9198 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRG1 equ 0FAFh ;# 
# 9203 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SPBRG equ 0FAFh ;# 
# 9209 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PSPCON equ 0FB0h ;# 
# 9247 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
T3CON equ 0FB1h ;# 
# 9369 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR3 equ 0FB2h ;# 
# 9375 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR3L equ 0FB2h ;# 
# 9381 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR3H equ 0FB3h ;# 
# 9387 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CMCON equ 0FB4h ;# 
# 9482 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CVRCON equ 0FB5h ;# 
# 9560 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP1AS equ 0FB6h ;# 
# 9691 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCP3CON equ 0FB7h ;# 
# 9696 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP3CON equ 0FB7h ;# 
# 9882 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR3 equ 0FB8h ;# 
# 9888 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR3L equ 0FB8h ;# 
# 9894 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR3H equ 0FB9h ;# 
# 9900 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCP2CON equ 0FBAh ;# 
# 9905 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP2CON equ 0FBAh ;# 
# 10091 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR2 equ 0FBBh ;# 
# 10097 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR2L equ 0FBBh ;# 
# 10103 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR2H equ 0FBCh ;# 
# 10109 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCP1CON equ 0FBDh ;# 
# 10114 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ECCP1CON equ 0FBDh ;# 
# 10300 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR1 equ 0FBEh ;# 
# 10306 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR1L equ 0FBEh ;# 
# 10312 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
CCPR1H equ 0FBFh ;# 
# 10318 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADCON2 equ 0FC0h ;# 
# 10388 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADCON1 equ 0FC1h ;# 
# 10478 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADCON0 equ 0FC2h ;# 
# 10600 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADRES equ 0FC3h ;# 
# 10606 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADRESL equ 0FC3h ;# 
# 10612 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
ADRESH equ 0FC4h ;# 
# 10618 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP1CON2 equ 0FC5h ;# 
# 10623 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSPCON2 equ 0FC5h ;# 
# 11061 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP1CON1 equ 0FC6h ;# 
# 11066 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSPCON1 equ 0FC6h ;# 
# 11340 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP1STAT equ 0FC7h ;# 
# 11345 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSPSTAT equ 0FC7h ;# 
# 12013 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP1ADD equ 0FC8h ;# 
# 12018 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSPADD equ 0FC8h ;# 
# 12318 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSP1BUF equ 0FC9h ;# 
# 12323 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
SSPBUF equ 0FC9h ;# 
# 12329 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
T2CON equ 0FCAh ;# 
# 12399 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PR2 equ 0FCBh ;# 
# 12405 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR2 equ 0FCCh ;# 
# 12411 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
T1CON equ 0FCDh ;# 
# 12524 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR1 equ 0FCEh ;# 
# 12530 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR1L equ 0FCEh ;# 
# 12536 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR1H equ 0FCFh ;# 
# 12542 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
RCON equ 0FD0h ;# 
# 12674 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
WDTCON equ 0FD1h ;# 
# 12701 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
HLVDCON equ 0FD2h ;# 
# 12706 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
LVDCON equ 0FD2h ;# 
# 12972 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
OSCCON equ 0FD3h ;# 
# 13054 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
T0CON equ 0FD5h ;# 
# 13129 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR0 equ 0FD6h ;# 
# 13135 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR0L equ 0FD6h ;# 
# 13141 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TMR0H equ 0FD7h ;# 
# 13147 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
STATUS equ 0FD8h ;# 
# 13225 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR2 equ 0FD9h ;# 
# 13231 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR2L equ 0FD9h ;# 
# 13237 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR2H equ 0FDAh ;# 
# 13243 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PLUSW2 equ 0FDBh ;# 
# 13249 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PREINC2 equ 0FDCh ;# 
# 13255 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTDEC2 equ 0FDDh ;# 
# 13261 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTINC2 equ 0FDEh ;# 
# 13267 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INDF2 equ 0FDFh ;# 
# 13273 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
BSR equ 0FE0h ;# 
# 13279 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR1 equ 0FE1h ;# 
# 13285 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR1L equ 0FE1h ;# 
# 13291 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR1H equ 0FE2h ;# 
# 13297 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PLUSW1 equ 0FE3h ;# 
# 13303 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PREINC1 equ 0FE4h ;# 
# 13309 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTDEC1 equ 0FE5h ;# 
# 13315 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTINC1 equ 0FE6h ;# 
# 13321 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INDF1 equ 0FE7h ;# 
# 13327 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
WREG equ 0FE8h ;# 
# 13333 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR0 equ 0FE9h ;# 
# 13339 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR0L equ 0FE9h ;# 
# 13345 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
FSR0H equ 0FEAh ;# 
# 13351 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PLUSW0 equ 0FEBh ;# 
# 13357 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PREINC0 equ 0FECh ;# 
# 13363 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTDEC0 equ 0FEDh ;# 
# 13369 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
POSTINC0 equ 0FEEh ;# 
# 13375 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INDF0 equ 0FEFh ;# 
# 13381 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INTCON3 equ 0FF0h ;# 
# 13492 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INTCON2 equ 0FF1h ;# 
# 13584 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
INTCON equ 0FF2h ;# 
# 13720 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PROD equ 0FF3h ;# 
# 13726 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PRODL equ 0FF3h ;# 
# 13732 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PRODH equ 0FF4h ;# 
# 13738 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TABLAT equ 0FF5h ;# 
# 13746 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TBLPTR equ 0FF6h ;# 
# 13752 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TBLPTRL equ 0FF6h ;# 
# 13758 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TBLPTRH equ 0FF7h ;# 
# 13764 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TBLPTRU equ 0FF8h ;# 
# 13772 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PCLAT equ 0FF9h ;# 
# 13779 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PC equ 0FF9h ;# 
# 13785 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PCL equ 0FF9h ;# 
# 13791 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PCLATH equ 0FFAh ;# 
# 13797 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
PCLATU equ 0FFBh ;# 
# 13803 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
STKPTR equ 0FFCh ;# 
# 13908 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TOS equ 0FFDh ;# 
# 13914 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TOSL equ 0FFDh ;# 
# 13920 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TOSH equ 0FFEh ;# 
# 13926 "C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
TOSU equ 0FFFh ;# 
	FNCALL	_main,_PwmInit
	FNCALL	_main,_setDuty
	FNCALL	_main,_setPeriod
	FNROOT	_main
	global	_CCP1CON
_CCP1CON	set	0xFBD
	global	_CCPR1L
_CCPR1L	set	0xFBE
	global	_PIR1bits
_PIR1bits	set	0xF9E
	global	_PR2
_PR2	set	0xFCB
	global	_T2CON
_T2CON	set	0xFCA
	global	_TRISCbits
_TRISCbits	set	0xF94
psect	text0,class=CODE,space=0,reloc=2
; #config settings
	file	"C:\Program Files\Microchip\xc8\v1.30\include\pic18f8722.h"
	line	6168
global __ptext0
__ptext0:
global __CFG_IESO$OFF
__CFG_IESO$OFF equ 0x0
global __CFG_OSC$HS
__CFG_OSC$HS equ 0x0
global __CFG_FCMEN$OFF
__CFG_FCMEN$OFF equ 0x0
global __CFG_BOREN$OFF
__CFG_BOREN$OFF equ 0x0
global __CFG_PWRT$OFF
__CFG_PWRT$OFF equ 0x0
global __CFG_WDT$OFF
__CFG_WDT$OFF equ 0x0
global __CFG_MCLRE$ON
__CFG_MCLRE$ON equ 0x0
global __CFG_XINST$OFF
__CFG_XINST$OFF equ 0x0
global __CFG_LVP$OFF
__CFG_LVP$OFF equ 0x0
	file	"CalcRom_PWM.as"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec
global __pcstackCOMRAM
__pcstackCOMRAM:
?_PwmInit:	; 0 bytes @ 0x0
??_PwmInit:	; 0 bytes @ 0x0
?_setDuty:	; 0 bytes @ 0x0
??_setDuty:	; 0 bytes @ 0x0
?_setPeriod:	; 0 bytes @ 0x0
??_setPeriod:	; 0 bytes @ 0x0
?_main:	; 0 bytes @ 0x0
	global	setDuty@duty
setDuty@duty:	; 1 bytes @ 0x0
	global	setPeriod@period
setPeriod@period:	; 1 bytes @ 0x0
	ds   1
??_main:	; 0 bytes @ 0x1
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           95      1       1
;!    BANK0           160      0       0
;!    BANK1           256      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0
;!    BANK6           256      0       0
;!    BANK7           256      0       0
;!    BANK8           256      0       0
;!    BANK9           256      0       0
;!    BANK10          256      0       0
;!    BANK11          256      0       0
;!    BANK12          256      0       0
;!    BANK13          256      0       0
;!    BANK14          256      0       0
;!    BANK15           96      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_setDuty
;!    _main->_setPeriod
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _main in BANK6
;!
;!    None.
;!
;!Critical Paths under _main in BANK7
;!
;!    None.
;!
;!Critical Paths under _main in BANK8
;!
;!    None.
;!
;!Critical Paths under _main in BANK9
;!
;!    None.
;!
;!Critical Paths under _main in BANK10
;!
;!    None.
;!
;!Critical Paths under _main in BANK11
;!
;!    None.
;!
;!Critical Paths under _main in BANK12
;!
;!    None.
;!
;!Critical Paths under _main in BANK13
;!
;!    None.
;!
;!Critical Paths under _main in BANK14
;!
;!    None.
;!
;!Critical Paths under _main in BANK15
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0      30
;!                            _PwmInit
;!                            _setDuty
;!                          _setPeriod
;! ---------------------------------------------------------------------------------
;! (1) _setPeriod                                            1     1      0      15
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _setDuty                                              1     1      0      15
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _PwmInit                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _PwmInit
;!   _setDuty
;!   _setPeriod
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMRAM           5F      0       0       0        0.0%
;!EEDATA             400      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMRAM              5F      1       1       1        1.1%
;!STACK                0      0       0       2        0.0%
;!DATA                 0      0       0       3        0.0%
;!BITBANK0            A0      0       0       4        0.0%
;!BANK0               A0      0       0       5        0.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100      0       0       7        0.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100      0       0       9        0.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0       0      11        0.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0       0      13        0.0%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100      0       0      15        0.0%
;!BITBANK6           100      0       0      16        0.0%
;!BANK6              100      0       0      17        0.0%
;!BITBANK7           100      0       0      18        0.0%
;!BANK7              100      0       0      19        0.0%
;!BITBANK8           100      0       0      20        0.0%
;!BANK8              100      0       0      21        0.0%
;!BITBANK9           100      0       0      22        0.0%
;!BANK9              100      0       0      23        0.0%
;!BITBANK10          100      0       0      24        0.0%
;!BANK10             100      0       0      25        0.0%
;!BITBANK11          100      0       0      26        0.0%
;!BANK11             100      0       0      27        0.0%
;!BITBANK12          100      0       0      28        0.0%
;!BANK12             100      0       0      29        0.0%
;!BITBANK13          100      0       0      30        0.0%
;!BANK13             100      0       0      31        0.0%
;!ABS                  0      0       0      32        0.0%
;!BITBANK14          100      0       0      33        0.0%
;!BANK14             100      0       0      34        0.0%
;!BITBANK15           60      0       0      35        0.0%
;!BANK15              60      0       0      36        0.0%
;!BIGRAM             F5F      0       0      37        0.0%
;!BITSFR               0      0       0      40        0.0%
;!SFR                  0      0       0      40        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 4 in file "C:\Users\Roxana\Desktop\CalcRom_PWM\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_PwmInit
;;		_setDuty
;;		_setPeriod
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0
psect	text0
	file	"C:\Users\Roxana\Desktop\CalcRom_PWM\main.c"
	line	4
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
;incstack = 0
	opt	stack 30
	line	6
	
l622:
;main.c: 6: PwmInit();
	call	_PwmInit	;wreg free
	line	7
	
l624:
;main.c: 7: setPeriod(0xEF);
	movlw	(0EFh)&0ffh
	
	call	_setPeriod
	goto	l626
	line	8
;main.c: 8: while(1)
	
l33:
	line	10
	
l626:
;main.c: 9: {
;main.c: 10: setDuty(0x58);
	movlw	(058h)&0ffh
	
	call	_setDuty
	goto	l626
	line	11
	
l34:
	line	8
	goto	l626
	
l35:
	line	12
	
l36:
	global	start
	goto	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,88
	global	_setPeriod

;; *************** function _setPeriod *****************
;; Defined at:
;;		line 20 in file "C:\Users\Roxana\Desktop\CalcRom_PWM\Pwm.c"
;; Parameters:    Size  Location     Type
;;  period          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  period          1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2
	file	"C:\Users\Roxana\Desktop\CalcRom_PWM\Pwm.c"
	line	20
global __ptext1
__ptext1:
psect	text1
	file	"C:\Users\Roxana\Desktop\CalcRom_PWM\Pwm.c"
	line	20
	global	__size_of_setPeriod
	__size_of_setPeriod	equ	__end_of_setPeriod-_setPeriod
	
_setPeriod:
;incstack = 0
	opt	stack 30
;setPeriod@period stored from wreg
	movff	wreg,(c:setPeriod@period)
	line	22
	
l620:
;Pwm.c: 22: PR2 = period;
	movff	(c:setPeriod@period),(c:4043)	;volatile
	line	23
	
l24:
	return
	opt stack 0
GLOBAL	__end_of_setPeriod
	__end_of_setPeriod:
	signat	_setPeriod,4216
	global	_setDuty

;; *************** function _setDuty *****************
;; Defined at:
;;		line 15 in file "C:\Users\Roxana\Desktop\CalcRom_PWM\Pwm.c"
;; Parameters:    Size  Location     Type
;;  duty            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  duty            1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2
	line	15
global __ptext2
__ptext2:
psect	text2
	file	"C:\Users\Roxana\Desktop\CalcRom_PWM\Pwm.c"
	line	15
	global	__size_of_setDuty
	__size_of_setDuty	equ	__end_of_setDuty-_setDuty
	
_setDuty:
;incstack = 0
	opt	stack 30
;setDuty@duty stored from wreg
	movff	wreg,(c:setDuty@duty)
	line	17
	
l618:
;Pwm.c: 17: CCPR1L = duty;
	movff	(c:setDuty@duty),(c:4030)	;volatile
	line	18
	
l21:
	return
	opt stack 0
GLOBAL	__end_of_setDuty
	__end_of_setDuty:
	signat	_setDuty,4216
	global	_PwmInit

;; *************** function _PwmInit *****************
;; Defined at:
;;		line 4 in file "C:\Users\Roxana\Desktop\CalcRom_PWM\Pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2
	line	4
global __ptext3
__ptext3:
psect	text3
	file	"C:\Users\Roxana\Desktop\CalcRom_PWM\Pwm.c"
	line	4
	global	__size_of_PwmInit
	__size_of_PwmInit	equ	__end_of_PwmInit-_PwmInit
	
_PwmInit:
;incstack = 0
	opt	stack 30
	line	6
	
l612:
;Pwm.c: 6: TRISCbits.RC2=1;
	bsf	((c:3988)),c,2	;volatile
	line	7
	
l614:
;Pwm.c: 7: CCP1CON=0b00001100;
	movlw	low(0Ch)
	movwf	((c:4029)),c	;volatile
	line	8
;Pwm.c: 8: CCPR1L=0x0F;
	movlw	low(0Fh)
	movwf	((c:4030)),c	;volatile
	line	9
	
l616:
;Pwm.c: 9: PIR1bits.TMR2IF=0;
	bcf	((c:3998)),c,1	;volatile
	line	10
;Pwm.c: 10: T2CON=0b00000101;
	movlw	low(05h)
	movwf	((c:4042)),c	;volatile
	line	11
;Pwm.c: 11: while (!PIR1bits.TMR2IF);
	goto	l15
	
l16:
	
l15:
	btfss	((c:3998)),c,1	;volatile
	goto	u11
	goto	u10
u11:
	goto	l15
u10:
	
l17:
	line	12
;Pwm.c: 12: TRISCbits.RC2=0;
	bcf	((c:3988)),c,2	;volatile
	line	13
	
l18:
	return
	opt stack 0
GLOBAL	__end_of_PwmInit
	__end_of_PwmInit:
	signat	_PwmInit,88
	GLOBAL	__activetblptr
__activetblptr	EQU	0
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	end
