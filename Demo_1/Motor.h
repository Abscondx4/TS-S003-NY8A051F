#ifndef Motor_H
#define Motor_H

#include "IncluDoc.h"

#define C_PWM_LB_DUTY_80H	0x80

void Motor_Init();
void M1_Work_Process();
void Motor_PWM_Loop1(short x);
void Motor_PWM_Loop2(short x);
void Motor_PWM_Loop3(short x);
void Motor_Counter();
void Motor_Counter_Reset();
void M1_Work();

#endif
