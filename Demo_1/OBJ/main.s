;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Charge_Process
	extern	_Charge_Dectect
	extern	_M1_Work
	extern	_Motor_Counter_Reset
	extern	_Motor_Counter
	extern	_Motor_PWM_Loop3
	extern	_Motor_PWM_Loop2
	extern	_Motor_PWM_Loop1
	extern	_M1_Work_Process
	extern	_Motor_Init
	extern	_LED
	extern	_Change_LED_State
	extern	_Key_Scan
	extern	_Key_Init
	extern	_Reset_Clock
	extern	_Clock
	extern	_Delay_us
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_main
	extern	_isr
	extern	_my_flag0
	extern	_my_flag1
	extern	_INTF
	extern	_INTE
	extern	_BPHCON
	extern	_BPLCON
	extern	_BWUCON
	extern	_PCON
	extern	_PORTB

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

.segment "share_bank"
PSAVE:
	.res 1
.segment "share_bank"
SSAVE:
	.res 1
.segment "share_bank"
WSAVE:
	.res 1
.segment "share_bank"
___STK12:
STK12:
	.res 1
.segment "share_bank"
___STK11:
STK11:
	.res 1
.segment "share_bank"
___STK10:
STK10:
	.res 1
.segment "share_bank"
___STK09:
STK09:
	.res 1
.segment "share_bank"
___STK08:
STK08:
	.res 1
.segment "share_bank"
___STK07:
STK07:
	.res 1
.segment "share_bank"
___STK06:
STK06:
	.res 1
.segment "share_bank"
___STK05:
STK05:
	.res 1
.segment "share_bank"
___STK04:
STK04:
	.res 1
.segment "share_bank"
___STK03:
STK03:
	.res 1
.segment "share_bank"
___STK02:
STK02:
	.res 1
.segment "share_bank"
___STK01:
STK01:
	.res 1
.segment "share_bank"
___STK00:
STK00:
	.res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
___sdcc_saved_fsr:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_fsr" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk00:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk00" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk01:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk01" 1 global "" 0 (basetype 1 unsigned))
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
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _Clock
;   _M1_Work_Process
;   _Clock
;   _M1_Work_Process
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	4, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	MOVAR	___sdcc_saved_stk01
	.line	6, "main.c"; 	if (T0IF)
	BTRSS	_INTF,0
	MGOTO	_02007_DS_
	.line	8, "main.c"; 	T0IF=0;
	MOVIA	0xfe
	MOVAR	_INTF
	.line	9, "main.c"; 	TMR0=0x38;
	MOVIA	0x38
	MOVAR	_TMR0
	.line	10, "main.c"; 	Unit_Time++;
	INCR	_Unit_Time,F
	.line	11, "main.c"; 	Clock();
	MCALL	_Clock
	.line	12, "main.c"; 	M1_Work_Process();
	MCALL	_M1_Work_Process
_02007_DS_:
	.line	16, "main.c"; 	}
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _Init
;   _Charge_Dectect
;   _Charge_Process
;   _Key_Scan
;   _M1_Work
;   _LED
;   _Init
;   _Charge_Dectect
;   _Charge_Process
;   _Key_Scan
;   _M1_Work
;   _LED
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	24, "main.c"; 	Init();
	MCALL	_Init
_02021_DS_:
	.line	28, "main.c"; 	CLRWDT();
	clrwdt
	.line	29, "main.c"; 	Charge_Dectect();
	MCALL	_Charge_Dectect
	.line	30, "main.c"; 	if (Charging_FLAG)
	BTRSS	_my_flag1,5
	MGOTO	_02018_DS_
	.line	32, "main.c"; 	Charge_Process();
	MCALL	_Charge_Process
	MGOTO	_02019_DS_
_02018_DS_:
	.line	36, "main.c"; 	Key_Scan();
	MCALL	_Key_Scan
	.line	37, "main.c"; 	M1_Work();
	MCALL	_M1_Work
;;signed compare: left < lit(0xDC=220), size=2, mask=ffff
	.line	38, "main.c"; 	if (Sleep_Cnt >= 220)
	MOVR	(_Sleep_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02045_DS_
	MOVIA	0xdc
	SUBAR	_Sleep_Cnt,W
_02045_DS_:
	BTRSS	STATUS,0
	MGOTO	_02019_DS_
	.line	40, "main.c"; 	Sleep_Cnt = 0;
	CLRR	_Sleep_Cnt
	CLRR	(_Sleep_Cnt + 1)
	.line	41, "main.c"; 	PCON = 0;
	CLRR	_PCON
	.line	42, "main.c"; 	DISI();
	DISI
	.line	43, "main.c"; 	INTFbits.PBIF = 0; //清除中断标志
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
	.line	44, "main.c"; 	INTE = C_INT_PBKey; //使能中断
	MOVIA	0x02
	MOVAR	_INTE
	.line	46, "main.c"; 	if (KEY && !CHARGE_DET)
	BTRSS	_PORTB,3
	MGOTO	_02013_DS_
	BTRSC	_PORTB,0
	MGOTO	_02013_DS_
	.line	48, "main.c"; 	LED_OFF;
	BSR	_PORTB,1
	.line	49, "main.c"; 	SLEEP();
	sleep
_02013_DS_:
	.line	52, "main.c"; 	NOP();
	nop
	.line	53, "main.c"; 	NOP();
	nop
	.line	56, "main.c"; 	INTE = C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	57, "main.c"; 	ENI();
	ENI
_02019_DS_:
	.line	61, "main.c"; 	LED();
	MCALL	_LED
	MGOTO	_02021_DS_
	.line	63, "main.c"; 	}
	RETURN	
; exit point of _main


;	code size estimation:
;	   70+    0 =    70 instructions (  140 byte)

	end
