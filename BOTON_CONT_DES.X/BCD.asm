;PROGRMA PARA EL CONTROL DE ENCENDIDO Y APAGADO DE UN LED (RB0)
    ;POR MEDIO DE UN BOTON (RE0) RESISTOR PULLDOWN, METODO CLICK 
    
    #include "p18f4455.inc"
    
    #DEFINE BOTON   PORTE,0
    #DEFINE BOTON2  PORTE,1
		    ;pGFEDCBA
    #DEFINE CERO   B'00111111'
    #DEFINE UNO    B'00000110'
    #DEFINE DOS    B'01011011'
    #DEFINE TRES   B'01001111'
    
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
    CLRF    TRISD
    CLRF    LATD
    ;-------CONFI---------- 
    
MAIN
    MOVLW   UNO
    MOVWF   LATD
    
    BTFSS   BOTON
    GOTO    MAIN 
OTRA1 
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA1
    GOTO    DIS1 
    
    
DIS1 	
    MOVLW   DOS
    MOVWF   LATD
    
    BTFSS   BOTON2
    GOTO    DIS1
    GOTO    DIS1.1
    
    BTFSS   BOTON
    GOTO    DIS1 
OTRA2 
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA2
    GOTO    DIS2
    
    
DIS2	
    MOVLW   TRES 
    MOVWF   LATD
    
    BTFSS   BOTON
    GOTO    DIS2
OTRA3 
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA3
    GOTO    DIS3  

DIS3	
    MOVLW   CUATRO 
    MOVWF   LATD
    
    BTFSS   BOTON
    GOTO    DIS3
OTRA4 
    CALL    DELAY_10MS
    BTFSC   BOTON
    GOTO    OTRA3
    GOTO    DIS3 

    
DIS1.1
    MOVLW   CERO
    MOVWF   LATD
    
    END 


