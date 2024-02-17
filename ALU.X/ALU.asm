
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


    #DEFINE S0 PORTA,RA6
    #DEFINE S1 PORTA,RA5
    #DEFINE S2 PORTA,RA4
    
    #DEFINE N1 H'00';
    #DEFINE N2 H'01';
    ORG .0

CONFIGURACION_CFR
    CLRF PORTA ;PRIMERO SE LIMPIA PORTA
    SETF TRISA ;SE CONVIERTEN TODOS LOS BITS A 1 (ENTRADAS)
    MOVLW .15; SE PASA EL VALOR 0F A W
    MOVWF ADCON1 ;SE PASA EL VALOR DE W A ADCON1 PARA CONVERTIR LOS PORTS A, B Y E EN DIGITALES
    MOVLW .7 ; SE PASA EL VALOR 7 A W
    MOVWF CMCON ; SE PASA EL VALOR DE W A CMCON PARA EL MODULO COMPARADOR CONECTADO EN PORTA Y E, ESTA APAGADO
    CLRF TRISB ;TODOS LOS PINES DE PORTB SON SALIDAS
    CLRF LATB;
    
MAIN
    MOVFF PORTA,N1 ; MUEVE EL VALOR DE PORTA A N1. PORTA=7 Y N1=7
    MOVFF PORTA,N2 ; MUEVE EL VALOR DE PORTA A N2. PORTA=7 Y N2=7
    
    MOVLW B'00001100' ; SE MUEVE EL NUMERO A W PARA QUE SEA LA MASCARA
    ANDWF N1,F ;SE HACE LA AND ENTRE W Y N1 Y EL RESULTADO SE QUEDA EN N1. N1 ES LA MASCARA
    RRNCF N1,F ;ROTA A LA DERECHA SIN CARRY.
    RRNCF N1,F ;ROTA A LA DERECHA SIN CARRY.
    
    MOVLW B'00000011' ; SE MUEVE EL NUMERO A W PARA QUE SEA LA MASCARA
    ANDWF N2,F ;SE HACE LA AND ENTRE W Y N2 Y EL RESULTADO SE QUEDA EN N2. N2 ES LA MASCARA N2=7
    
    BTFSS S0 ; PREGUNTA SI VALE 1 A S0
    GOTO s0 ; SI NO VALE 1, SALTA A S0
    GOTO s1; SI VALE 1, SALTA A S1
    
s0
    BTFSS S1; PREGUNTA SI VALE 1 A S1
    GOTO s00; SI NO VALE 1, SALTA A S00
    GOTO s01; SI VALE 1, SALTA A S01

s1
    BTFSS S1; PREGUNTA SI VALE 1 A S1
    GOTO s10; SI NO VALE 1, SALTA A S10
    GOTO s11; SI VALE 1, SALTA A S11
    
s00
    BTFSS S2; PREGUNTA SI VALE 1 A S2
    GOTO s000_SUMA; SI NO VALE 1, SALTA A 000
    GOTO s001_RESTA; SI VALE 1, SALTA A 001

s01
    BTFSS S2; PREGUNTA SI VALE 1 A S2
    GOTO s010_MULTIPLICACION; SI NO VALE 1, SALTA A 010
    GOTO s011_AND; SI VALE 1, SALTA A 011
    
s10
    BTFSS S2; PREGUNTA SI VALE 1 A S2
    GOTO s100_OR; SI NO VALE 1, SALTA A 100
    GOTO s101_XOR; SI VALE 1, SALTA A 101

s11
    BTFSS S2; PREGUNTA SI VALE 1 A S2
    GOTO s110_NOT; SI NO VALE 1, SALTA A 110
    GOTO s111_COMPLEMENTO2; SI VALE 1, SALTA A 111


    
s000_SUMA
    MOVF N2,W ; MUEVE EL VALOR DE N2 A W.
    ADDWF N1,W;SUMA EL VALOR DE N1 Y W.  SE GUARDA EN W
    MOVWF LATB; MUEVE EL VALOR DE W A LATB.
    GOTO MAIN
    
s001_RESTA
    MOVF N2,W ; MUEVE EL VALOR DE N2 A W
    SUBWF N1,W; RESTA EL VALOR DE W A N1
    MOVWF LATB; MUEVE EL VALOR DE W A LATB
    GOTO MAIN
    
s010_MULTIPLICACION
    MOVF N2, W ; MUEVE EL VALOR DE N2 A W.
    MULWF N1,W;MULTIPLICA EL VALOR DE N1 Y W.
    MOVFF PRODL,LATB; MUEVE EL VALOR DE PRODL A LATB.
    GOTO MAIN
    
s011_AND
    MOVF N2,W ; MUEVE EL VALOR DE N2 A W.
    ANDWF N1,W;AND EN LOS VALORES N1 Y W. SE GUARDA EN W
    MOVWF LATB; MUEVE EL VALOR DE W A LATB.
    GOTO MAIN
    
s100_OR
    MOVF N2,W ; MUEVE EL VALOR DE N2 A W.
    IORWF N1,W;OR EN LOS VALORES DE N1 Y W.  SE GUARDA EN W
    MOVWF LATB; MUEVE EL VALOR DE W A LATB.
    GOTO MAIN
    
s101_XOR
    MOVF N2,W ; MUEVE EL VALOR DE N2 A W.
    XORWF N1,W;XOR EN LOS VALORES DE N1 Y W.  SE GUARDA EN W
    MOVWF LATB; MUEVE EL VALOR DE W A LATB.
    GOTO MAIN
    
s110_NOT
    COMF N1,W;NOT EN EL VALOR DE N1 Y SE GUARDA EN W
    MOVWF LATB; MUEVE EL VALOR DE W A LATB.
    GOTO MAIN
    
s111_COMPLEMENTO2
    NEGF N1;COMPLEMENTO2 DEL VALOR DE N1
    MOVfF N1,LATB; MUEVE EL VALOR DE N1 A LATB.
    GOTO MAIN

    END

