
; PIC18F4455 Configuration Bit Settings

; Assembly source line config statements

#include "p18f4455.inc"

; CONFIG1L
  CONFIG  PLLDIV = 1            ; PLL Prescaler Selection bits (No prescale (4 MHz oscillator input drives PLL directly))
  CONFIG  CPUDIV = OSC1_PLL2    ; System Clock Postscaler Selection bits ([Primary Oscillator Src: /1][96 MHz PLL Src: /2])
  CONFIG  USBDIV = 1            ; USB Clock Selection bit (used in Full-Speed USB mode only; UCFG:FSEN = 1) (USB clock source comes directly from the primary oscillator block with no postscale)

; CONFIG1H
  CONFIG  FOSC = INTOSCIO_EC    ; Oscillator Selection bits (Internal oscillator, port function on RA6, EC used by USB (INTIO))
  CONFIG  FCMEN = OFF           ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
  CONFIG  IESO = OFF            ; Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)

; CONFIG2L
  CONFIG  PWRT = ON             ; Power-up Timer Enable bit (PWRT enabled)
  CONFIG  BOR = OFF             ; Brown-out Reset Enable bits (Brown-out Reset disabled in hardware and software)
  CONFIG  BORV = 3              ; Brown-out Reset Voltage bits (Minimum setting 2.05V)
  CONFIG  VREGEN = OFF          ; USB Voltage Regulator Enable bit (USB voltage regulator disabled)

; CONFIG2H
  CONFIG  WDT = OFF             ; Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
  CONFIG  WDTPS = 32768         ; Watchdog Timer Postscale Select bits (1:32768)

; CONFIG3H
  CONFIG  CCP2MX = ON           ; CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)
  CONFIG  PBADEN = OFF          ; PORTB A/D Enable bit (PORTB<4:0> pins are configured as digital I/O on Reset)
  CONFIG  LPT1OSC = OFF         ; Low-Power Timer 1 Oscillator Enable bit (Timer1 configured for higher power operation)
  CONFIG  MCLRE = ON            ; MCLR Pin Enable bit (MCLR pin enabled; RE3 input pin disabled)

; CONFIG4L
  CONFIG  STVREN = ON           ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
  CONFIG  LVP = OFF             ; Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)
  CONFIG  ICPRT = OFF           ; Dedicated In-Circuit Debug/Programming Port (ICPORT) Enable bit (ICPORT disabled)
  CONFIG  XINST = OFF           ; Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

; CONFIG5L
  CONFIG  CP0 = OFF             ; Code Protection bit (Block 0 (000800-001FFFh) is not code-protected)
  CONFIG  CP1 = OFF             ; Code Protection bit (Block 1 (002000-003FFFh) is not code-protected)
  CONFIG  CP2 = OFF             ; Code Protection bit (Block 2 (004000-005FFFh) is not code-protected)

; CONFIG5H
  CONFIG  CPB = OFF             ; Boot Block Code Protection bit (Boot block (000000-0007FFh) is not code-protected)
  CONFIG  CPD = OFF             ; Data EEPROM Code Protection bit (Data EEPROM is not code-protected)

; CONFIG6L
  CONFIG  WRT0 = OFF            ; Write Protection bit (Block 0 (000800-001FFFh) is not write-protected)
  CONFIG  WRT1 = OFF            ; Write Protection bit (Block 1 (002000-003FFFh) is not write-protected)
  CONFIG  WRT2 = OFF            ; Write Protection bit (Block 2 (004000-005FFFh) is not write-protected)

; CONFIG6H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) are not write-protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot block (000000-0007FFh) is not write-protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM is not write-protected)

; CONFIG7L
  CONFIG  EBTR0 = OFF           ; Table Read Protection bit (Block 0 (000800-001FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR1 = OFF           ; Table Read Protection bit (Block 1 (002000-003FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR2 = OFF           ; Table Read Protection bit (Block 2 (004000-005FFFh) is not protected from table reads executed in other blocks)

; CONFIG7H
  CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot block (000000-0007FFh) is not protected from table reads executed in other blocks)



    
#DEFINE SW	PORTA,1
#DEFINE	SW2	PORTA,0
#DEFINE BOTON   PORTE,0
#DEFINE	BOTON2	PORTE,1
    		;pGFEDCBA
#DEFINE CERO   B'00111111'
#DEFINE UNO    B'00000110'
#DEFINE DOS    B'01011011'
#DEFINE TRES   B'01001111'
#DEFINE NADA   B'00000000'
#DEFINE CUATRO B'01100110'
#DEFINE CINCO  B'01101101'
#DEFINE SEIS   B'01111101'
#DEFINE SIETE  B'00000111'
#DEFINE OCHO   B'01111111'
#DEFINE NUEVE  B'01100111'
#DEFINE	A_      B'01110111'
#DEFINE	B_      B'01111100'
#DEFINE	C_      B'00111001'

#DEFINE	VERDE   B'00001000'
#DEFINE	ROJO	B'00000001'


    CBLOCK	.50
    I
    J  
    ENDC
    ORG	.0
    GOTO SETIINGS
    
        ;------RETARDO---------
DELAY_10MS
    MOVLW   .10		;1CM
    MOVWF   J		;1CM
    NOP	
DELAY_1mS
    MOVLW   .81		;M(1CM)
    MOVWF   I		;M(1 CM)
    NOP			;M(1CM)
AGAIN
    DECFSZ  I		;(1CM(K-1)+2CM)M
    BRA	    AGAIN   	;(2CM(K-1))M
    DECFSZ  J	    	;(1CM(M-1)+2CM
    BRA	    DELAY_1mS	;(2CM(M-1))
    RETURN		;2CM   
    ;------RETARDO---------
   
    ;------LED-----------
LED_ROJO
    CALL DELAY_10MS
    CALL DELAY_10MS
    CALL DELAY_10MS
    CALL DELAY_10MS
    CALL DELAY_10MS
    MOVLW ROJO
    MOVWF PORTB
    CALL DELAY_10MS
    CALL DELAY_10MS
    CALL DELAY_10MS
    CALL DELAY_10MS
    CALL DELAY_10MS
    MOVLW NADA
    MOVWF PORTB
    RETURN
    ;----------------------   

    ;-------CONFI----------
SETIINGS
    CLRF    PORTE
    SETF    TRISE
    CLRF    PORTA
    SETF    TRISA
    MOVLW   H'0F'
    MOVWF   ADCON1
    MOVLW   .7
    MOVWF   CMCON
    CLRF    TRISB
    CLRF    LATB
    CLRF    TRISD
    CLRF    LATD
    ;-------CONFI---------- 

MAIN
    MOVLW   NADA
    MOVWF   LATD
    MOVLW   NADA
    MOVWF   LATB
    
    BTFSS   SW
    GOTO    MAIN  
    GOTO    SW2.1
SW2.1
    BTFSS   SW2
    GOTO    DISPENSAR
    GOTO    MAIN
;--------------------C-----------------
    ;--------INICIO--------------
DISPENSAR
    MOVLW   C_
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB

    
    BTFSS   BOTON
    GOTO    DISPENSAR 
OTRA1 
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA1
    GOTO    B2.2 
    
;-----------B---------------   
    
B2.2
    BTFSS   BOTON2
    GOTO    DIS1 
OTRA2.2 
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.2
    GOTO    DISPENSAR
    
DIS1
    BTFSS   SW
    GOTO    MAIN
SW2.2
    BTFSS   SW2
    GOTO    LETRAB
    GOTO    MAIN
LETRAB    
    MOVLW   B_
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.2 
OTRA2 
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA2
    GOTO    DIS2
  
    
;---------------- 
;------A------------
B2.3
    BTFSS   BOTON2
    GOTO    DIS2 
OTRA2.3 
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.3
    GOTO    B2.2
    
DIS2
    BTFSS   SW
    GOTO    MAIN
SW2.3
    BTFSS   SW2
    GOTO    LETRAA
    GOTO    MAIN 
LETRAA
    MOVLW   A_ 
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.3
OTRA3 
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA3
    GOTO    DIS3
;-------------------
;-------9---------
B2.4
    BTFSS   BOTON2
    GOTO    DIS3 
OTRA2.4 
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.4
    GOTO    B2.3   
 
DIS3
    BTFSS   SW
    GOTO    MAIN
SW2.4
    BTFSS   SW2
    GOTO    NUMERO9
    GOTO    MAIN 
NUMERO9 
    MOVLW   NUEVE 
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.4
OTRA4 
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA4
    GOTO    DIS4
;----------------------
   ;----------8----------
B2.5
    BTFSS   BOTON2
    GOTO    DIS4 
OTRA2.5 
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.5
    GOTO    B2.4  
DIS4
    BTFSS   SW
    GOTO    MAIN
SW2.5
    BTFSS   SW2
    GOTO    NUMERO8
    GOTO    MAIN 
NUMERO8  
    MOVLW   OCHO 
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.5
OTRA5
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA5
    GOTO    DIS5
;------------------------------
;-----------7----------------
B2.6
    BTFSS   BOTON2
    GOTO    DIS5
OTRA2.6
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.6
    GOTO    B2.5     
 
DIS5
    BTFSS   SW
    GOTO    MAIN
SW2.6
    BTFSS   SW2
    GOTO    NUMERO7
    GOTO    MAIN 
NUMERO7   
    MOVLW   SIETE 
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.6
OTRA6
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA6
    GOTO    DIS6
;------------------------
;----------6-----------
B2.7
    BTFSS   BOTON2
    GOTO    DIS6
OTRA2.7
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.7
    GOTO    B2.6 
DIS6
    BTFSS   SW
    GOTO    MAIN
SW2.7
    BTFSS   SW2
    GOTO    NUMERO6
    GOTO    MAIN 
NUMERO6 
    MOVLW   SEIS 
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.7
OTRA7
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA7
    GOTO    DIS7
;-----------------------
;---------5-------------
B2.8
    BTFSS   BOTON2
    GOTO    DIS7
OTRA2.8
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.8
    GOTO    B2.7 
DIS7
    BTFSS   SW
    GOTO    MAIN
SW2.8
    BTFSS   SW2
    GOTO    NUMERO5
    GOTO    MAIN 
NUMERO5   
    MOVLW   CINCO 
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.8
OTRA8
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA8
    GOTO    DIS8
;------------------------
;----------4------------
B2.9
    BTFSS   BOTON2
    GOTO    DIS8
OTRA2.9
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.9
    GOTO    B2.8 
  
DIS8
    BTFSS   SW
    GOTO    MAIN
SW2.9
    BTFSS   SW2
    GOTO    NUMERO4
    GOTO    MAIN 
NUMERO4   
    MOVLW   CUATRO 
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.9
OTRA9
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA9
    GOTO    DIS9
;-------------------
;---------3---------
B2.10
    BTFSS   BOTON2
    GOTO    DIS9
OTRA2.10
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.10
    GOTO    B2.9
DIS9
    BTFSS   SW
    GOTO    MAIN
SW2.10
    BTFSS   SW2
    GOTO    NUMERO3
    GOTO    MAIN 
NUMERO3   
    MOVLW   TRES 
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.10
OTRA10
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA10
    GOTO    DIS10
;-----------------------------
;------------2---------------
B2.11
    BTFSS   BOTON2
    GOTO    DIS10
OTRA2.11
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.11
    GOTO    B2.10
DIS10
    BTFSS   SW
    GOTO    MAIN
SW2.11
    BTFSS   SW2
    GOTO    NUMERO2
    GOTO    MAIN 
NUMERO2  
    MOVLW   DOS 
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.11
OTRA11
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA11
    GOTO    DIS11
;--------------------------
;-----------1-------------
B2.12
    BTFSS   BOTON2
    GOTO    DIS11
OTRA2.12
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.12
    GOTO    B2.11
DIS11
    BTFSS   SW
    GOTO    MAIN
SW2.12
    BTFSS   SW2
    GOTO    NUMERO1
    GOTO    MAIN 
NUMERO1 
    MOVLW   UNO 
    MOVWF   LATD
    MOVLW   VERDE
    MOVWF   LATB
    
    BTFSS   BOTON
    GOTO    B2.12
OTRA12
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA12
    GOTO    DIS12
;--------------------
;-----------0--------
B2.13
    BTFSS   BOTON2
    GOTO    DIS12
OTRA2.14
    CALL    DELAY_10MS
    BTFSC   BOTON2
    GOTO    B2.13
    GOTO    B2.12
 
DIS12  
    BTFSS   SW
    GOTO    MAIN
SW2.13
    BTFSS   SW2
    GOTO    NUMERO0
    GOTO    MAIN 
NUMERO0
    CALL    LED_ROJO 
    
    MOVLW   CERO 
    MOVWF   LATD
    
    BTFSS   BOTON
    GOTO    B2.13
OTRA13
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA13
    GOTO    DIS12
   
    END
    
