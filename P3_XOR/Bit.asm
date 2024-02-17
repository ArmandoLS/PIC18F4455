#INCLUDE "p18f4455.inc"
    
    #DEFINE LED LATB, RB7
    #DEFINE IA	PORTA,	RA5
    #DEFINE IB	PORTA,	RA4
    
    ORG .0
    
    ;---CONFIGURACION---
   INICIO
    CLRF    PORTA
    MOVLW   B'00110000'
    MOVWF   TRISA
    MOVLW   .15
    MOVWF   ADCON1
    MOVLW   .7
    MOVWF   CMCON   
    
    CLRF    LATB
    CLRF    TRISB
    ;---CONFIGURACION---
    
   MAIN
   
    BTFSS   IA	    ;IA=1 SALTA A 26
    GOTO    IB0
    GOTO    IB1	    ;26
    
   IB1
    BTFSS   IB 
    GOTO    ON
    GOTO    OFF
    
   IB0
    BTFSC   IB
    GOTO    ON
    GOTO    OFF
    
   ON
    BSF	    LED
    GOTO    MAIN
    
   OFF
    BCF	    LED	
    GOTO    MAIN 
    
    END 


