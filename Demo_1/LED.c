#include "LED.h"

/**
 * Change_LED_State函数用于控制LED的状态
 * 此函数通过改变PORTB寄存器的值来控制LED的亮灭
 * 
 * @param state LED的状态，非零表示点亮LED，零表示熄灭LED
 */
void Change_LED_State(unsigned char state)
{ 
    // 根据传入的状态参数决定是否点亮LED
    if(state)
    {
        // 若状态为非零，设置PORTB的第1位为高电平，关闭LED
        PORTB |= (1 << 1);
    }
    else
    {
        // 若状态为零，清除PORTB的第1位为低电平，点亮LED
        PORTB &= ~(1 << 1);
    }
}

void LED()
{
    if (!Power_OnOff_FLAG && !Charging_FLAG)
    {
        LED_OFF;
    }
    
    else if (Charge_LED_Breathing_FLAG && !Charge_Full_LED_Light_FLAG)
    {
        if (LED_Charge_Time >= LED_Change_Flash_Time)
        {
            LED_Charge_Time = 0;
            LED1 =~  LED1;
        }
    }

    else if (Charge_LED_Breathing_FLAG && Charge_Full_LED_Light_FLAG)
    {
        LED_ON;
    }
    
    else if (Key_LED_Flash_FLAG)
    {
        LED_OFF;
        if (Key_Short_LED_Cnt >= Key_Short_LED_Time)
        {
            Key_Short_LED_Cnt = 0;
            LED_ON;
            Key_LED_Flash_FLAG = 0;
        }
    }
    else
    {
        LED_ON;
    }
}