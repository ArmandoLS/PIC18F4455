0#INCLUDE "p18f4455.inc"

    ;programa para encender RB7 segun la xor entradas en RA5 Y RA4
    
    #DEFINE ON	    B'10000000'
    #DEFINE OFF	    B'00000000'
    #DEFINE DATO    .27
    
    ORG .0
       
    GOTO CONFIGURA
    
     ;---TABLA--- 
     TABLA 
     ADDWF  PCL,F
     RETLW  OFF
     RETLW  ON
     RETLW  ON
     RETLW  OFF
     ;---TABLA---
    
    ;---CONFIGURACION---
   CONFIGURA
    CLRF    PORTA
    MOVLW   B'00110000'
    SETF   TRISA
    
    MOVWF   ADCON1
    MOVLW   .7
    MOVWF   CMCON   
    
    CLRF    LATB
    CLRF    TRISB
    ;---CONFIGURACION---

    MOVFF PORTA, DATO 
    MOVLW B'00110000'
    ANDWF DATO,F
    SWAPF DATO,W
    RLNCF WREG,F
    
  MAIN 
  
    CALL TABLA
    MOVWF   LATB
    GOTO    MAIN 
    
    END
    
  