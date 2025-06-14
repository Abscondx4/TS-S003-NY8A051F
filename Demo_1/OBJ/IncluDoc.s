;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"IncluDoc.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
	extern	_INTF
	extern	_INTE
	extern	_BPHCON
	extern	_BPLCON
	extern	_BWUCON
	extern	_PCON
	extern	_PORTB
	extern	_Timer_1min
	extern	_Timer_1s
	extern	_Timer_100ms
	extern	_Timer_10ms
	extern	_Timer_1ms
	extern	_Unit_Time
	extern	_LED_FLAG
	extern	_Time_Temp
	extern	_Charge_Cnt
	extern	_LED_Off_Cnt
	extern	_LED_Charge_Time
	extern	_Full_Cnt
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
	extern	_my_flag1
	extern	_my_flag0
	extern	_My_Flag
	extern	_Init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_My_Flag:
	.res 1
	.debuginfo complex-type (symbol "_My_Flag" 1 global "IncluDoc.c" 3 (struct "flag_t" (member "_all8bit" 0 "IncluDoc.h" 9 (basetype 1 unsigned)) (member "_FG0" 0 "IncluDoc.h" 12 (bit 0 1)) (member "_FG1" 0 "IncluDoc.h" 13 (bit 1 1)) (member "_FG2" 0 "IncluDoc.h" 14 (bit 2 1)) (member "_FG3" 0 "IncluDoc.h" 15 (bit 3 1)) (member "_FG4" 0 "IncluDoc.h" 16 (bit 4 1)) (member "_FG5" 0 "IncluDoc.h" 17 (bit 5 1)) (member "_FG6" 0 "IncluDoc.h" 18 (bit 6 1)) (member "_FG7" 0 "IncluDoc.h" 19 (bit 7 1))))

.segment "uninit"
_Key_Short_LED_Cnt:
	.res 1
	.debuginfo complex-type (symbol "_Key_Short_LED_Cnt" 1 global "IncluDoc.c" 37 (basetype 1 unsigned))

.segment "uninit"
_Unit_Time:
	.res 1
	.debuginfo complex-type (symbol "_Unit_Time" 1 global "IncluDoc.c" 50 (basetype 1 unsigned))

.segment "uninit"
_Timer_1ms:
	.res 1
	.debuginfo complex-type (symbol "_Timer_1ms" 1 global "IncluDoc.c" 51 (basetype 1 unsigned))

.segment "uninit"
_Timer_10ms:
	.res 1
	.debuginfo complex-type (symbol "_Timer_10ms" 1 global "IncluDoc.c" 52 (basetype 1 unsigned))

.segment "uninit"
_Timer_100ms:
	.res 1
	.debuginfo complex-type (symbol "_Timer_100ms" 1 global "IncluDoc.c" 53 (basetype 1 unsigned))

.segment "uninit"
_Timer_1s:
	.res 1
	.debuginfo complex-type (symbol "_Timer_1s" 1 global "IncluDoc.c" 54 (basetype 1 unsigned))

.segment "uninit"
_Timer_1min:
	.res 1
	.debuginfo complex-type (symbol "_Timer_1min" 1 global "IncluDoc.c" 55 (basetype 1 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_my_flag0:
	.debuginfo complex-type (symbol "_my_flag0" 1 global "IncluDoc.c" 5 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_my_flag1:
	.debuginfo complex-type (symbol "_my_flag1" 1 global "IncluDoc.c" 6 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_my_flag2:
	.debuginfo complex-type (symbol "_my_flag2" 1 global "IncluDoc.c" 7 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_my_flag3:
	.debuginfo complex-type (symbol "_my_flag3" 1 global "IncluDoc.c" 8 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_my_flag4:
	.debuginfo complex-type (symbol "_my_flag4" 1 global "IncluDoc.c" 9 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_M1_Cycle:
	.debuginfo complex-type (symbol "_M1_Cycle" 2 global "IncluDoc.c" 11 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_Cycle_Set:
	.debuginfo complex-type (symbol "_M1_Cycle_Set" 2 global "IncluDoc.c" 12 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_Cycle_1_Set:
	.debuginfo complex-type (symbol "_M1_Cycle_1_Set" 2 global "IncluDoc.c" 13 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_Duty:
	.debuginfo complex-type (symbol "_M1_Duty" 2 global "IncluDoc.c" 15 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_Duty_Set:
	.debuginfo complex-type (symbol "_M1_Duty_Set" 2 global "IncluDoc.c" 16 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_Duty_1_Set:
	.debuginfo complex-type (symbol "_M1_Duty_1_Set" 2 global "IncluDoc.c" 17 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Motor_Freq_Change:
	.debuginfo complex-type (symbol "_Motor_Freq_Change" 1 global "IncluDoc.c" 19 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Motor_Freq_Cnt0:
	.debuginfo complex-type (symbol "_Motor_Freq_Cnt0" 1 global "IncluDoc.c" 20 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Motor_Freq_Cnt1:
	.debuginfo complex-type (symbol "_Motor_Freq_Cnt1" 2 global "IncluDoc.c" 21 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Motor_Freq_Cnt2:
	.debuginfo complex-type (symbol "_Motor_Freq_Cnt2" 1 global "IncluDoc.c" 22 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_M1_Freq_Change:
	.debuginfo complex-type (symbol "_M1_Freq_Change" 1 global "IncluDoc.c" 24 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_M1_Freq_Change_Set:
	.debuginfo complex-type (symbol "_M1_Freq_Change_Set" 1 global "IncluDoc.c" 25 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_M1_Cnt:
	.debuginfo complex-type (symbol "_M1_Cnt" 2 global "IncluDoc.c" 27 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Motor_Peri_1:
	.debuginfo complex-type (symbol "_Motor_Peri_1" 2 global "IncluDoc.c" 29 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Motor_Peri_10:
	.debuginfo complex-type (symbol "_Motor_Peri_10" 2 global "IncluDoc.c" 30 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Motor_Peri_100:
	.debuginfo complex-type (symbol "_Motor_Peri_100" 2 global "IncluDoc.c" 31 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Motor_Peri_1000:
	.debuginfo complex-type (symbol "_Motor_Peri_1000" 2 global "IncluDoc.c" 32 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Motor_Counter_FLAG:
	.debuginfo complex-type (symbol "_Motor_Counter_FLAG" 2 global "IncluDoc.c" 33 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Key_Press_Cnt:
	.debuginfo complex-type (symbol "_Key_Press_Cnt" 1 global "IncluDoc.c" 35 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Key_Long_Cnt:
	.debuginfo complex-type (symbol "_Key_Long_Cnt" 1 global "IncluDoc.c" 36 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Sleep_Cnt:
	.debuginfo complex-type (symbol "_Sleep_Cnt" 2 global "IncluDoc.c" 39 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Full_Cnt:
	.debuginfo complex-type (symbol "_Full_Cnt" 1 global "IncluDoc.c" 41 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_LED_Charge_Time:
	.debuginfo complex-type (symbol "_LED_Charge_Time" 1 global "IncluDoc.c" 43 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_LED_Off_Cnt:
	.debuginfo complex-type (symbol "_LED_Off_Cnt" 1 global "IncluDoc.c" 44 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Charge_Cnt:
	.debuginfo complex-type (symbol "_Charge_Cnt" 1 global "IncluDoc.c" 45 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Time_Temp:
	.debuginfo complex-type (symbol "_Time_Temp" 1 global "IncluDoc.c" 47 (basetype 1 unsigned))

	dw	0x01	; 1


.segment "idata"
_LED_FLAG:
	.debuginfo complex-type (symbol "_LED_FLAG" 1 global "IncluDoc.c" 48 (basetype 1 unsigned))

	dw	0x00	; 0

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
; code_IncluDoc	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=IncluDoc, function=_Init
	.debuginfo subprogram _Init
_Init:
; 2 exit points
	.line	61, "IncluDoc.c"; 	PCON = C_WDT_En|C_LVR_En ;
	MOVIA	0x88
	MOVAR	_PCON
	.line	64, "IncluDoc.c"; 	IOSTB=C_PB0_Input | C_PB1_Output | C_PB2_Output | C_PB3_Input; 
	MOVIA	0x09
	IOST	_IOSTB
	.line	65, "IncluDoc.c"; 	PORTB = 0x02;   
	MOVIA	0x02
	MOVAR	_PORTB
	.line	66, "IncluDoc.c"; 	BPHCON = 0xf1;
	MOVIA	0xf1
	MOVAR	_BPHCON
	.line	69, "IncluDoc.c"; 	PCON1=C_TMR0_En;         //启动定时器0；
	MOVIA	0x01
	IOST	_PCON1
	.line	70, "IncluDoc.c"; 	TMR0=0x38;               //设置为216
	MOVIA	0x38
	MOVAR	_TMR0
	.line	71, "IncluDoc.c"; 	T0MD=C_PS0_TMR0 | C_PS0_Div2;         //分频器给TMR0
	CLRA	
	T0MD	
	.line	75, "IncluDoc.c"; 	BWUCON =C_PB0_Wakeup | C_PB3_Wakeup;
	MOVIA	0x09
	MOVAR	_BWUCON
	.line	79, "IncluDoc.c"; 	T0IE = 1;
	BSR	_INTE,0
	.line	82, "IncluDoc.c"; 	INTF = 0;
	CLRR	_INTF
	.line	83, "IncluDoc.c"; 	ENI();
	ENI
	.line	85, "IncluDoc.c"; 	}
	RETURN	
; exit point of _Init


;	code size estimation:
;	   19+    0 =    19 instructions (   38 byte)

	end
