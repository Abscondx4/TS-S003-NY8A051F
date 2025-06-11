#ifndef Charge_H
#define Charge_H

#include "IncluDoc.h"
#include "Power_Mode.h"

void Charge_Dectect();
void Charge_Process();

extern char LED_Charge_Time;
extern char Charge_Cnt;
extern char Full_Cnt;

#endif
