#include "IncluDoc.h"

flag_t My_Flag;

char my_flag0 = 0;
char my_flag1 = 0;
char my_flag2 = 0;
char my_flag3 = 0;
char my_flag4 = 0;

short M1_Cycle = 0;
short M1_Cycle_Set = 0;
short M1_Cycle_1_Set = 0;

short M1_Duty = 0;
short M1_Duty_Set = 0;
short M1_Duty_1_Set = 0;

char Motor_Freq_Change = 0;
char Motor_Freq_Cnt0 = 0;
short Motor_Freq_Cnt1 = 0;
char Motor_Freq_Cnt2 = 0;

char M1_Freq_Change = 0;
char M1_Freq_Change_Set = 0;

short M1_Cnt = 0;

short Motor_Peri_1 = 0;
short Motor_Peri_10 = 0;
short Motor_Peri_100 = 0;
short Motor_Peri_1000 = 0;
short Motor_Counter_FLAG = 0;

char Key_Press_Cnt = 0;
char Key_Long_Cnt = 0;
char Key_Short_LED_Cnt;

short Sleep_Cnt = 0;

char Full_Cnt = 0;

char LED_Charge_Time = 0;
char LED_Off_Cnt = 0;
char Charge_Cnt = 0;

char Time_Temp = 1;
char LED_FLAG = 0;

char Unit_Time; //计时器中断时间100us
char Timer_1ms;
char Timer_10ms;
char Timer_100ms;
char Timer_1s;
char Timer_1min;

void Init()
{
    //初始化IO口

    PCON = C_WDT_En|C_LVR_En ;


	IOSTB=C_PB0_Input | C_PB1_Output | C_PB2_Output | C_PB3_Input; 
    PORTB = 0x02;   
    BPHCON = 0xf1;


    PCON1=C_TMR0_En;         //启动定时器0；
    TMR0=0x38;               //设置为216
    T0MD=C_PS0_TMR0 | C_PS0_Div2;         //分频器给TMR0


    //配置按键唤醒
    BWUCON =C_PB0_Wakeup | C_PB3_Wakeup;


    //配置定时器1中断
    T0IE = 1;


    INTF = 0;
    ENI();

}
