
; PIC18F4455 Configuration Bit Settings

; Assembly source line config statements

#include "p18f4550.inc"

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

    
    
    #DEFINE I6	PORTA,	RA6
    #DEFINE I5	PORTA,	RA5
    #DEFINE I4	PORTA,	RA4
    #DEFINE I3	PORTA,	RA3
    
    
		    ;pGFEDCBA
    #DEFINE CERO   B'00111111'
    #DEFINE DOS    B'01011011'
    #DEFINE TRES   B'01001111'
    #DEFINE CUATRO B'01100110'
    #DEFINE CINCO  B'01101101'
    #DEFINE SEIS   B'01111101'
    #DEFINE SIETE  B'00000111'
    #DEFINE OCHO   B'01111111'
    #DEFINE B_	   B'01111100'
    #DEFINE D_	   B'01011110'
    #DEFINE PUNTO  B'10000000'

    
    ORG .0
    GOTO CONFIGURACION
    
    ;------RETARDO---------
DELAY_100mS
    MOVLW   .70	;1CM
    MOVWF   NO	;1CM
    NOP	
OTRA2
    DECFSZ  NO	;1CM(N-1)+2CM
    GOTO    OTRA2   ;2CM(N-1)	;1+3N=194 N=64
    MOVLW   .255	;1CM
    MOVWF   J	;1 CM
DELAY_1mS
    MOVLW   .100;M(1CM)
    MOVWF   I	;M(1 CM)
    NOP		;M(1CM)
OTRA
    DECFSZ  I,F	;(1CM(K-1)+2CM)M
    BRA	    OTRA;(2CM(K-1))M
    DECFSZ  J,F	;(1CM(M-1)+2CM
    BRA	    DELAY_1mS;(2CM(M-1))
    RETURN	;2CM   
    ;------RETARDO---------

    ;---CONFIGURACION---
CONFIGURACION
    CLRF    PORTA
    MOVLW   B'00110000'
    MOVWF   TRISA
    MOVLW   .15
    MOVWF   ADCON1
    MOVLW   .7
    MOVWF   CMCON   
    
    CLRF    LATB
    CLRF    TRISB
    
    GOTO    INICIO
    ;---CONFIGURACION---
    

INICIO
 
   CBLOCK   .30
   I
   J
   NO
   ENDC
   
    ;----- SELECCION -----
MAIN
    
IB1
    BTFSS   I6		    ;1=??
    GOTO    PRIMOS	    ;=0
    GOTO    PARES	    ;=1
    
 ;----- SELECCION -----

PARES;10 

OCHOpar
    MOVLW   OCHO
    MOVWF   LATB
    BTFSC   I4
    GOTO    OCHOpar
    CALL    DELAY_100mS
    CALL    DELAY_100mS
    BTFSC   I5
    GOTO    REINICIO
    GOTO    SEISpar
    BTFSS   I6
    GOTO    PRIMOS
    GOTO    SEISpar


    
SEISpar  
    MOVLW   SEIS
    MOVWF   LATB
    BTFSC   I4
    GOTO    SEISpar
    CALL    DELAY_100mS
    CALL    DELAY_100mS
    BTFSC   I5
    GOTO    REINICIO
    GOTO    CUATROpar  
    BTFSS   I6
    GOTO    PRIMOS
    GOTO    CUATROpar

CUATROpar
    MOVLW   CUATRO
    MOVWF   LATB
    BTFSC   I4
    GOTO    CUATROpar
    CALL    DELAY_100mS
    CALL    DELAY_100mS
    BTFSC   I5
    GOTO    REINICIO
    GOTO    DOSpar 
    BTFSS   I6
    GOTO    PRIMOS
    GOTO    DOSpar 
    
DOSpar
    MOVLW   DOS
    MOVWF   LATB
    BTFSC   I4
    GOTO    DOSpar
    CALL    DELAY_100mS
    CALL    DELAY_100mS
    BTFSC   I5
    GOTO    REINICIO
    GOTO    OCHOpar  
    BTFSS   I6
    GOTO    PRIMOS
    GOTO    OCHOpar 
    
    GOTO    MAIN


PRIMOS;01

DOSP  
    MOVLW   DOS
    MOVWF   LATB
    BTFSC   I4
    GOTO    DOSP
    CALL    DELAY_100mS
    CALL    DELAY_100mS
    BTFSC   I5
    GOTO    REINICIO
    GOTO    TRESP
    BTFSC   I6
    GOTO    PARES
    GOTO    TRESP

    
TRESP
    MOVLW   TRES
    MOVWF   LATB
    BTFSC   I4
    GOTO    TRESP
    CALL    DELAY_100mS
    CALL    DELAY_100mS
    BTFSC   I5
    GOTO    REINICIO
    GOTO    CINCOP
    BTFSC   I6
    GOTO    PARES
    GOTO    CINCOP

CINCOP
    MOVLW   CINCO
    MOVWF   LATB
    BTFSC   I4
    GOTO    CINCOP
    CALL    DELAY_100mS
    CALL    DELAY_100mS
    BTFSC   I5
    GOTO    REINICIO
    GOTO    SIETEP
    BTFSC   I6
    GOTO    PARES
    GOTO    SIETEP

    
SIETEP
    MOVLW   SIETE
    MOVWF   LATB
    BTFSC   I4
    GOTO    SIETEP
    CALL    DELAY_100mS
    CALL    DELAY_100mS
    BTFSC   I5
    GOTO    REINICIO
    GOTO    BP
    BTFSC   I6
    GOTO    PARES
    GOTO    BP
    
BP
    MOVLW   B_
    MOVWF   LATB
    BTFSC   I4
    GOTO    BP
    CALL    DELAY_100mS
    CALL    DELAY_100mS  
    BTFSC   I5
    GOTO    REINICIO
    GOTO    DP
    BTFSC   I6
    GOTO    PARES
    GOTO    DP

    
DP
    MOVLW   D_
    MOVWF  LATB
    BTFSC   I4
    GOTO    DP
    CALL    DELAY_100mS
    CALL    DELAY_100mS
    BTFSC   I5
    GOTO    REINICIO
    GOTO    DOSP
    BTFSC   I6
    GOTO    PARES
    GOTO    DOSP

    
        GOTO    MAIN
	
	
REINICIO

    MOVLW   CERO
    MOVWF   LATB
    GOTO    MAIN
	
NADA
   
   NOP
   GOTO MAIN 
 
STOP
   BTFSS    I5
   GOTO	    NADA
   GOTO	    STOP
   
   GOTO	    MAIN 
   
   
   
    
    END 
   