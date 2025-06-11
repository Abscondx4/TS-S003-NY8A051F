#include "Charge.h"

/**
 * 充电检测函数
 * 
 * 本函数用于检测充电状态，并根据不同的充电状态控制相应的标志位和计数器
 * 以实现充电状态的指示和充电完成的判断
 */
void Charge_Dectect()
{
    // 检测充电信号是否有效
    if (CHARGE_DET)
    {
        // 如果当前正在充电
        if (Charging_FLAG)
        {
            // 启用呼吸灯效果，指示正在充电
            Charge_LED_Breathing_FLAG = 1;
            // 复位长按计数器
            Key_Long_Cnt = 0;
            // 复位按键计数器
            Key_Press_Cnt = 0;
        }
        // 如果当前未在充电，但充电完成计数器达到去抖动时间
        // else if (Charge_Cnt >= Charge_Debounce_Time)
        else if (Charge_Cnt)
        {
            // 复位充电完成计数器
            Charge_Cnt = 0;
            // 设置正在充电标志位
            Charging_FLAG = 1;
            // 关闭充电完成指示灯
            Charge_Full_LED_Light_FLAG = 0;
            // 复位充电完成计数器
            Full_Cnt = 0;
            // 复位充电完成标志位
            Charge_Full_FLAG = 0;
        }
        // 如果充电完成计数器未达到去抖动时间
    }
    else
    {
        // 关闭正在充电标志位
        Charging_FLAG = 0;
        // 复位充电完成计数器
        Charge_Cnt = 0;
        // 关闭充电完成指示灯
        Charge_Full_LED_Light_FLAG = 0;
        // 关闭呼吸灯效果
        Charge_LED_Breathing_FLAG = 0;
    }
}

/**
 * 充电过程处理函数
 * 本函数主要用于监控充电状态，并根据不同的充电情况执行相应的操作
 */
void Charge_Process()
{
    // 检查电源是否开启，如果开启则关闭电源
    if (Power_OnOff_FLAG)
    {
        Power_Off();
    }

    // 检查充电是否已满
    if (CHARGE_Full)
    {
        // 如果充电已满且标志位已设置，重置计数器并保持标志位设置
        if (Charge_Full_FLAG)
        {
            Full_Cnt = 0;
            Charge_Full_LED_Light_FLAG = 1;
        }
        else if (Full_Cnt >= Full_Debounce_Time)
        {
            Full_Cnt = 0;
            Charge_Full_FLAG = 1;
        }
    }

    else
    {
        // 如果充电未满，根据充电完成标志位执行相应操作
        if (Charge_Full_FLAG)
        {
            // 如果计数器达到去抖动时间，重置相关计数器和标志位
            if (Full_Cnt >= Full_Debounce_Time)
            {
                Full_Cnt = 0;
                LED_Charge_Time = 0;
                Charge_Full_FLAG = 0;
            }
        }
        else
        {
            // 如果充电未完成标志位未设置，重置计数器并关闭充电完成指示灯
            Full_Cnt = 0;
            Charge_Full_LED_Light_FLAG = 0;
        }
    }
}