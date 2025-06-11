;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Power_Mode.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Init
	extern	_clear_ram
	extern	_multi_16b
	extern	_multi_8b
	extern	_T0MD
	extern	_PCON1
	extern	_BODCON
	extern	_PS0CV
	extern	_IOSTB
	extern	_OSCCR
	extern	_TBHD
	extern	_TBHP
	extern	_IRCR
	extern	_BZ1CR
	extern	_PS1CV
	extern	_PWM1DUTY
	extern	_T1CR2
	extern	_T1CR1
	extern	_TMR1
	extern	_PCHBUF
	extern	_STATUS
	extern	_PCL
	extern	_TMR0
	extern	_Timer_1min
	extern	_Timer_1s
	extern	_Timer_100ms
	extern	_Timer_10ms
	extern	_Timer_1ms
	extern	_Unit_Time
	extern	_LED_FLAG
	extern	_Time_Temp
	extern	_Sleep_Cnt
	extern	_Key_Short_LED_Cnt
	extern	_Key_Long_Cnt
	extern	_Key_Press_Cnt
	extern	_Motor_Counter_FLAG
	extern	_Motor_Peri_1000
	extern	_Motor_Peri_100
	extern	_Motor_Peri_10
	extern	_Motor_Peri_1
	extern	_M1_Cnt
	extern	_M1_Freq_Change_Set
	extern	_M1_Freq_Change
	extern	_Motor_Freq_Cnt2
	extern	_Motor_Freq_Cnt1
	extern	_Motor_Freq_Cnt0
	extern	_Motor_Freq_Change
	extern	_M1_Duty_1_Set
	extern	_M1_Duty_Set
	extern	_M1_Duty
	extern	_M1_Cycle_1_Set
	extern	_M1_Cycle_Set
	extern	_M1_Cycle
	extern	_Charge_Cnt
	extern	_LED_Charge_Time
	extern	_Full_Cnt
	extern	_my_flag4
	extern	_my_flag3
	extern	_my_flag2
	extern	_My_Flag
	extern	_INTFbits
	extern	_INTEbits
	extern	_BPHCONbits
	extern	_BPLCONbits
	extern	_BWUCONbits
	extern	_PCONbits
	extern	_PORTBbits

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern ___STK12
	extern STK11
	extern ___STK11
	extern STK10
	extern ___STK10
	extern STK09
	extern ___STK09
	extern STK08
	extern ___STK08
	extern STK07
	extern ___STK07
	extern STK06
	extern ___STK06
	extern STK05
	extern ___STK05
	extern STK04
	extern ___STK04
	extern STK03
	extern ___STK03
	extern STK02
	extern ___STK02
	extern STK01
	extern ___STK01
	extern STK00
	extern ___STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_my_flag0
	extern	_my_flag1
	extern	_INTF
	extern	_INTE
	extern	_BPHCON
	extern	_BPLCON
	extern	_BWUCON
	extern	_PCON
	extern	_PORTB
	extern	_Switch_Power_Mode
	extern	_Power_Off

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_Power_Mode	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Power_Mode, function=_Power_Off
	.debuginfo subprogram _Power_Off
_Power_Off:
; 2 exit points
	.line	14, "Power_Mode.c"; 	Power_OnOff_FLAG = 0;
	BCR	_my_flag0,0
	.line	15, "Power_Mode.c"; 	Sleep_Cnt = 0;
	CLRR	_Sleep_Cnt
	CLRR	(_Sleep_Cnt + 1)
	.line	16, "Power_Mode.c"; 	M1_Work_FLAG = 0;
	BCR	_my_flag1,2
	.line	17, "Power_Mode.c"; 	M1_Freq_Change = 0;
	CLRR	_M1_Freq_Change
	.line	18, "Power_Mode.c"; 	M1_OFF;
	BCR	_PORTB,2
	.line	19, "Power_Mode.c"; 	}
	RETURN	
; exit point of _Power_Off

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Power_Mode, function=_Switch_Power_Mode
	.debuginfo subprogram _Switch_Power_Mode
_Switch_Power_Mode:
; 2 exit points
	.line	5, "Power_Mode.c"; 	if (key_long_sign)
	BTRSS	_My_Flag,2
	MGOTO	_02007_DS_
	.line	7, "Power_Mode.c"; 	UPDATE_REG(PORTB);  // 读取 PORTB 数据寄存器
	MOVR	_PORTB,F
	.line	8, "Power_Mode.c"; 	SLEEP();            // 执行指令进入 Halt 模式
	sleep
_02007_DS_:
	.line	10, "Power_Mode.c"; 	}
	RETURN	
; exit point of _Switch_Power_Mode


;	code size estimation:
;	   10+    0 =    10 instructions (   20 byte)

	end
