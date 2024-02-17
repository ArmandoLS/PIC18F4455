
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

    

    #DEFINE	LED0	LATB, RB0	;LED ES ETIQUETA DEL PIN 5 DEL PORTB
    #DEFINE	LED1	LATB, RB1
    #DEFINE	LED2	LATB, RB2
    #DEFINE	LED3	LATB, RB3
    #DEFINE	LED4	LATB, RB4
    #DEFINE	LED5	LATB, RB5
    #DEFINE	LED6	LATB, RB6
    #DEFINE	LED7	LATB, RB7
  
  
;   ----------------------- EL RETARDO MAS HDSPTM DEL MUNDO -------------------------------
 CBLOCK	.13
    I
    J
    NO
 ENDC
    
    ORG	.0  ;DIREC DE LA MEM PROG DONDE SE ESCRIBE 
	    ;LA PRIMER INSTRUCCION
    BRA	    SETTINGS
DELAY_100mS
    MOVLW   .64	;1CM
    MOVWF   NO	;1CM
    NOP	
OTRA2
    DECFSZ  NO	;1CM(N-1)+2CM
    GOTO    OTRA2   ;2CM(N-1)	;1+3N=194 N=64
    MOVLW   .255	;1CM
    MOVWF   J	;1 CM
DELAY_1mS
    MOVLW   .81	;M(1CM)
    MOVWF   I	;M(1 CM)
    NOP		;M(1CM)
OTRA
    DECFSZ  I,F	;(1CM(K-1)+2CM)M
    BRA	    OTRA;(2CM(K-1))M
    DECFSZ  J,F	;(1CM(M-1)+2CM
    BRA	    DELAY_1mS;(2CM(M-1))
    RETURN	;2CM  

;   ----------------------- EL RETARDO MAS HDSPTM DEL MUNDO -------------------------------

	
SETTINGS
    CLRF    TRISB   ;PORTB ES SALIDA   
    CLRF    LATB    ;LIMPIAR PORTB
    CLRF    WREG
       
MAIN 
    
L0		
    BSF	    LED0
    BSF	    LED7
    CALL    DELAY_100mS		
    BCF	    LED0
    BCF	    LED7
    CALL    DELAY_100mS
    
L1		
    BSF	    LED1
    BSF	    LED6
    CALL    DELAY_100mS		
    BCF	    LED1
    BCF	    LED6
    CALL    DELAY_100mS

L2	
    BSF	    LED2
    BSF	    LED5
    CALL    DELAY_100mS		
    BCF	    LED2
    BCF	    LED5
    CALL    DELAY_100mS
L3	
    BSF	    LED3
    BSF	    LED4
    CALL    DELAY_100mS		
    BCF	    LED3
    BCF	    LED4
    CALL    DELAY_100mS  

L4	
    BSF	    LED4
    BSF	    LED3
    CALL    DELAY_100mS		
    BCF	    LED4
    BCF	    LED3
    CALL    DELAY_100mS  
      
L5	
    BSF	    LED5
    BSF	    LED2
    CALL    DELAY_100mS		
    BCF	    LED5
    BCF	    LED2
    CALL    DELAY_100mS  
    
L6	
    BSF	    LED6
    BSF	    LED1
    CALL    DELAY_100mS		
    BCF	    LED6
    BCF	    LED1
    CALL    DELAY_100mS    
    
L7	
    BSF	    LED7
    BSF	    LED0
    CALL    DELAY_100mS		
    BCF	    LED7
    BCF	    LED0
    CALL    DELAY_100mS  
    
    BRA	    MAIN
    END