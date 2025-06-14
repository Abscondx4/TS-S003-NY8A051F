#ifndef IncluDoc_H
#define IncluDoc_H

#include <NY8.h>
#include "NY8_constant.h"

typedef union flag_t
{
	unsigned char all8bit;
	struct
	{
		unsigned FG0 : 1;
		unsigned FG1 : 1;
		unsigned FG2 : 1;
		unsigned FG3 : 1;
		unsigned FG4 : 1;
		unsigned FG5 : 1;
		unsigned FG6 : 1;
		unsigned FG7 : 1;
	};
} flag_t;
extern flag_t My_Flag;

extern char my_flag0;
extern char my_flag1;
extern char my_flag2;
extern char my_flag3;
extern char my_flag4;

#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define work_off_sign My_Flag.FG0
#define key_keep My_Flag.FG1
#define key_long_sign My_Flag.FG2

//充电状态检测参数设置
#define CHARGE_DET PB0
#define CHARGE_Full PB3
#define Charge_Debounce_Time 0
#define Full_Debounce_Time 5
#define LED_Change_Flash_Time 5
#define LED_Off_Time 2 // 200ms

__sbit Charge_Full_FLAG = my_flag1:4;
__sbit Charging_FLAG = my_flag1:5;
__sbit Charge_LED_Breathing_FLAG = my_flag1:6;
__sbit Charge_Full_LED_Light_FLAG = my_flag1:7;

extern char Full_Cnt;

//LED灯参数设置
#define LED1 PB1
#define LED_ON LED1 = 0
#define LED_OFF LED1 = 1

extern char LED_Charge_Time;
extern char LED_Off_Cnt;
extern char Charge_Cnt;

//电机参数设置
#define M1 PB2
#define M1_ON M1 = 1
#define M1_OFF M1 = 0
extern short M1_Cycle;
extern short M1_Cycle_Set;
extern short M1_Cycle_1_Set;

extern short M1_Duty;
extern short M1_Duty_Set;
extern short M1_Duty_1_Set;

extern char Motor_Freq_Change;
extern char Motor_Freq_Cnt0;
extern short Motor_Freq_Cnt1;
extern char Motor_Freq_Cnt2;

extern char M1_Freq_Change;
extern char M1_Freq_Change_Set;

extern short M1_Cnt;

__sbit M1_Work_FLAG = my_flag1:2;
__sbit M1_PWM_Write_FLAG = my_flag1:3;

extern short Motor_Peri_1;
extern short Motor_Peri_10;
extern short Motor_Peri_100;
extern short Motor_Peri_1000;
extern short Motor_Counter_FLAG;

//按键参数设置
#define KEY PB3
#define Key_Debounce_Time 40
#define Key_Long_Time 33
#define Key_Short_LED_Time 20
#define Key_Fast_Press_Time 400

__sbit Power_OnOff_FLAG = my_flag0:0;
__sbit Power_On_Notice_FLAG = my_flag0:1;
__sbit Key_Press_FLAG = my_flag0:2;
__sbit Key_Debounce_FLAG = my_flag0:3;
__sbit Key_LED_Flash_FLAG = my_flag0:4;
__sbit Key_Freq_Change_FLAG = my_flag0:5;

extern char Key_Press_Cnt;
extern char Key_Long_Cnt;
extern char Key_Short_LED_Cnt;

extern short Sleep_Cnt;

extern char Time_Temp;
extern char LED_FLAG;

extern char Unit_Time; //计时器中断时间100us
extern char Timer_1ms;
extern char Timer_10ms;
extern char Timer_100ms;
extern char Timer_1s;
extern char Timer_1min;

#define Low_Voltage_Time 10 // 1s
#define Low_Voltage_Debounce_Time 40 // 消抖时间40ms

void Init();

#endif
