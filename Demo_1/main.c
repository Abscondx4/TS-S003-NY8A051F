#include "IncluDoc.h"
#include "SysHead.h"

void isr(void) __interrupt(0)
{
    if (T0IF)
    {
        T0IF=0;
		TMR0=0x38;
        Unit_Time++;
        Clock();
        M1_Work_Process();
        // Motor_Counter();
    }
    
}

void main(void)
{
    // DISI();
    //Motor_Init();
    //Key_Init();
    //LED_Init()    
    Init();

    while(1)
    {
        CLRWDT();
        Charge_Dectect();
        if (Charging_FLAG)
        {
            Charge_Process();
        }
        else 
        {
            Key_Scan();
            M1_Work();
            if (Sleep_Cnt >= 220)
            {
                Sleep_Cnt = 0;
                PCON = 0;
                DISI();
                INTFbits.PBIF = 0; //清除中断标志
                INTE = C_INT_PBKey; //使能中断

                if (KEY && !CHARGE_DET)
                {
                    LED_OFF;
                    SLEEP();
                }
                
                NOP();
                NOP();

                PCON == C_WDT_En | C_LVR_En;
                INTE = C_INT_TMR0;
                ENI();
            }
            
        }
        LED();
    }
}
