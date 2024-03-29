    ;PROGRAMA RESTADOR DE 2 NUMERO DE 3 BITS QUE INGRESAN EN PA Y EL RESULTADO SE MUESTRA EN PB
    #INCLUDE <P18F4455.INC>
    
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
    CLRF LATB;
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
    subwf N1,W;RESTA EL VALOR DE N1 Y W. N1=7 Y W=7
    MOVWF LATB; MUEVE EL VALOR DE W A LATB. LATB=0
    GOTO MAIN; VUELVE A MAIN. SE HACE UN CICLO
    END



