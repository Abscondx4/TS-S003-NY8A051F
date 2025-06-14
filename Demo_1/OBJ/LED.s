;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"LED.c"
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
	extern	_Change_LED_State
	extern	_LED

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
r0x1002:
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
; code_LED	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=LED, function=_LED
	.debuginfo subprogram _LED
_LED:
; 2 exit points
	.line	26, "LED.c"; 	if (!Power_OnOff_FLAG && !Charging_FLAG)
	BTRSC	_my_flag0,0
	MGOTO	_02029_DS_
	BTRSC	_my_flag1,5
	MGOTO	_02029_DS_
	.line	28, "LED.c"; 	LED_OFF;
	BSR	_PORTB,1
	MGOTO	_02032_DS_
_02029_DS_:
	.line	31, "LED.c"; 	else if (Charge_LED_Breathing_FLAG && !Charge_Full_LED_Light_FLAG)
	BTRSS	_my_flag1,6
	MGOTO	_02025_DS_
	BTRSC	_my_flag1,7
	MGOTO	_02025_DS_
;;unsigned compare: left < lit(0x5=5), size=1
	.line	33, "LED.c"; 	if (LED_Charge_Time >= LED_Change_Flash_Time)
	MOVIA	0x05
	SUBAR	_LED_Charge_Time,W
	BTRSS	STATUS,0
	MGOTO	_02032_DS_
	.line	35, "LED.c"; 	LED_Charge_Time = 0;
	CLRR	_LED_Charge_Time
	.line	36, "LED.c"; 	LED1 =~  LED1;
	MOVR	_PORTB,W
	XORIA	0x02
	MOVAR	_PORTB
	MGOTO	_02032_DS_
_02025_DS_:
	.line	40, "LED.c"; 	else if (Charge_LED_Breathing_FLAG && Charge_Full_LED_Light_FLAG)
	BTRSS	_my_flag1,6
	MGOTO	_02021_DS_
	BTRSS	_my_flag1,7
	MGOTO	_02021_DS_
	.line	42, "LED.c"; 	LED_ON;
	BCR	_PORTB,1
	MGOTO	_02032_DS_
_02021_DS_:
	.line	45, "LED.c"; 	else if (Key_LED_Flash_FLAG)
	BTRSS	_my_flag0,4
	MGOTO	_02018_DS_
	.line	47, "LED.c"; 	LED_OFF;
	BSR	_PORTB,1
;;unsigned compare: left < lit(0x14=20), size=1
	.line	48, "LED.c"; 	if (Key_Short_LED_Cnt >= Key_Short_LED_Time)
	MOVIA	0x14
	SUBAR	_Key_Short_LED_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02032_DS_
	.line	50, "LED.c"; 	Key_Short_LED_Cnt = 0;
	CLRR	_Key_Short_LED_Cnt
	.line	51, "LED.c"; 	LED_ON;
	BCR	_PORTB,1
	.line	52, "LED.c"; 	Key_LED_Flash_FLAG = 0;
	BCR	_my_flag0,4
	MGOTO	_02032_DS_
_02018_DS_:
	.line	57, "LED.c"; 	LED_ON;
	BCR	_PORTB,1
_02032_DS_:
	.line	59, "LED.c"; 	}
	RETURN	
; exit point of _LED

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1002
;; Starting pCode block
.segment "code"; module=LED, function=_Change_LED_State
	.debuginfo subprogram _Change_LED_State
;local variable name mapping:
	.debuginfo complex-type (local-sym "_state" 1 "LED.c" 9 (basetype 1 unsigned) split "r0x1002")
_Change_LED_State:
; 2 exit points
	.line	9, "LED.c"; 	void Change_LED_State(unsigned char state)
	MOVAR	r0x1002
	.line	12, "LED.c"; 	if(state)
	MOVR	r0x1002,W
	BTRSC	STATUS,2
	MGOTO	_02006_DS_
	.line	15, "LED.c"; 	PORTB |= (1 << 1);
	BSR	_PORTB,1
	MGOTO	_02008_DS_
_02006_DS_:
	.line	20, "LED.c"; 	PORTB &= ~(1 << 1);
	BCR	_PORTB,1
_02008_DS_:
	.line	22, "LED.c"; 	}
	RETURN	
; exit point of _Change_LED_State


;	code size estimation:
;	   46+    0 =    46 instructions (   92 byte)

	end
