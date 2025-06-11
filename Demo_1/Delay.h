#ifndef Delay_H
#define Delay_H

#include "IncluDoc.h"
#include "Power_Mode.h"

void Delay_us(short us);
void Clock();
void Reset_Clock();

#define TIME_1MS 10
#define TIME_10MS 10
#define TIME_100MS 10
#define TIME_1S 10
#define TIME_1MIN 60
#define TIME_STANDBY 30

#endif
