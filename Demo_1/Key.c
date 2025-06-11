#include "Key.h"


unsigned char delay1;
unsigned char delay0;
/**
 * @brief 初始化键盘接口
 * 
 * 本函数对键盘接口进行初始化设置，包括配置端口B的输出、唤醒和中断设置。
 * 这些设置确保了键盘可以正确与系统进行通信，并且能够在按下键盘按钮时触发中断。
 */
void Key_Scan()
{
    if (KEY)
    {
        // 如果按键按下标志已置位，进行按键按下计数和标志重置
        if (Key_Press_FLAG)
        {
            Key_Press_FLAG = 0;
            Key_Press_Cnt = 0;
        }
    }
    else if (!Key_Press_FLAG)
    {
        // 如果按键按下标志未置位，进行按键按下标志和计数重置
        if (!Key_Press_FLAG)
        {
            Key_Press_FLAG = 1;
            Key_Press_Cnt = 0;
        }
    }
    
    // 按键去抖动逻辑
    if (Key_Press_Cnt >= Key_Debounce_Time)
    {
        // 根据按键按下标志设置去抖动标志
        if (Key_Press_FLAG)
        {
            Key_Debounce_FLAG = 1;
        }
        else
        {
            Key_Debounce_FLAG = 0;
        }
    
        // 如果去抖动标志已置位，进行长按计数
        if (Key_Debounce_FLAG)
        {
            if (Key_Long_Cnt <= Key_Long_Time)
            {
                Key_Long_Cnt++;
            }
        }
    
        // 重置按键按下计数
        Key_Press_Cnt = 0;
    }
    
    // 如果去抖动标志未置位，处理短按逻辑
    if (!Key_Debounce_FLAG)
    {
        if (Key_Long_Cnt)
        {
            // 如果长按计数小于长按时间且电源开启，进行短按操作
            if (Key_Long_Cnt < Key_Long_Time && Power_OnOff_FLAG)
            {
                Key_LED_Flash_FLAG = 1;
                M1_PWM_Write_FLAG = 1;
                M1_Freq_Change_Set++;
                if (M1_Freq_Change_Set > 10)
                {
                    M1_Freq_Change_Set = 1;
                }
            }
    
            // 重置长按计数
            Key_Long_Cnt = 0;
        }
    }
    
    // 如果长按计数达到长按时间，进行长按操作
    if (Key_Long_Cnt == Key_Long_Time)
    {
        Key_Long_Cnt++;
        if (Power_OnOff_FLAG)
        {
            Power_Off();
        }
        else
        {
            Power_OnOff_FLAG = 1;
            M1_PWM_Write_FLAG = 1;
            M1_Freq_Change_Set = 1;
            Key_LED_Flash_FLAG = 1;
        }
    }
}