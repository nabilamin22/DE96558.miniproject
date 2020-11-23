

;======================================================================
;PROGRAM TEMPLATE
;======================================================================

#include<p18F4550.inc>

loop_cnt1	set	0x00
loop_cnt2	set	0x01

			org 0x00
			goto start
			org 0x08
			retfie
			org 0x18
			retfie

;======================================================================
;DELAY (10 milliseconds)
;======================================================================

dup_nop		macro	nabil
			variable i 
i = 0
			while i < nabil 
			nop
i += 1
			endw 
			endm


D10MS			MOVLW	D'20'
				MOVWF	loop_cnt2, A
AGAIN1			MOVLW	D'250'
				MOVWF	loop_cnt1, A
AGAIN2			dup_nop	D'17'
				DECFSZ	loop_cnt1, F,  A
				BRA		AGAIN2
				DECFSZ	loop_cnt2, F, A
				BRA		AGAIN1
		
				NOP
				RETURN

;======================================================================	
;INPUT AND OUTPUT
;======================================================================

COMMAND1		BCF		PORTC, 4, A
				BCF		PORTC, 5, A
				BSF		PORTC, 6, A
				CALL	D10MS
				BCF		PORTC, 6, A	
				RETURN

DATA1			BSF		PORTC, 4, A
				BCF		PORTC, 5, A
				BSF		PORTC, 6, A
				CALL	D10MS
				BCF		PORTC, 6, A	
				RETURN

;=======================================================================
;DISPLAY NAME
;=======================================================================			
		
nabilicious		MOVLW	D'77'				; DISPLAY M
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'85'				; DISPLAY U
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'72'				; DISPLAY H
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'65'				; DISPLAY A
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'77'				; DISPLAY M
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'77'				; DISPLAY M
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'65'				; DISPLAY A
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'68'				; DISPLAY D
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'32'				; DISPLAY SPACE
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'78'				; DISPLAY N
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'65'				; DISPLAY A
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'66'				; DISPLAY B
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'73'				; DISPLAY I
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'76'				; DISPLAY L
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'32'				; DISPLAY SPACE
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	0X01
				MOVWF	PORTD, A
				CALL 	COMMAND1

				BRA		checki

;===================================================================
;DISPLAY ID
;===================================================================
nabilicious1	MOVLW	D'68'				; DISPLAY D
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'69'				; DISPLAY E
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'57'				; DISPLAY 9
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'54'				; DISPLAY 6
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'53'				; DISPLAY 5
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'53'				; DISPLAY 5
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'56'				; DISPLAY 8
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	D'32'				; DISPLAY SPACE
				MOVWF	PORTD, A
				CALL	DATA1

				MOVLW	0X01
				MOVWF	PORTD, A
				CALL 	COMMAND1

				BRA		checko

;=====================================================================
;KEYPAD BUTTON
;=====================================================================

SHOW1			MOVLW	0XC0				; DISPLAY 1
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'49'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki

SHOW2			MOVLW	0XC0				; DISPLAY 2
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'50'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki
				
SHOW3			MOVLW	0XC0				; DISPLAY 3
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'51'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki

SHOW4			MOVLW	0XC0				; DISPLAY 4
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'52'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki

SHOW5			MOVLW	0XC0				; DISPLAY 5
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'53'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki
				
SHOW6			MOVLW	0XC0				; DISPLAY 6
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'54'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki

SHOW7			MOVLW	0XC0				; DISPLAY 7
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'55'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki

SHOW8			MOVLW	0XC0				; DISPLAY 8
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'56'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki
				
SHOW9			MOVLW	0XC0				; DISPLAY 9
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'57'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki

SHOWN			MOVLW	0XC0				; DISPLAY *
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'42'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki

SHOW0			MOVLW	0XC0				; DISPLAY 0
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'48'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki
				
SHOW#			MOVLW	0XC0				; DISPLAY #
				MOVWF	PORTD, A
				CALL 	COMMAND1
				MOVLW	D'35'
				MOVWF	PORTD, A
				CALL	DATA1
				BRA		checki

				

;=====================================================================
;MAIN PROGRAM
;=====================================================================
			
start		CLRF	TRISC, A				; CONFIGURE INPUT AND OUTPUT
			CLRF 	TRISD, A
			SETF	TRISB, A
			BCF		TRISB, 4, A	
			BCF		TRISB, 5, A	
			BCF		TRISB, 6, A	
			BCF		TRISB, 7, A	
			SETF	TRISA, A
			

			MOVLW	0X38					; CONFIGURE 2 LINES AND 5X7 MATRIX
			MOVWF	PORTD, A
			CALL	COMMAND1
			
			MOVLW	0X0E					; DISPLAY ON, CURSOR BLINKING
			MOVWF	PORTD, A
			CALL 	COMMAND1

			MOVLW	0X01					; CLEAR DISPLAY SCREEN
			MOVWF	PORTD, A
			CALL 	COMMAND1

			MOVLW	0X80					; FORCE CURSOR TO BEGINNING TO FIRST LINE
			MOVWF	PORTD, A
			CALL	COMMAND1


checki		BTFSC	PORTB, 0, A
			BRA		nabilicious
			CLRF	PORTD, A
checko		BTFSC	PORTB, 1, A
			BRA		nabilicious1
			CLRF	PORTD, A

KEYPAD1		CLRF	PORTB, A
			BSF		PORTB, 4, A
			BTFSC	PORTA, 4, A	
			BRA		SHOW1
			CLRF	PORTD, A

KEYPAD2		CLRF	PORTB, A
			BSF		PORTB, 4, A
			BTFSC	PORTB, 2, A	
			BRA		SHOW2
			CLRF	PORTD, A

KEYPAD3		CLRF	PORTB, A
			BSF		PORTB, 4, A
			BTFSC	PORTB, 3, A	
			BRA		SHOW3
			CLRF	PORTD, A

KEYPAD4		CLRF	PORTB, A
			BSF		PORTB, 5, A
			BTFSC	PORTA, 4, A	
			BRA		SHOW4
			CLRF	PORTD, A

KEYPAD5		CLRF	PORTB, A
			BSF		PORTB, 5, A
			BTFSC	PORTB, 2, A	
			BRA		SHOW5
			CLRF	PORTD, A

KEYPAD6		CLRF	PORTB, A
			BSF		PORTB, 5, A
			BTFSC	PORTB, 3, A	
			BRA		SHOW6
			CLRF	PORTD, A

KEYPAD7		CLRF	PORTB, A
			BSF		PORTB, 6, A
			BTFSC	PORTA, 4, A	
			BRA		SHOW7
			CLRF	PORTD, A

KEYPAD8		CLRF	PORTB, A
			BSF		PORTB, 6, A
			BTFSC	PORTB, 2, A	
			BRA		SHOW8
			CLRF	PORTD, A

KEYPAD9		CLRF	PORTB, A
			BSF		PORTB, 6, A
			BTFSC	PORTB, 3, A	
			BRA		SHOW9
			CLRF	PORTD, A

KEYPADN		CLRF	PORTB, A
			BSF		PORTB, 7, A
			BTFSC	PORTA, 4, A	
			BRA		SHOWN
			CLRF	PORTD, A

KEYPAD0		CLRF	PORTB, A
			BSF		PORTB, 7, A
			BTFSC	PORTB, 2, A	
			BRA		SHOW0
			CLRF	PORTD, A

KEYPAD#		CLRF	PORTB, A
			BSF		PORTB, 7, A
			BTFSC	PORTB, 3, A	
			BRA		SHOW#
			CLRF	PORTD, A

	
	
			NOP
			END
