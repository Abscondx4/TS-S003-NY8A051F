#include "Delay.h"

// char Unit_Time; //计时器中断时间100us
// char Timer_1ms;
// char Timer_10ms;
// char Timer_100ms;
// char Timer_1s;

/**
 * 延时函数，提供微秒级别的延时
 * 
 * @param us 延时的微秒数，表示需要延时的时间长度
 * 
 * 该函数通过循环调用CLRWDT()函数来实现延时，每次循环相当于一个微秒的延时
 * CLRWDT()函数在此处的作用是重置看门狗定时器，以防止在长时间运行的循环中看门狗定时器触发系统复位
 */
void Delay_us(short us)
{
    for (short i = 0; i < us; i++)
    {
        CLRWDT();
    }
}

void Delay_ms(short ms)
{
    for (short i = 0; i < ms; i++)
    {
        Delay_us(1000);
    }
}

void Clock()
{
    if (Unit_Time >= TIME_1MS)
    {
        Unit_Time = 0;
        Timer_1ms++;
        Charge_Cnt++;
        Key_Press_Cnt++;    //按键按下计时
        if (Timer_1ms  >= TIME_10MS)
        {
            Sleep_Cnt++;
            if (Key_LED_Flash_FLAG)
            {
                Key_Short_LED_Cnt++;
            }
            Timer_1ms = 0;
            Timer_10ms++;
            if (Timer_10ms  >= TIME_100MS)
            {
                LED_Charge_Time++;
                // LED_Off_Cnt++;
                Timer_10ms = 0;
                Timer_100ms++;
                if (Timer_100ms  >= TIME_1S)
                {
                    Timer_100ms = 0;
                    // Time_Temp = 1;
                    Timer_1s++;
                    Full_Cnt++;
                    if (Timer_1s  >= TIME_1MIN)
                    {
                        Timer_1s = 0;
                        Timer_1min++;
                        // if (Timer_1min >= TIME_STANDBY)
                        // {
                        //     Power_Off();
                        // }
                    }
                }
            }
        }
    }
}

void Reset_Clock()
{
    Timer_1ms = 0;
    Timer_10ms = 0;
    Timer_100ms = 0;
    Timer_1s = 0;
    Timer_1min = 0;
}