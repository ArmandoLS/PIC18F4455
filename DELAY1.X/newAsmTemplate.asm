; PIC18F4455 Configuration Bit Settings

; Assembly source line config statements

#include "p18f4455.inc"

  
#DEFINE LED LATB,5
     
CBLOCK	.13 
    REG_I
    REG_J
    COPIA
ENDC

    ORG .0
    
    ;----------CALCULO----------
    
  ; 1+2+1+1+1(K-1)+2+2(K-1)+2
  ; =6+3K
 
  ;ENCONTRAR EL VALOR DE J QUE PERMITA SUMAR LOS CICLOS NECESARIOS (K)
  
  ;250 = 6+3K	    ;SE DESPEJA 
  
  ;(250-6)/3 = K = 81.3
  
  ;SUSTITULLO EL VALOR DE K
  
  ;6+3K = 6+3(81)=249
  
    ;----------CALCULO----------
  
    DELAY1
    MOVLW   .81		;=ESTE ES (K)	;1CM
    MOVLW   REG_I			;1CM
  
    OTRA
    DECFSZ  REG_I,F	;1CM(K-1)+2
    BRA	    OTRA	;2CM(K-1)
    RETURN		;2CM	
    
    CONFIGURACION
    
    CLRF    TRISB
    CLRF    LATB
    CLRF    WREG
    
    MAIN 
	BSF	LED
	CALL	DELAY1
	BCF	LED
	CALL	DELAY1
	BRA	MAIN
	

END