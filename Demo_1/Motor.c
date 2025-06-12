#include "Motor.h"

/**
 * 初始化电机
 * 该函数配置必要的硬件设置，以使电机正常运行
 */

 
void M1_Work_Process() //该函数的运转周期为100us
{
    // 检查M1工作标志是否已设置
    if (M1_Work_FLAG)
    {
        // 增加M1计数器
        M1_Cnt++;
        // 检查M1计数器是否达到M1周期值
        if (M1_Cnt == M1_Cycle)
        {
            // 重置M1计数器
            M1_Cnt = 0;
            // 检查M1占空比是否大于零
            if (M1_Duty)
            {
                // 如果是，将M1设置为开启状态
                M1_ON;
            }
            else
            {
                // 如果不是，将M1设置为关闭状态
                M1_OFF;
            }
            // 重置M1周期和占空比设置
            M1_Cycle = M1_Cycle_Set;
            M1_Duty = M1_Duty_Set;
            // 设置M1 PWM写入标志
            M1_PWM_Write_FLAG = 1;
        }
        // 检查M1计数器是否达到M1占空比值
        else if (M1_Cnt == M1_Duty)
        {
            // 如果是，将M1设置为关闭状态
            M1_OFF;
        }
    }
}

/**
 * 以下Loop1/2函数用于统计输出方波数，以实现输出指定方波数的波形
 */
/**
 * Motor_PWM_Loop1函数用于控制电机的PWM信号周期。
 * 该函数通过两个计数器Motor_Freq_Cnt1和Motor_Freq_Cnt0来实现频率计数和周期重置，
 * 以支持电机的PWM信号生成。
 * 
 * @param x 一个短整型数值，用于指定Motor_Freq_Cnt1计数器的上限。
 *          当Motor_Freq_Cnt1达到这个值时，它会被重置为0，并且Motor_Freq_Cnt0会递增。
 *          这个参数允许调用者根据需要调整PWM的周期。
 */
void Motor_PWM_Loop1(short x)
{
    // 增加第一级频率计数器
    Motor_Freq_Cnt1++;
    
    // 检查第一级频率计数器是否达到上限
    if (Motor_Freq_Cnt1 == x)
    {
        // 重置第一级频率计数器
        Motor_Freq_Cnt1 = 0;
        
        // 增加第二级频率计数器
        Motor_Freq_Cnt0 ++;
    }
}

/**
 * Motor_PWM_Loop2函数用于控制电机的PWM信号周期。
 * 该函数通过递增计数器Motor_Freq_Cnt1来跟踪PWM信号的周期数。
 * 当Motor_Freq_Cnt1达到参数x的值时，重置两个计数器，以准备下一轮的计数。
 * 
 * @param x 一个短整型数值，表示Motor_Freq_Cnt1计数器的目标值。
 *          当Motor_Freq_Cnt1达到此值时，计数器将被重置。
 */
void Motor_PWM_Loop2(short x)
{
    // 递增Motor_Freq_Cnt1计数器，以跟踪PWM信号的周期数。
    Motor_Freq_Cnt1++;
    
    // 检查Motor_Freq_Cnt1是否达到参数x的值。
    if (Motor_Freq_Cnt1 == x)
    {
        // 重置Motor_Freq_Cnt1计数器，准备下一轮的计数。
        Motor_Freq_Cnt1 = 0;
        
        // 重置Motor_Freq_Cnt0计数器，这可能是为了同步两个计数器或满足特定的控制逻辑。
        Motor_Freq_Cnt0 ++;
    }
}

void Motor_PWM_Loop3(short x)
{
    Motor_Freq_Cnt1++;
    
    // 检查Motor_Freq_Cnt1是否达到参数x的值。
    if (Motor_Freq_Cnt1 == x)
    {
        // 重置Motor_Freq_Cnt1计数器，准备下一轮的计数。
        Motor_Freq_Cnt1 = 0;
        
        // 重置Motor_Freq_Cnt0计数器，这可能是为了同步两个计数器或满足特定的控制逻辑。
        Motor_Freq_Cnt0 = 0;
    }
}

void M1_Work()
{
    if (M1_PWM_Write_FLAG)
    {
        if (!(M1_Freq_Change_Set == M1_Freq_Change))
        {
            M1_Freq_Change = M1_Freq_Change_Set;
            Motor_Freq_Cnt0 = 0;
            Motor_Freq_Cnt1 = 0;
            Motor_Freq_Cnt2 = 0;
            M1_Cnt = 0;
            M1_Cycle = 1;
        }
        
        M1_PWM_Write_FLAG = 0;
        M1_Work_FLAG = 0;

        switch (M1_Freq_Change)
        {
        default:
            {
                M1_Freq_Change = 1;
                break;
            }
        case 1:
            {   
                M1_Cycle_Set = 94;
                M1_Duty_Set = 42;
                break;
            }
        case 2:
            {
                M1_Cycle_Set = 94;
                M1_Duty_Set = 64;
                break;
            }
        case  3:
            {
                M1_Cycle_Set = 100;
                M1_Duty_Set = 100;
                break;
            }
        case  4:
            {
                M1_Cycle_Set = 3478;
                M1_Duty_Set = 2817;
                break;
            }
        case  5:
            {
                if (!Motor_Freq_Cnt0)
                {
                    M1_Cycle_Set = 1974;
                    M1_Duty_Set = 1026;
                    Motor_PWM_Loop2(16);
                }
                else if (Motor_Freq_Cnt0 == 1)
                {
                    M1_Cycle_Set = 94;
                    M1_Duty_Set = 51;
                    Motor_PWM_Loop3(1600);
                }
                break;
            }
        case  6:
            {
                if (!Motor_Freq_Cnt0)
                {
                    M1_Cycle_Set = 1599;
                    M1_Duty_Set = 847;
                    Motor_PWM_Loop1(20);
                }
                else if (Motor_Freq_Cnt0 == 1)
                {
                    M1_Cycle_Set = 9588;
                    M1_Duty_Set = 4794;
                    Motor_PWM_Loop2(6);
                }
                else if (Motor_Freq_Cnt0 == 2)
                {
                    M1_Cycle_Set = 7616;
                    M1_Duty_Set = 2818;
                    Motor_PWM_Loop3(5);
                }
                break;
            }
        case 7:
            {
                if (!Motor_Freq_Cnt0)
                {
                    M1_Cycle_Set = 1128;
                    M1_Duty_Set = 564;
                    Motor_PWM_Loop1(5);
                }
                else if (Motor_Freq_Cnt0 == 1)
                {
                    M1_Cycle_Set = 3198;
                    M1_Duty_Set = 1119;
                    Motor_PWM_Loop2(10);
                }
                else if (Motor_Freq_Cnt0 == 2)
                {
                    M1_Cycle_Set = 6293;
                    M1_Duty_Set = 5160;
                    Motor_PWM_Loop3(10);
                }
                break;
            }
            case 8:
            {
                M1_Cycle_Set = 8368;
                M1_Duty_Set = 5607;
                break;
            }
            case 9:
            {
                M1_Cycle_Set = 2913;
                M1_Duty_Set = 1398;
                break;
            }
            case 10:
            {
                if (!Motor_Freq_Cnt0)
                {
                    M1_Cycle_Set = 1973;
                    M1_Duty_Set = 943;
                    Motor_PWM_Loop1(10);
                }
                else if (Motor_Freq_Cnt0 == 1)
                {
                    M1_Cycle_Set = 9311;
                    M1_Duty_Set = 4656;
                    Motor_PWM_Loop2(5);
                }
                else if (Motor_Freq_Cnt0 == 2)
                {
                    M1_Cycle_Set = 5640;
                    M1_Duty_Set = 2820;
                    Motor_PWM_Loop3(10);
                }
                break;
            }
        }

        if (M1_Freq_Change >= 1 && M1_Freq_Change <= 10)
        {
            M1_Work_FLAG =1;
        }
        
    }
    if (Power_OnOff_FLAG)
    {
        Sleep_Cnt = 0;
    }
}