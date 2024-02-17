
;este programa realiza las opereciones entre el datoA y datoB
    
ORG 0
    
    DATO_A   EQU .15
    DATO_B   EQU .100
 
    SUMA 
	MOVLW DATO_A 
	ADDLW DATO_B
	
    RESTA
	MOVLW DATO_A
	SUBLW DATO_B
	
    MULTIPLICACION
	MOVLW DATO_A
	MULLW DATO_B
	
    AND
	MOVLW DATO_A
	ANDLW DATO_B
	
    OR
	MOVLW DATO_A
	IORLW DATO_B

    XOR
	MOVLW DATO_A
	XORLW DATO_B
	
	
	END 
	
	
    
    

