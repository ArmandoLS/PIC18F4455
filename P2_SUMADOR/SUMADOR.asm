    ;PROGRAMA SUMADOR DE 2 NUMERO DE 3 BITS QUE INGRESAN EN PA Y EL RESULTADO SE MUESTRA EN PB
    
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

    
    #DEFINE N1 H'06'; N1 ES LA ETIQUETA DEL NUMERO 2
    #DEFINE N2 H'05';   NI ES LA ETIQUETA DEL NUMERO 5
    
    ORG .0 ;DIRECCION DE LA MEMORIA DE PROGRAMA DONDE SE ESCRIBE LA PRIMER INSTRUCCION

    ;CONFIGURACION DE TODOS LOS CFR
    CONFIGURACION_CFR
    CLRF PORTA ;PRIMERO SE LIMPIA PORTA
    SETF TRISA ; PONE TODO EN 1 PARA QUE SEAN ENTRADAS
    MOVLW H'0F'; SE PASA EL VALOR 0F A W
    MOVWF ADCON1 ;SE PASA EL VALOR DE W A ADCON1 PARA CONVERTIR LOS PORTS A, B Y E EN DIGITALES
    MOVLW .7 ; SE PASA EL VALOR 7 A W
    MOVWF CMCON ; SE PASA EL VALOR DE W A CMCON PARA EL MODULO COMPARADOR CONECTADO EN PORTA Y E, ESTA APAGADO
    CLRF LATB
    CLRF TRISB ;TODOS LOS PINES DE PORTB SON SALIDAS
    
    
    MAIN
    MOVFF PORTA,N1 ; MUEVE EL VALOR DE PORTA A N1. PORTA=7 Y N1=7
    MOVLW B'00111000' ; SE MUEVE EL NUMERO A W PARA QUE SEA LA MASCARA
    ANDWF N1,F ;SE HACE LA AND ENTRE W Y N1 Y EL RESULTADO SE QUEDA EN N1. N1 ES LA MASCARA
    RRNCF N1,F ;ROTA A LA DERECHA SIN CARRY. PA=16 N1=28
    RRNCF N1,F ;ROTA A LA DERECHA SIN CARRY. PA=16 N1=14
    RRNCF N1,F ;ROTA A LA DERECHA SIN CARRY. PA=16 N1=7
    
    MOVFF PORTA,N2 ; MUEVE EL VALOR DE PORTA A N2. PORTA=7 Y N2=7
    MOVLW B'00000111' ; SE MUEVE EL NUMERO A W PARA QUE SEA LA MASCARA
    ANDWF N2,F ;SE HACE LA AND ENTRE W Y N2 Y EL RESULTADO SE QUEDA EN N2. N2 ES LA MASCARA N2=7


    MOVWF N2 ; MUEVE EL VALOR DE N2 A W. N2=7 W=7
    ADDWF N1,W;SUMA EL VALOR DE N1 Y W. N1=7 Y W=7
    MOVWF LATB; MUEVE EL VALOR DE W A LATB. LATB=14
    GOTO MAIN; VUELVE A MAIN. SE HACE UN CICLO
    END



