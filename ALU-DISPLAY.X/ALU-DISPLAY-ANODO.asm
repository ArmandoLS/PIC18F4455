;EDUARDO PACHECO CRUZ 4NM41
    ;ALU CON MENU DE 2 BITS
    ;MENU PORTA[6,5]
    ;A1,A0 = PORTA[3,2]
    ;B1,B0 = PORTA[1,0]
    ;DISPLAY CATODO COMUN
    
    ;#INCLUDE<P18F4550.INC>

; PIC18F4550 Configuration Bit Settings

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
  CONFIG  CP3 = OFF             ; Code Protection bit (Block 3 (006000-007FFFh) is not code-protected)

; CONFIG5H
  CONFIG  CPB = OFF             ; Boot Block Code Protection bit (Boot block (000000-0007FFh) is not code-protected)
  CONFIG  CPD = OFF             ; Data EEPROM Code Protection bit (Data EEPROM is not code-protected)

; CONFIG6L
  CONFIG  WRT0 = OFF            ; Write Protection bit (Block 0 (000800-001FFFh) is not write-protected)
  CONFIG  WRT1 = OFF            ; Write Protection bit (Block 1 (002000-003FFFh) is not write-protected)
  CONFIG  WRT2 = OFF            ; Write Protection bit (Block 2 (004000-005FFFh) is not write-protected)
  CONFIG  WRT3 = OFF            ; Write Protection bit (Block 3 (006000-007FFFh) is not write-protected)

; CONFIG6H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) are not write-protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot block (000000-0007FFh) is not write-protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM is not write-protected)

; CONFIG7L
  CONFIG  EBTR0 = OFF           ; Table Read Protection bit (Block 0 (000800-001FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR1 = OFF           ; Table Read Protection bit (Block 1 (002000-003FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR2 = OFF           ; Table Read Protection bit (Block 2 (004000-005FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR3 = OFF           ; Table Read Protection bit (Block 3 (006000-007FFFh) is not protected from table reads executed in other blocks)

; CONFIG7H
  CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot block (000000-0007FFh) is not protected from table reads executed in other blocks)

    
;ETIQUETAS   
    #DEFINE IA PORTA,RA6
    #DEFINE IB PORTA,RA5
    
    #DEFINE DATOA H'00' ;0000 1100 
    #DEFINE DATOB H'01' ;0000 0011
		    ;pGFEDCBA
    #DEFINE CERO   B'00111111'
    #DEFINE UNO    B'00000110'
    #DEFINE DOS    B'01011011'
    #DEFINE TRES   B'01001111'
    #DEFINE CUATRO B'01100110'
    #DEFINE CINCO  B'01101101'
    #DEFINE SEIS   B'01111101'
    #DEFINE SIETE  B'01000111'
    #DEFINE OCHO   B'01111111'
    #DEFINE NUEVE  B'01100111'
    ORG .0
    GOTO INICIO

TABLA
    ADDWF PCL,F
    RETLW CERO ;ASIGNA EL VALOR DE CERO A W
    RETLW UNO ;ASIGNA EL VALOR DE UNO A W
    RETLW DOS ;ASIGNA EL VALOR DE DOS A W
    RETLW TRES ;ASIGNA EL VALOR DE TRES A W
    RETLW CUATRO ;ASIGNA EL VALOR DE CUATRO A W
    RETLW CINCO ;ASIGNA EL VALOR DE CINCO A W
    RETLW SEIS ;ASIGNA EL VALOR DE SEIS A W    
    RETLW SIETE ;ASIGNA EL VALOR DE SIETE A W
    RETLW OCHO ;ASIGNA EL VALOR DE OCHO A W
    RETLW NUEVE ;ASIGNA EL VALOR DE NUEVE A W
    
INICIO
    CLRF PORTA
    SETF TRISA ;LOS PINES RA[0,1,2,3,4,5,6] SON INPUTS
    MOVLW H'0F'
    MOVWF ADCON1    ;LOS PORTS A,B,E SON DIGITALES
    MOVLW .7	
    MOVWF CMCON	    ;EL MOD COMPARADOR CONECTADO EN PORTA Y E ESTA OFF
    
    CLRF TRISD	    ;TODOS LOS PINES DEL PD SON OUTS
    CLRF LATD
    
MAIN
    MOVFF PORTA,DATOA ; MUEVE EL VALOR DE PORTA to DATOA.
    MOVFF PORTA,DATOB ; MUEVE EL VALOR DE PORTA to DATOB.
    
    ;NOS QUEDAMOS CON EL DATOB:
    MOVLW B'00000011' ;ENMASCARAMOS DATOB
    ANDWF DATOB,F
    
    ;MASCARA A DATOA:
    MOVLW B'00001100'
    ANDWF DATOA,F    ;DATO ES EL PORTA[RA3,RA2] QUE VAMOS A MASKEAR DATOA=12 O 0000 1100
    RRNCF DATOA,F    ; DATOA=6 B'0000 0110'
    RRNCF DATOA,F    ; DATOA=3 B'0000 0011'
    
    BTFSS IA ;RA6 ES 1?
    GOTO IA_0 ;NO
    GOTO IA_1 ;SI

IA_0
    BTFSS IB ;RA5 ES 1?
    GOTO SUMA  ;NO 00
    GOTO RESTA ;SI 01
IA_1
    BTFSS IB ;RA5 ES 1?
    GOTO MULTIPLICACION ;NO 10
    GOTO MAIN		;SI 11

SUMA
    MOVF DATOB, W ;MOVEMOS A W LO QUE TENGA DATOB(RA1,RA0)
    ADDWF DATOA, W ;DATOA + W (SE QUEDA EN W)
    RLNCF WREG, W;ROTAMOS A W A LA IZQ PARA QUE SEA PAR
    CALL TABLA
    MOVWF LATD ;MOVEMOS EL RESULTADO A PORTD
    GOTO MAIN

RESTA
    MOVF DATOB, W ;MOVEMOS A W LO QUE TENGA DATOB(RA1,RA0)
    SUBWF DATOA, W ;DATOA - W (SE QUEDA EN W)
    BTFSS STATUS,N ;STATUS[N] ES NEGATIVO?
    GOTO POSITIVO ;NO
    GOTO NEGATIVO ;SI
NEGATIVO
    BSF LATD, RD7 ;PRENDEMOS EL PUNTO PARA DECIR QUE ES NEGATIVO
    NEGF WREG, W ;CONVERTIMOS W A POSITIVO
    RLNCF WREG, W;;ROTAMOS A W A LA IZQ PARA QUE SEA PAR
    CALL TABLA
    MOVWF LATD
    GOTO MAIN
POSITIVO
    RLNCF WREG, W;;ROTAMOS A W A LA IZQ PARA QUE SEA PAR
    CALL TABLA
    MOVWF LATD
    GOTO MAIN
MULTIPLICACION
    ;MULTIPLICAMOS DATOA * DATOB
    MOVF DATOB, W ;MOVEMOS A W LO QUE TENGA DATOB(RA1,RA0)
    MULWF DATOA,W ;DATOA * W (SE QUEDA EL RESULTADO EN PRODL Y PRODH, no en w)
    MOVFF PRODL,WREG ;REGRESAMOS EL RESULTADO A WREG
    RLNCF WREG, W;
    CALL TABLA
    MOVWF LATD ;MOVEMOS EL RESULTADO A PORTD
    GOTO MAIN
    END