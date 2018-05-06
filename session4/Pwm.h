#ifndef PWM_H
#define PWM_H
#include "Types.h"

extern void setDuty(uint8 chanId,uint8 duty);
extern void setPeriod(uint8 period);
extern void LedAction();
extern void LedControl();

extern void PwmInit();
extern void InteruptInit();

#define RC2_0 0
#define RC1_0 1
#define RG0_0 2

#define OLD_VALUE 0
#define NEW_VALUE 1

#endif