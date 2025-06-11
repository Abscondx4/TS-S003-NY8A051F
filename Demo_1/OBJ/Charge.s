;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Charge.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Power_Off
	extern	_Switch_Power_Mode
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
	extern	_Full_Cnt
	extern	_Charge_Cnt
	extern	_LED_Charge_Time
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
	extern	_Charge_Dectect
	extern	_Charge_Process

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
; code_Charge	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Power_Off
;   _Power_Off
;; Starting pCode block
.segment "code"; module=Charge, function=_Charge_Process
	.debuginfo subprogram _Charge_Process
_Charge_Process:
; 2 exit points
	.line	61, "Charge.c"; 	if (Power_OnOff_FLAG)
	BTRSS	_my_flag0,0
	MGOTO	_02019_DS_
	.line	63, "Charge.c"; 	Power_Off();
	MCALL	_Power_Off
_02019_DS_:
	.line	67, "Charge.c"; 	if (CHARGE_Full)
	BTRSS	_PORTB,3
	MGOTO	_02031_DS_
	.line	70, "Charge.c"; 	if (Charge_Full_FLAG)
	BTRSS	_my_flag1,4
	MGOTO	_02023_DS_
	.line	72, "Charge.c"; 	Full_Cnt = 0;
	CLRR	_Full_Cnt
	.line	73, "Charge.c"; 	Charge_Full_LED_Light_FLAG = 1;
	BSR	_my_flag1,7
	MGOTO	_02033_DS_
;;unsigned compare: left < lit(0x5=5), size=1
_02023_DS_:
	.line	75, "Charge.c"; 	else if (Full_Cnt >= Full_Debounce_Time)
	MOVIA	0x05
	SUBAR	_Full_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02033_DS_
	.line	77, "Charge.c"; 	Full_Cnt = 0;
	CLRR	_Full_Cnt
	.line	78, "Charge.c"; 	Charge_Full_FLAG = 1;
	BSR	_my_flag1,4
	MGOTO	_02033_DS_
_02031_DS_:
	.line	85, "Charge.c"; 	if (Charge_Full_FLAG)
	BTRSS	_my_flag1,4
	MGOTO	_02028_DS_
;;unsigned compare: left < lit(0x5=5), size=1
	.line	88, "Charge.c"; 	if (Full_Cnt >= Full_Debounce_Time)
	MOVIA	0x05
	SUBAR	_Full_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02033_DS_
	.line	90, "Charge.c"; 	Full_Cnt = 0;
	CLRR	_Full_Cnt
	.line	91, "Charge.c"; 	LED_Charge_Time = 0;
	CLRR	_LED_Charge_Time
	.line	92, "Charge.c"; 	Charge_Full_FLAG = 0;
	BCR	_my_flag1,4
	MGOTO	_02033_DS_
_02028_DS_:
	.line	98, "Charge.c"; 	Full_Cnt = 0;
	CLRR	_Full_Cnt
	.line	99, "Charge.c"; 	Charge_Full_LED_Light_FLAG = 0;
	BCR	_my_flag1,7
_02033_DS_:
	.line	102, "Charge.c"; 	}
	RETURN	
; exit point of _Charge_Process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Charge, function=_Charge_Dectect
	.debuginfo subprogram _Charge_Dectect
_Charge_Dectect:
; 2 exit points
	.line	12, "Charge.c"; 	if (CHARGE_DET)
	BTRSS	_PORTB,0
	MGOTO	_02011_DS_
	.line	15, "Charge.c"; 	if (Charging_FLAG)
	BTRSS	_my_flag1,5
	MGOTO	_02008_DS_
	.line	18, "Charge.c"; 	Charge_LED_Breathing_FLAG = 1;
	BSR	_my_flag1,6
	.line	20, "Charge.c"; 	Key_Long_Cnt = 0;
	CLRR	_Key_Long_Cnt
	.line	22, "Charge.c"; 	Key_Press_Cnt = 0;
	CLRR	_Key_Press_Cnt
	MGOTO	_02013_DS_
_02008_DS_:
	.line	26, "Charge.c"; 	else if (Charge_Cnt)
	MOVR	_Charge_Cnt,W
	BTRSC	STATUS,2
	MGOTO	_02013_DS_
	.line	29, "Charge.c"; 	Charge_Cnt = 0;
	CLRR	_Charge_Cnt
	.line	31, "Charge.c"; 	Charging_FLAG = 1;
	BSR	_my_flag1,5
	.line	33, "Charge.c"; 	Charge_Full_LED_Light_FLAG = 0;
	BCR	_my_flag1,7
	.line	35, "Charge.c"; 	Full_Cnt = 0;
	CLRR	_Full_Cnt
	.line	37, "Charge.c"; 	Charge_Full_FLAG = 0;
	BCR	_my_flag1,4
	MGOTO	_02013_DS_
_02011_DS_:
	.line	44, "Charge.c"; 	Charging_FLAG = 0;
	BCR	_my_flag1,5
	.line	46, "Charge.c"; 	Charge_Cnt = 0;
	CLRR	_Charge_Cnt
	.line	48, "Charge.c"; 	Charge_Full_LED_Light_FLAG = 0;
	BCR	_my_flag1,7
	.line	50, "Charge.c"; 	Charge_LED_Breathing_FLAG = 0;
	BCR	_my_flag1,6
_02013_DS_:
	.line	52, "Charge.c"; 	}
	RETURN	
; exit point of _Charge_Dectect


;	code size estimation:
;	   52+    0 =    52 instructions (  104 byte)

	end
