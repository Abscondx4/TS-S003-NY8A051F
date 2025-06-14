;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Motor.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Motor_Counter_Reset
	extern	_Motor_Counter
	extern	_Motor_Init
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
	extern	_M1_Work_Process
	extern	_Motor_PWM_Loop1
	extern	_Motor_PWM_Loop2
	extern	_Motor_PWM_Loop3
	extern	_M1_Work

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
r0x1013:
	.res	1
.segment "uninit"
r0x1012:
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
; code_Motor	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop3
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop3
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop3
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop3
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop3
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop3
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop3
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop3
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=Motor, function=_M1_Work
	.debuginfo subprogram _M1_Work
_M1_Work:
; 2 exit points
	.line	116, "Motor.c"; 	if (M1_PWM_Write_FLAG)
	BTRSS	_my_flag1,3
	MGOTO	_02088_DS_
	.line	118, "Motor.c"; 	if (!(M1_Freq_Change_Set == M1_Freq_Change))
	MOVR	_M1_Freq_Change,W
	XORAR	_M1_Freq_Change_Set,W
	BTRSC	STATUS,2
	MGOTO	_02042_DS_
	.line	120, "Motor.c"; 	M1_Freq_Change = M1_Freq_Change_Set;
	MOVR	_M1_Freq_Change_Set,W
	MOVAR	_M1_Freq_Change
	.line	121, "Motor.c"; 	Motor_Freq_Cnt0 = 0;
	CLRR	_Motor_Freq_Cnt0
	.line	122, "Motor.c"; 	Motor_Freq_Cnt1 = 0;
	CLRR	_Motor_Freq_Cnt1
	CLRR	(_Motor_Freq_Cnt1 + 1)
	.line	123, "Motor.c"; 	Motor_Freq_Cnt2 = 0;
	CLRR	_Motor_Freq_Cnt2
	.line	124, "Motor.c"; 	M1_Cnt = 0;
	CLRR	_M1_Cnt
	CLRR	(_M1_Cnt + 1)
	.line	125, "Motor.c"; 	M1_Cycle = 1;
	MOVIA	0x01
	MOVAR	_M1_Cycle
	CLRR	(_M1_Cycle + 1)
_02042_DS_:
	.line	128, "Motor.c"; 	M1_PWM_Write_FLAG = 0;
	BCR	_my_flag1,3
	.line	129, "Motor.c"; 	M1_Work_FLAG = 0;
	BCR	_my_flag1,2
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0xB=11), size=1
	.line	131, "Motor.c"; 	switch (M1_Freq_Change)
	MOVIA	0x0b
	SUBAR	_M1_Freq_Change,W
	BTRSC	STATUS,0
	MGOTO	_02043_DS_
	MOVIA	((_02162_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_M1_Freq_Change,W
	ADDIA	_02162_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_02162_DS_:
	MGOTO	_02043_DS_
	MGOTO	_02044_DS_
	MGOTO	_02045_DS_
	MGOTO	_02046_DS_
	MGOTO	_02047_DS_
	MGOTO	_02048_DS_
	MGOTO	_02054_DS_
	MGOTO	_02063_DS_
	MGOTO	_02072_DS_
	MGOTO	_02073_DS_
	MGOTO	_02074_DS_
_02043_DS_:
	.line	135, "Motor.c"; 	M1_Freq_Change = 1;
	MOVIA	0x01
	MOVAR	_M1_Freq_Change
	.line	136, "Motor.c"; 	break;
	MGOTO	_02083_DS_
_02044_DS_:
	.line	140, "Motor.c"; 	M1_Cycle_Set = 94;
	MOVIA	0x5e
	MOVAR	_M1_Cycle_Set
	CLRR	(_M1_Cycle_Set + 1)
	.line	141, "Motor.c"; 	M1_Duty_Set = 42;
	MOVIA	0x2a
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	142, "Motor.c"; 	break;
	MGOTO	_02083_DS_
_02045_DS_:
	.line	146, "Motor.c"; 	M1_Cycle_Set = 94;
	MOVIA	0x5e
	MOVAR	_M1_Cycle_Set
	CLRR	(_M1_Cycle_Set + 1)
	.line	147, "Motor.c"; 	M1_Duty_Set = 64;
	MOVIA	0x40
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	148, "Motor.c"; 	break;
	MGOTO	_02083_DS_
_02046_DS_:
	.line	152, "Motor.c"; 	M1_Cycle_Set = 100;
	MOVIA	0x64
	MOVAR	_M1_Cycle_Set
	CLRR	(_M1_Cycle_Set + 1)
	.line	153, "Motor.c"; 	M1_Duty_Set = 100;
	MOVIA	0x64
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	154, "Motor.c"; 	break;
	MGOTO	_02083_DS_
_02047_DS_:
	.line	158, "Motor.c"; 	M1_Cycle_Set = 3478;
	MOVIA	0x96
	MOVAR	_M1_Cycle_Set
	MOVIA	0x0d
	MOVAR	(_M1_Cycle_Set + 1)
	.line	159, "Motor.c"; 	M1_Duty_Set = 2817;
	MOVIA	0x01
	MOVAR	_M1_Duty_Set
	MOVIA	0x0b
	MOVAR	(_M1_Duty_Set + 1)
	.line	160, "Motor.c"; 	break;
	MGOTO	_02083_DS_
_02048_DS_:
	.line	164, "Motor.c"; 	if (!Motor_Freq_Cnt0)
	MOVR	_Motor_Freq_Cnt0,W
	BTRSS	STATUS,2
	MGOTO	_02052_DS_
	.line	166, "Motor.c"; 	M1_Cycle_Set = 1974;
	MOVIA	0xb6
	MOVAR	_M1_Cycle_Set
	MOVIA	0x07
	MOVAR	(_M1_Cycle_Set + 1)
	.line	167, "Motor.c"; 	M1_Duty_Set = 1026;
	MOVIA	0x02
	MOVAR	_M1_Duty_Set
	MOVIA	0x04
	MOVAR	(_M1_Duty_Set + 1)
	.line	168, "Motor.c"; 	Motor_PWM_Loop2(16);
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop2
	MGOTO	_02083_DS_
_02052_DS_:
	.line	170, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 1)
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02083_DS_
	.line	172, "Motor.c"; 	M1_Cycle_Set = 94;
	MOVIA	0x5e
	MOVAR	_M1_Cycle_Set
	CLRR	(_M1_Cycle_Set + 1)
	.line	173, "Motor.c"; 	M1_Duty_Set = 51;
	MOVIA	0x33
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	174, "Motor.c"; 	Motor_PWM_Loop3(1600);
	MOVIA	0x40
	MOVAR	STK00
	MOVIA	0x06
	MCALL	_Motor_PWM_Loop3
	.line	176, "Motor.c"; 	break;
	MGOTO	_02083_DS_
_02054_DS_:
	.line	180, "Motor.c"; 	if (!Motor_Freq_Cnt0)
	MOVR	_Motor_Freq_Cnt0,W
	BTRSS	STATUS,2
	MGOTO	_02061_DS_
	.line	182, "Motor.c"; 	M1_Cycle_Set = 1599;
	MOVIA	0x3f
	MOVAR	_M1_Cycle_Set
	MOVIA	0x06
	MOVAR	(_M1_Cycle_Set + 1)
	.line	183, "Motor.c"; 	M1_Duty_Set = 847;
	MOVIA	0x4f
	MOVAR	_M1_Duty_Set
	MOVIA	0x03
	MOVAR	(_M1_Duty_Set + 1)
	.line	184, "Motor.c"; 	Motor_PWM_Loop1(20);
	MOVIA	0x14
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop1
	MGOTO	_02083_DS_
_02061_DS_:
	.line	186, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 1)
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02058_DS_
	.line	188, "Motor.c"; 	M1_Cycle_Set = 9588;
	MOVIA	0x74
	MOVAR	_M1_Cycle_Set
	MOVIA	0x25
	MOVAR	(_M1_Cycle_Set + 1)
	.line	189, "Motor.c"; 	M1_Duty_Set = 4794;
	MOVIA	0xba
	MOVAR	_M1_Duty_Set
	MOVIA	0x12
	MOVAR	(_M1_Duty_Set + 1)
	.line	190, "Motor.c"; 	Motor_PWM_Loop2(6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop2
	MGOTO	_02083_DS_
_02058_DS_:
	.line	192, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 2)
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02083_DS_
	.line	194, "Motor.c"; 	M1_Cycle_Set = 7616;
	MOVIA	0xc0
	MOVAR	_M1_Cycle_Set
	MOVIA	0x1d
	MOVAR	(_M1_Cycle_Set + 1)
	.line	195, "Motor.c"; 	M1_Duty_Set = 2818;
	MOVIA	0x02
	MOVAR	_M1_Duty_Set
	MOVIA	0x0b
	MOVAR	(_M1_Duty_Set + 1)
	.line	196, "Motor.c"; 	Motor_PWM_Loop3(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop3
	.line	198, "Motor.c"; 	break;
	MGOTO	_02083_DS_
_02063_DS_:
	.line	202, "Motor.c"; 	if (!Motor_Freq_Cnt0)
	MOVR	_Motor_Freq_Cnt0,W
	BTRSS	STATUS,2
	MGOTO	_02070_DS_
	.line	204, "Motor.c"; 	M1_Cycle_Set = 1128;
	MOVIA	0x68
	MOVAR	_M1_Cycle_Set
	MOVIA	0x04
	MOVAR	(_M1_Cycle_Set + 1)
	.line	205, "Motor.c"; 	M1_Duty_Set = 564;
	MOVIA	0x34
	MOVAR	_M1_Duty_Set
	MOVIA	0x02
	MOVAR	(_M1_Duty_Set + 1)
	.line	206, "Motor.c"; 	Motor_PWM_Loop1(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop1
	MGOTO	_02083_DS_
_02070_DS_:
	.line	208, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 1)
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02067_DS_
	.line	210, "Motor.c"; 	M1_Cycle_Set = 3198;
	MOVIA	0x7e
	MOVAR	_M1_Cycle_Set
	MOVIA	0x0c
	MOVAR	(_M1_Cycle_Set + 1)
	.line	211, "Motor.c"; 	M1_Duty_Set = 1119;
	MOVIA	0x5f
	MOVAR	_M1_Duty_Set
	MOVIA	0x04
	MOVAR	(_M1_Duty_Set + 1)
	.line	212, "Motor.c"; 	Motor_PWM_Loop2(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop2
	MGOTO	_02083_DS_
_02067_DS_:
	.line	214, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 2)
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02083_DS_
	.line	216, "Motor.c"; 	M1_Cycle_Set = 6293;
	MOVIA	0x95
	MOVAR	_M1_Cycle_Set
	MOVIA	0x18
	MOVAR	(_M1_Cycle_Set + 1)
	.line	217, "Motor.c"; 	M1_Duty_Set = 5160;
	MOVIA	0x28
	MOVAR	_M1_Duty_Set
	MOVIA	0x14
	MOVAR	(_M1_Duty_Set + 1)
	.line	218, "Motor.c"; 	Motor_PWM_Loop3(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop3
	.line	220, "Motor.c"; 	break;
	MGOTO	_02083_DS_
_02072_DS_:
	.line	224, "Motor.c"; 	M1_Cycle_Set = 8368;
	MOVIA	0xb0
	MOVAR	_M1_Cycle_Set
	MOVIA	0x20
	MOVAR	(_M1_Cycle_Set + 1)
	.line	225, "Motor.c"; 	M1_Duty_Set = 5607;
	MOVIA	0xe7
	MOVAR	_M1_Duty_Set
	MOVIA	0x15
	MOVAR	(_M1_Duty_Set + 1)
	.line	226, "Motor.c"; 	break;
	MGOTO	_02083_DS_
_02073_DS_:
	.line	230, "Motor.c"; 	M1_Cycle_Set = 2913;
	MOVIA	0x61
	MOVAR	_M1_Cycle_Set
	MOVIA	0x0b
	MOVAR	(_M1_Cycle_Set + 1)
	.line	231, "Motor.c"; 	M1_Duty_Set = 1398;
	MOVIA	0x76
	MOVAR	_M1_Duty_Set
	MOVIA	0x05
	MOVAR	(_M1_Duty_Set + 1)
	.line	232, "Motor.c"; 	break;
	MGOTO	_02083_DS_
_02074_DS_:
	.line	236, "Motor.c"; 	if (!Motor_Freq_Cnt0)
	MOVR	_Motor_Freq_Cnt0,W
	BTRSS	STATUS,2
	MGOTO	_02081_DS_
	.line	238, "Motor.c"; 	M1_Cycle_Set = 1973;
	MOVIA	0xb5
	MOVAR	_M1_Cycle_Set
	MOVIA	0x07
	MOVAR	(_M1_Cycle_Set + 1)
	.line	239, "Motor.c"; 	M1_Duty_Set = 943;
	MOVIA	0xaf
	MOVAR	_M1_Duty_Set
	MOVIA	0x03
	MOVAR	(_M1_Duty_Set + 1)
	.line	240, "Motor.c"; 	Motor_PWM_Loop1(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop1
	MGOTO	_02083_DS_
_02081_DS_:
	.line	242, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 1)
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02078_DS_
	.line	244, "Motor.c"; 	M1_Cycle_Set = 9311;
	MOVIA	0x5f
	MOVAR	_M1_Cycle_Set
	MOVIA	0x24
	MOVAR	(_M1_Cycle_Set + 1)
	.line	245, "Motor.c"; 	M1_Duty_Set = 4656;
	MOVIA	0x30
	MOVAR	_M1_Duty_Set
	MOVIA	0x12
	MOVAR	(_M1_Duty_Set + 1)
	.line	246, "Motor.c"; 	Motor_PWM_Loop2(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop2
	MGOTO	_02083_DS_
_02078_DS_:
	.line	248, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 2)
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02083_DS_
	.line	250, "Motor.c"; 	M1_Cycle_Set = 5640;
	MOVIA	0x08
	MOVAR	_M1_Cycle_Set
	MOVIA	0x16
	MOVAR	(_M1_Cycle_Set + 1)
	.line	251, "Motor.c"; 	M1_Duty_Set = 2820;
	MOVIA	0x04
	MOVAR	_M1_Duty_Set
	MOVIA	0x0b
	MOVAR	(_M1_Duty_Set + 1)
	.line	252, "Motor.c"; 	Motor_PWM_Loop3(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop3
;;unsigned compare: left < lit(0x1=1), size=1
_02083_DS_:
	.line	258, "Motor.c"; 	if (M1_Freq_Change >= 1 && M1_Freq_Change <= 10)
	MOVIA	0x01
	SUBAR	_M1_Freq_Change,W
	BTRSS	STATUS,0
	MGOTO	_02088_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_M1_Freq_Change,W
	BTRSS	STATUS,0
	.line	260, "Motor.c"; 	M1_Work_FLAG =1;
	BSR	_my_flag1,2
_02088_DS_:
	.line	264, "Motor.c"; 	if (Power_OnOff_FLAG)
	BTRSS	_my_flag0,0
	MGOTO	_02091_DS_
	.line	266, "Motor.c"; 	Sleep_Cnt = 0;
	CLRR	_Sleep_Cnt
	CLRR	(_Sleep_Cnt + 1)
_02091_DS_:
	.line	268, "Motor.c"; 	}
	RETURN	
; exit point of _M1_Work

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1012
;   STK00
;   r0x1013
;; Starting pCode block
.segment "code"; module=Motor, function=_Motor_PWM_Loop3
	.debuginfo subprogram _Motor_PWM_Loop3
;local variable name mapping:
	.debuginfo complex-type (local-sym "_x" 2 "Motor.c" 99 (basetype 2 signed) split "r0x1013" "r0x1012")
_Motor_PWM_Loop3:
; 2 exit points
	.line	99, "Motor.c"; 	void Motor_PWM_Loop3(short x)
	MOVAR	r0x1012
	MOVR	STK00,W
	MOVAR	r0x1013
	.line	101, "Motor.c"; 	Motor_Freq_Cnt1++;
	INCR	_Motor_Freq_Cnt1,F
	BTRSC	STATUS,2
	INCR	(_Motor_Freq_Cnt1 + 1),F
	.line	104, "Motor.c"; 	if (Motor_Freq_Cnt1 == x)
	MOVR	r0x1013,W
	XORAR	_Motor_Freq_Cnt1,W
	BTRSS	STATUS,2
	MGOTO	_02036_DS_
	MOVR	r0x1012,W
	XORAR	(_Motor_Freq_Cnt1 + 1),W
	BTRSS	STATUS,2
	MGOTO	_02036_DS_
	.line	107, "Motor.c"; 	Motor_Freq_Cnt1 = 0;
	CLRR	_Motor_Freq_Cnt1
	CLRR	(_Motor_Freq_Cnt1 + 1)
	.line	110, "Motor.c"; 	Motor_Freq_Cnt0 = 0;
	CLRR	_Motor_Freq_Cnt0
_02036_DS_:
	.line	112, "Motor.c"; 	}
	RETURN	
; exit point of _Motor_PWM_Loop3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1012
;   STK00
;   r0x1013
;; Starting pCode block
.segment "code"; module=Motor, function=_Motor_PWM_Loop2
	.debuginfo subprogram _Motor_PWM_Loop2
;local variable name mapping:
	.debuginfo complex-type (local-sym "_x" 2 "Motor.c" 83 (basetype 2 signed) split "r0x1013" "r0x1012")
_Motor_PWM_Loop2:
; 2 exit points
	.line	83, "Motor.c"; 	void Motor_PWM_Loop2(short x)
	MOVAR	r0x1012
	MOVR	STK00,W
	MOVAR	r0x1013
	.line	86, "Motor.c"; 	Motor_Freq_Cnt1++;
	INCR	_Motor_Freq_Cnt1,F
	BTRSC	STATUS,2
	INCR	(_Motor_Freq_Cnt1 + 1),F
	.line	89, "Motor.c"; 	if (Motor_Freq_Cnt1 == x)
	MOVR	r0x1013,W
	XORAR	_Motor_Freq_Cnt1,W
	BTRSS	STATUS,2
	MGOTO	_02029_DS_
	MOVR	r0x1012,W
	XORAR	(_Motor_Freq_Cnt1 + 1),W
	BTRSS	STATUS,2
	MGOTO	_02029_DS_
	.line	92, "Motor.c"; 	Motor_Freq_Cnt1 = 0;
	CLRR	_Motor_Freq_Cnt1
	CLRR	(_Motor_Freq_Cnt1 + 1)
	.line	95, "Motor.c"; 	Motor_Freq_Cnt0 ++;
	INCR	_Motor_Freq_Cnt0,F
_02029_DS_:
	.line	97, "Motor.c"; 	}
	RETURN	
; exit point of _Motor_PWM_Loop2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1012
;   STK00
;   r0x1013
;; Starting pCode block
.segment "code"; module=Motor, function=_Motor_PWM_Loop1
	.debuginfo subprogram _Motor_PWM_Loop1
;local variable name mapping:
	.debuginfo complex-type (local-sym "_x" 2 "Motor.c" 59 (basetype 2 signed) split "r0x1013" "r0x1012")
_Motor_PWM_Loop1:
; 2 exit points
	.line	59, "Motor.c"; 	void Motor_PWM_Loop1(short x)
	MOVAR	r0x1012
	MOVR	STK00,W
	MOVAR	r0x1013
	.line	62, "Motor.c"; 	Motor_Freq_Cnt1++;
	INCR	_Motor_Freq_Cnt1,F
	BTRSC	STATUS,2
	INCR	(_Motor_Freq_Cnt1 + 1),F
	.line	65, "Motor.c"; 	if (Motor_Freq_Cnt1 == x)
	MOVR	r0x1013,W
	XORAR	_Motor_Freq_Cnt1,W
	BTRSS	STATUS,2
	MGOTO	_02022_DS_
	MOVR	r0x1012,W
	XORAR	(_Motor_Freq_Cnt1 + 1),W
	BTRSS	STATUS,2
	MGOTO	_02022_DS_
	.line	68, "Motor.c"; 	Motor_Freq_Cnt1 = 0;
	CLRR	_Motor_Freq_Cnt1
	CLRR	(_Motor_Freq_Cnt1 + 1)
	.line	71, "Motor.c"; 	Motor_Freq_Cnt0 ++;
	INCR	_Motor_Freq_Cnt0,F
_02022_DS_:
	.line	73, "Motor.c"; 	}
	RETURN	
; exit point of _Motor_PWM_Loop1

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=Motor, function=_M1_Work_Process
	.debuginfo subprogram _M1_Work_Process
_M1_Work_Process:
; 0 exit points
	.line	12, "Motor.c"; 	if (M1_Work_FLAG)
	BTRSS	_my_flag1,2
	MGOTO	_02015_DS_
	.line	15, "Motor.c"; 	M1_Cnt++;
	INCR	_M1_Cnt,F
	BTRSC	STATUS,2
	INCR	(_M1_Cnt + 1),F
	.line	17, "Motor.c"; 	if (M1_Cnt == M1_Cycle)
	MOVR	_M1_Cycle,W
	XORAR	_M1_Cnt,W
	BTRSS	STATUS,2
	MGOTO	_02011_DS_
	MOVR	(_M1_Cycle + 1),W
	XORAR	(_M1_Cnt + 1),W
	BTRSS	STATUS,2
	MGOTO	_02011_DS_
	.line	20, "Motor.c"; 	M1_Cnt = 0;
	CLRR	_M1_Cnt
	CLRR	(_M1_Cnt + 1)
	.line	22, "Motor.c"; 	if (M1_Duty)
	MOVR	(_M1_Duty + 1),W
	IORAR	_M1_Duty,W
	BTRSC	STATUS,2
	MGOTO	_02006_DS_
	.line	25, "Motor.c"; 	M1_ON;
	BSR	_PORTB,2
	MGOTO	_02007_DS_
_02006_DS_:
	.line	30, "Motor.c"; 	M1_OFF;
	BCR	_PORTB,2
_02007_DS_:
	.line	33, "Motor.c"; 	M1_Cycle = M1_Cycle_Set;
	MOVR	_M1_Cycle_Set,W
	MOVAR	_M1_Cycle
	MOVR	(_M1_Cycle_Set + 1),W
	MOVAR	(_M1_Cycle + 1)
	.line	34, "Motor.c"; 	M1_Duty = M1_Duty_Set;
	MOVR	_M1_Duty_Set,W
	MOVAR	_M1_Duty
	MOVR	(_M1_Duty_Set + 1),W
	MOVAR	(_M1_Duty + 1)
	.line	36, "Motor.c"; 	M1_PWM_Write_FLAG = 1;
	BSR	_my_flag1,3
	MGOTO	_02015_DS_
_02011_DS_:
	.line	39, "Motor.c"; 	else if (M1_Cnt == M1_Duty)
	MOVR	_M1_Duty,W
	XORAR	_M1_Cnt,W
	BTRSS	STATUS,2
	MGOTO	_02015_DS_
	MOVR	(_M1_Duty + 1),W
	XORAR	(_M1_Cnt + 1),W
	BTRSC	STATUS,2
	.line	42, "Motor.c"; 	M1_OFF;
	BCR	_PORTB,2
_02015_DS_:
	.line	45, "Motor.c"; 	}
	RETURN	


;	code size estimation:
;	  380+    0 =   380 instructions (  760 byte)

	end
