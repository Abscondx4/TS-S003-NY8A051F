;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Delay.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Low_Voltage_Detection
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
	extern	_LED_Off_Cnt
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
	extern	_Delay_us
	extern	_Delay_ms
	extern	_Clock
	extern	_Reset_Clock

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
r0x100F:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
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
; code_Delay	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Delay, function=_Reset_Clock
	.debuginfo subprogram _Reset_Clock
_Reset_Clock:
; 2 exit points
	.line	79, "Delay.c"; 	Timer_1ms = 0;
	CLRR	_Timer_1ms
	.line	80, "Delay.c"; 	Timer_10ms = 0;
	CLRR	_Timer_10ms
	.line	81, "Delay.c"; 	Timer_100ms = 0;
	CLRR	_Timer_100ms
	.line	82, "Delay.c"; 	Timer_1s = 0;
	CLRR	_Timer_1s
	.line	83, "Delay.c"; 	Timer_1min = 0;
	CLRR	_Timer_1min
	.line	84, "Delay.c"; 	}
	RETURN	
; exit point of _Reset_Clock

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Delay, function=_Clock
	.debuginfo subprogram _Clock
_Clock:
; 2 exit points
;;unsigned compare: left < lit(0xA=10), size=1
	.line	35, "Delay.c"; 	if (Unit_Time >= TIME_1MS)
	MOVIA	0x0a
	SUBAR	_Unit_Time,W
	BTRSS	STATUS,0
	MGOTO	_02057_DS_
	.line	37, "Delay.c"; 	Unit_Time = 0;
	CLRR	_Unit_Time
	.line	38, "Delay.c"; 	Timer_1ms++;
	INCR	_Timer_1ms,F
	.line	39, "Delay.c"; 	Charge_Cnt++;
	INCR	_Charge_Cnt,F
	.line	40, "Delay.c"; 	Key_Press_Cnt++;    //按键按下计时
	INCR	_Key_Press_Cnt,F
;;unsigned compare: left < lit(0xA=10), size=1
	.line	41, "Delay.c"; 	if (Timer_1ms  >= TIME_10MS)
	MOVIA	0x0a
	SUBAR	_Timer_1ms,W
	BTRSS	STATUS,0
	MGOTO	_02057_DS_
	.line	43, "Delay.c"; 	Sleep_Cnt++;
	INCR	_Sleep_Cnt,F
	BTRSC	STATUS,2
	INCR	(_Sleep_Cnt + 1),F
	.line	44, "Delay.c"; 	if (Key_LED_Flash_FLAG)
	BTRSC	_my_flag0,4
	.line	46, "Delay.c"; 	Key_Short_LED_Cnt++;
	INCR	_Key_Short_LED_Cnt,F
	.line	48, "Delay.c"; 	Timer_1ms = 0;
	CLRR	_Timer_1ms
	.line	49, "Delay.c"; 	Timer_10ms++;
	INCR	_Timer_10ms,F
;;unsigned compare: left < lit(0xA=10), size=1
	.line	50, "Delay.c"; 	if (Timer_10ms  >= TIME_100MS)
	MOVIA	0x0a
	SUBAR	_Timer_10ms,W
	BTRSS	STATUS,0
	MGOTO	_02057_DS_
	.line	52, "Delay.c"; 	LED_Charge_Time++;
	INCR	_LED_Charge_Time,F
	.line	53, "Delay.c"; 	LED_Off_Cnt++;
	INCR	_LED_Off_Cnt,F
	.line	54, "Delay.c"; 	Timer_10ms = 0;
	CLRR	_Timer_10ms
	.line	55, "Delay.c"; 	Timer_100ms++;
	INCR	_Timer_100ms,F
;;unsigned compare: left < lit(0xA=10), size=1
	.line	56, "Delay.c"; 	if (Timer_100ms  >= TIME_1S)
	MOVIA	0x0a
	SUBAR	_Timer_100ms,W
	BTRSS	STATUS,0
	MGOTO	_02057_DS_
	.line	58, "Delay.c"; 	Timer_100ms = 0;
	CLRR	_Timer_100ms
	.line	60, "Delay.c"; 	Timer_1s++;
	INCR	_Timer_1s,F
	.line	61, "Delay.c"; 	Full_Cnt++;
	INCR	_Full_Cnt,F
;;unsigned compare: left < lit(0x3C=60), size=1
	.line	62, "Delay.c"; 	if (Timer_1s  >= TIME_1MIN)
	MOVIA	0x3c
	SUBAR	_Timer_1s,W
	BTRSS	STATUS,0
	MGOTO	_02057_DS_
	.line	64, "Delay.c"; 	Timer_1s = 0;
	CLRR	_Timer_1s
	.line	65, "Delay.c"; 	Timer_1min++;
	INCR	_Timer_1min,F
_02057_DS_:
	.line	75, "Delay.c"; 	}
	RETURN	
; exit point of _Clock

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay_us
;   _Delay_us
;6 compiler assigned registers:
;   r0x1013
;   STK00
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;; Starting pCode block
.segment "code"; module=Delay, function=_Delay_ms
	.debuginfo subprogram _Delay_ms
;local variable name mapping:
	.debuginfo complex-type (local-sym "_ms" 2 "Delay.c" 25 (basetype 2 signed) split "r0x1014" "r0x1013")
	.debuginfo complex-type (local-sym "_i" 2 "Delay.c" 27 (basetype 2 signed) split "r0x1015" "r0x1016")
_Delay_ms:
; 2 exit points
	.line	25, "Delay.c"; 	void Delay_ms(short ms)
	MOVAR	r0x1013
	MOVR	STK00,W
	MOVAR	r0x1014
	.line	27, "Delay.c"; 	for (short i = 0; i < ms; i++)
	CLRR	r0x1015
	CLRR	r0x1016
_02027_DS_:
	MOVR	r0x1016,W
	ADDIA	0x80
	MOVAR	r0x1017
	MOVR	r0x1013,W
	ADDIA	0x80
	SUBAR	r0x1017,W
	BTRSS	STATUS,2
	MGOTO	_02040_DS_
	MOVR	r0x1014,W
	SUBAR	r0x1015,W
_02040_DS_:
	BTRSC	STATUS,0
	MGOTO	_02029_DS_
	.line	29, "Delay.c"; 	Delay_us(1000);
	MOVIA	0xe8
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_Delay_us
	.line	27, "Delay.c"; 	for (short i = 0; i < ms; i++)
	INCR	r0x1015,F
	BTRSC	STATUS,2
	INCR	r0x1016,F
	MGOTO	_02027_DS_
_02029_DS_:
	.line	31, "Delay.c"; 	}
	RETURN	
; exit point of _Delay_ms

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x100E
;   STK00
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;; Starting pCode block
.segment "code"; module=Delay, function=_Delay_us
	.debuginfo subprogram _Delay_us
;local variable name mapping:
	.debuginfo complex-type (local-sym "_us" 2 "Delay.c" 17 (basetype 2 signed) split "r0x100F" "r0x100E")
	.debuginfo complex-type (local-sym "_i" 2 "Delay.c" 19 (basetype 2 signed) split "r0x1010" "r0x1011")
_Delay_us:
; 2 exit points
	.line	17, "Delay.c"; 	void Delay_us(short us)
	MOVAR	r0x100E
	MOVR	STK00,W
	MOVAR	r0x100F
	.line	19, "Delay.c"; 	for (short i = 0; i < us; i++)
	CLRR	r0x1010
	CLRR	r0x1011
_02007_DS_:
	MOVR	r0x1011,W
	ADDIA	0x80
	MOVAR	r0x1012
	MOVR	r0x100E,W
	ADDIA	0x80
	SUBAR	r0x1012,W
	BTRSS	STATUS,2
	MGOTO	_02020_DS_
	MOVR	r0x100F,W
	SUBAR	r0x1010,W
_02020_DS_:
	BTRSC	STATUS,0
	MGOTO	_02009_DS_
	.line	21, "Delay.c"; 	CLRWDT();
	clrwdt
	.line	19, "Delay.c"; 	for (short i = 0; i < us; i++)
	INCR	r0x1010,F
	BTRSC	STATUS,2
	INCR	r0x1011,F
	MGOTO	_02007_DS_
_02009_DS_:
	.line	23, "Delay.c"; 	}
	RETURN	
; exit point of _Delay_us


;	code size estimation:
;	   95+    0 =    95 instructions (  190 byte)

	end
