;PROGRMA PARA EL CONTROL DE ENCENDIDO Y APAGADO DE UN LED (RB0)
    ;POR MEDIO DE UN BOTON (RE0) RESISTOR PULLDOWN, METODO CLICK 
    
    #include "p18f4455.inc"
    
    #DEFINE BOTON   PORTE,0
    #DEFINE BOTON2  PORTE,1
    #DEFINE LED	    LATB,0
    
    CBLOCK	.0
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
    
    ;-------CONFI----------
SETIINGS
    CLRF    PORTE
    SETF    TRISE
    MOVLW   H'0F'
    MOVWF   ADCON1
    MOVLW   .7
    MOVWF   CMCON
    CLRF    TRISB
    CLRF    LATB
    ;-------CONFI---------- 
    
MAIN
    BTFSS   BOTON
    GOTO    MAIN 
OTRA 
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA
    GOTO    ACCION
ACCION	
    BSF	    LED
    
MAIN2     
    BTFSS   BOTON2
    GOTO    MAIN2
OTRA2	
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA
    GOTO    ACCION2
ACCION2
    BCF	    LED
    GOTO    MAIN
    END 