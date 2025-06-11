#include "Power_Mode.h"

void Switch_Power_Mode()
{
       if (key_long_sign)
       {
           UPDATE_REG(PORTB);  // 读取 PORTB 数据寄存器
           SLEEP();            // 执行指令进入 Halt 模式
       }
}

void Power_Off()
{
    Power_OnOff_FLAG = 0;
    Sleep_Cnt = 0;
    M1_Work_FLAG = 0;
    M1_Freq_Change = 0;
    M1_OFF;
}