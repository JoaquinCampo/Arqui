C_NUM equ 1
C_PORT equ 2
C_LOG equ 3
C_TOP equ 4
C_DUMP equ 5
C_DUP equ 6
C_SWAP equ 7
C_NEG equ 8
C_FACT equ 9
C_SUM equ 10
C_SUMA equ 11
C_RESTA equ 12
C_MULT equ 13
C_DIV equ 14
C_MOD equ 15
C_AND equ 16
C_OR equ 17
C_SAL equ 18
C_SAR equ 19
C_CLS equ 254
C_HALT equ 255



.data
#define ES 3000h

ENTRADA equ 10								; entrada default es 10
PUERTO_SALIDA_DEFECTO equ 1		    		; salida default es 12
PUERTO_LOG_DEFECTO equ 2					; log default es 14
max_lugar_memoria equ 62 					

puerto_salida dw PUERTO_SALIDA_DEFECTO		; puerto salida comienza en default
puerto_bitacora dw PUERTO_LOG_DEFECTO		; puerto log comienza en default

.code

push AX										; guardamos la info de AX y SI
push SI										; usaremos a SI como el tope actual
xor SI , SI									; SI comienza en 0

Leer:
; ----- indica el comienzo de la ejecucion
push AX
push DX
xor AX , AX									
mov DX , [puerto_bitacora]					; indica que comienza a ejecutarse el programa
out DX , AX					
pop DX
pop AX
; ----------

push AX										
in AX , ENTRADA								; leo en AX desde el puerto de entrada

cmp AX , 1									; caso 1
JNE SIG2
; ----- 									indico el comienzo de la operacion 1
push AX
push DX
mov AX , 1
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Num
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 1 

SIG2:

cmp AX , 2									; caso 2
JNE SIG3
; ----- 									indico el comienzo de la operacion 2
push AX
push DX
mov AX , 2
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Puerto
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 2 

SIG3:

cmp AX , 3									; caso 3
JNE SIG4
; ----- 									indico el comienzo de la operacion 3
push AX
push DX
mov AX , 3
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call PuertoLog
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 3 

SIG4:

cmp AX , 4									; caso 4
JNE SIG5
; ----- 									indico el comienzo de la operacion 4
push AX
push DX
mov AX , 4
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Top
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 4

SIG5: 

cmp AX , 5									; caso 5
JNE SIG6
; ----- 									indico el comienzo de la operacion 5
push AX
push DX
mov AX , 5
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Dump
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 5 

SIG6: 

cmp AX , 6									; caso 6
JNE SIG7
; ----- 									indico el comienzo de la operacion 6
push AX
push DX
mov AX , 6
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Duplicar
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 6

SIG7: 

cmp AX , 7									; caso 7
JNE SIG8
; ----- 									indico el comienzo de la operacion 7
push AX
push DX
mov AX , 7
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call SWAP
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 7

SIG8: 

cmp AX , 8									; caso 8
JNE SIG9
; ----- 									indico el comienzo de la operacion 8
push AX
push DX
mov AX , 8
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Negativo
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 8

SIG9: 

cmp AX , 9									; caso 9
JNE SIG10
; ----- 									indico el comienzo de la operacion 9
push AX
push DX
mov AX , 9
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

cmp SI , 0
JE no_elems1								; si no hay elementos no tiene con que calcular el factorial

push AX
push BX
push CX
mov AX , ES : [SI - 2]						; guardo en AX el tope de la pila
call Fact
mov ES : [SI - 2] , BX						; guardo el resultado en el tope de la pila
pop CX
pop BX
pop AX

push AX
push DX
mov AX , 16								    ; la operacion se realizo con exito
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX				
JMP Leer

no_elems1:

push AX
push DX
mov AX , 8							        ; la operacion fallo por falta de operandos en la pila
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX						
 
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 9

SIG10: 

cmp AX , 10									; caso 10
JNE SIG11
; ----- 									indico el comienzo de la operacion 10
push AX
push DX
mov AX , 10
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Sum
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 10

SIG11: 

cmp AX , 11									; caso 11
JNE SIG12
; ----- 									indico el comienzo de la operacion 11
push AX
push DX
mov AX , 11
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Suma
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 11

SIG12: 

cmp AX , 12									; caso 12
JNE SIG13
; ----- 									indico el comienzo de la operacion 12
push AX
push DX
mov AX , 12
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Resta
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 12       

SIG13: 

cmp AX , 13									; caso 13
JNE SIG14
; ----- 									indico el comienzo de la operacion 13
push AX
push DX
mov AX , 13
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Multiplicacion
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 13

SIG14: 

cmp AX , 14									; caso 14
JNE SIG15
; ----- 									indico el comienzo de la operacion 14
push AX
push DX
mov AX , 14
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Division
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 14

SIG15: 

cmp AX , 15									; caso 15
JNE SIG16
; ----- 									indico el comienzo de la operacion 15
push AX
push DX
mov AX , 15
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Modulo
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 15 

SIG16: 

cmp AX , 16									; caso 16
JNE SIG17
; ----- 									indico el comienzo de la operacion 16
push AX
push DX
mov AX , 16
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call andBit
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 16

SIG17: 

cmp AX , 17									; caso 17
JNE SIG18
; ----- 									indico el comienzo de la operacion 17
push AX
push DX
mov AX , 17
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call orBit
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 17

SIG18: 

cmp AX , 18									; caso 18
JNE SIG19
; ----- 									indico el comienzo de la operacion 18
push AX
push DX
mov AX , 18
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call ShiftL
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 18

SIG19: 

cmp AX , 19									; caso 19
JNE SIG254
; ----- 									indico el comienzo de la operacion 19
push AX
push DX
mov AX , 19
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call ShiftR
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 19

SIG254: 

cmp AX , 254								; caso 254
JNE SIG255
; ----- 									indico el comienzo de la operacion 254
push AX
push DX
mov AX , 254
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

call Clear
pop AX
JMP Leer 									; indica que termino de ejecutar la operacion 254

SIG255: 

cmp AX , 255								; caso 255
JNE SIGERR
; ----- 									indico el comienzo de la operacion 255
push AX
push DX
mov AX , 255
mov DX , [puerto_bitacora]
out DX , AX					
pop DX
pop AX

push AX
push DX
mov AX , 16								  	; indica que la operacion se realizo con exito
mov DX , [puerto_bitacora]
out DX , AX				
pop DX
pop AX

AFUERA:
JMP AFUERA

SIGERR: 
push AX
push DX
mov DX , [puerto_bitacora]
out DX , AX				
mov AX , 2									; comando no reconocido
out DX , AX					
pop DX
pop AX
JMP Leer

Num proc
push AX
in AX , ENTRADA 							; leo en AX el numero a agregar a la pila
cmp SI , max_lugar_memoria

JE noAgrega 								; si la pila esta llena no agrega el elemento
mov ES : [SI] , AX
add SI , 2 									; aumenta el tope
push AX
push DX
mov DX , [puerto_bitacora]			
out DX , AX									; muestra el numero a agregar
mov AX , 16								    		
out DX , AX									; indica que la operacion se realizo con exito
pop DX
pop AX	
JMP endNum

noAgrega:
push AX
push DX								    
mov DX , [puerto_bitacora]  				; la operacion fallo por desboradmiento de pila
out DX , AX					
mov AX , 4
out DX , AX
pop DX
pop AX										

endNum:
pop AX

ret
Num endp

Puerto proc
push AX
in AX , ENTRADA
mov [puerto_salida] , AX					; actualizamos el puerto de salida


push AX
push DX
mov DX , [puerto_bitacora]
out DX , AX									; muestra cual es el puerto 
mov AX , 16									; indica que la operacion se realizo con exito
out DX , AX
pop DX
pop AX										 
pop AX
ret
Puerto endp

PuertoLog proc
push AX
in AX , ENTRADA								; leo en AX desde el puerto de entrada

push AX
push DX
mov DX , [puerto_bitacora]					
out DX , AX									; muestra cual es el puerto
mov [puerto_bitacora], AX
mov DX , [puerto_bitacora]	
mov AX , 16								    
out DX , AX									; indica que la operacion se realizo con exito
pop DX   
pop AX									   
pop AX
ret
PuertoLog endp

Top proc
cmp SI , 0

JE no_elems									; si no hay elementos en la pila no se puede mostrar el tope
push AX
push DX
mov AX , ES : [SI - 2]
mov DX , [puerto_salida]					
out DX , AX									; muestra el tope en la salida
pop DX
pop AX

push AX
push DX
mov AX , 16								  
mov DX , [puerto_bitacora]					; indica que la operacion se realizo con exito
out DX , AX					
pop DX
pop AX	 					 

JMP endTop

no_elems:

push AX
push DX
mov AX , 8 							  
mov DX , [puerto_bitacora]					 ; la operacion fallo por falta de operandos en la pila
out DX , AX					
pop DX
pop AX

endTop:
ret
Top endp

Dump proc
push SI										; guardo el desplazamiento del tope
push AX
push DX

while:
cmp SI , 0

JE endDUMP									; mientras que no haya recorrido toda la pila
mov AX , ES : [SI - 2]
mov DX , [puerto_salida]
out DX , AX
sub SI , 2
JMP while

endDUMP:
mov AX , 16									; indica el comienzo de la operacion 1
mov DX , [puerto_bitacora]
out DX , AX					

pop DX
pop AX
pop SI
ret
Dump endp

Duplicar proc
push AX
push DX

cmp SI , max_lugar_memoria
JE endDuplicar_lleno 							; si la pila esta llena no duplica el tope

cmp SI , 0
JE endDuplicar_vacio 							; si la pila esta vacia no tiene que duplicar

dup (1) ES : [SI - 2]
add SI , 2

mov AX , 16								  		; indica que la operacion se realizo con exito
mov DX , [puerto_bitacora]
out DX , AX					 						
JMP endDuplicar

endDuplicar_vacio:
mov AX , 8							  			; la operacion fallo por falta de operandos en la pila
mov DX , [puerto_bitacora]
out DX , AX
JMP endDuplicar

endDuplicar_lleno:
mov AX , 4							  
mov DX , [puerto_bitacora]						; la operacion fallo por desbordamiento de la pila
out DX , AX						

endDuplicar:
pop DX
pop AX
ret
Duplicar endp

SWAP proc
push AX
push DX

cmp SI , 2 
JLE pocosElem 									; si hay menos de dos operandos en la pila

push BX
mov AX , ES : [SI - 2]							; intercambio el tope de la pila con el anterior
mov BX , ES : [SI - 4]							
mov ES : [SI - 2] , BX
mov ES : [SI - 4] , AX
pop BX

mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX											
JMP endSWAP

pocosElem:
mov AX , 8 							
mov DX , [puerto_bitacora]						; la operacion fallo por falta de operandos en la pila
out DX , AX					
xor SI , SI										; vaciamos la pila			
endSWAP:
pop DX
pop AX
ret
SWAP endp

Negativo proc
push AX
push DX

cmp SI , 0
JE noElems

mov AX , ES : [SI - 2]
neg AX
mov ES : [SI - 2] , AX

mov AX , 16								  
mov DX , [puerto_bitacora]					    ; indica que la operacion se realizo con exito
out DX , AX									
JMP endNegativo

noElems:
mov AX , 8								    	; la operacion fallo por falta de operandos en la pila 
mov DX , [puerto_bitacora]
out DX , AX					

endNegativo:
pop DX
pop AX
ret
Negativo endp

Fact proc
cmp AX , 0 										; comparo el tope de la pila con 0
JE esCero

dec AX											; ajusto parametro para la invocacion
call Fact										; llamada recursiva
inc AX
mov CX , AX										; guardo AX pues mul lo modifica
mul BX											; calculo el paso recursivo
mov BX , AX										; asigno el resultado del paso recursivo
mov AX, CX										; restauro AX
JMP FIN
esCero:
mov BX , 1										; asigno el resultado del paso base
FIN:
ret
Fact endp

Sum proc

push AX
xor AX , AX 									; AX es el contador de la suma

while2:
cmp SI , 0										; mientras que no se haya recorrido toda la pila
JE finWhile

add AX , ES : [SI - 2]							; guardamos en AX la suma de los operandos
sub SI , 2										; acualizamos el tope
JMP while2

finWhile:
mov SI , 2										; seteamos el desplazamiento en 2 (osea hay un elemento solo)
mov ES : [SI - 2] , AX							; ponemos la suma en el tope
pop AX
push AX
push DX
mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX					
pop DX
pop AX
	 						
ret
Sum endp

Suma proc

push AX

cmp SI , 2
JNG pocosOperandos								; si no hay por lo menos dos operandos salta al end

mov AX , ES : [SI - 2]							; guarda el contenido de la cima en AX
add ES : [SI - 4] , AX							; realiza la suma y la guarda en el nuevo tope
sub SI , 2										; actualiza el tope
push AX
push DX
mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX					
pop DX
pop AX						
JMP endSuma

pocosOperandos:
push AX
push DX
mov AX , 8								  	
mov DX , [puerto_bitacora]						; la operacion fallo por falta de operandos en la pila
out DX , AX					
pop DX
pop AX						
xor SI , SI										; vaciamos la pila

endSuma:
pop AX
ret
Suma endp

Resta proc
push AX
push DX 	
cmp SI , 2

JNG pocos_Operandos								; si no hay por lo menos dos operandos salta al end
mov AX , ES : [SI - 2]	
sub ES : [SI - 4] , AX							; realiza la resta y la guarda en el nuevo tope
sub SI , 2										; actualiza el tope

mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX											
JMP endResta

pocos_Operandos:
mov AX , 8							  
mov DX , [puerto_bitacora]						; la operacion fallo por falta de operandos en la pila
out DX , AX					
xor SI , SI										; vaciamos la pila SI = 0

endResta:
pop DX
pop AX
ret
Resta endp

Multiplicacion proc
push AX											; guardamos el contenido de AX y CX. Es necesario guardar DX ya que la instruccion
push CX											; mul modifica DX (guarda la parte alta del resultado de 32 bits en DX)
push DX

cmp SI , 2
JNG noHayElems


mov AX , ES : [SI - 4]							
mov CX , ES : [SI - 2]
imul CX											; AX = AX * CX (tiene en cuenta el signo)
mov ES : [SI - 4] , AX							; guardamos el resultado en el tope
sub SI , 2 

mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX					
JMP endMultiplicacion

noHayElems:
mov AX , 8						  
mov DX , [puerto_bitacora]						; la operacion fallo por falta de operandos en la pila
out DX , AX						
xor SI , SI										; vaciamos la pila, SI = 0

endMultiplicacion:
pop DX
pop CX
pop AX
ret
Multiplicacion endp

Division proc
push AX
push CX
push DX

cmp SI , 2
JNG faltaGente									; si no hay al menos dos operandos no se puede ejecutar la operacion

mov AX , ES : [SI - 4]
mov CX , ES : [SI - 2]

cmp CX , 0
JE finish										; si el divisor es igual a 0 la division no esta definida

cmp AX , 0
JNGE dividendoNeg								; si el dividendo no es negativo

mov DX , 0000h									; guardamos 0000h en DX
JMP operacion

dividendoNeg:
mov DX , 0xffff									; si el dividendo es negativo tenemos que guardar 0xffff en DX

operacion:
idiv CX											; AX = AX / CX
sub SI , 2										; actualizamos el tope
mov ES : [SI - 2] , AX							; guardo en el tope el resultado de la division

mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX								
JMP finish

faltaGente:
mov AX , 8								  
mov DX , [puerto_bitacora]						; la operacion fallo por falta de operandos en la pila
out DX , AX									
xor SI , SI										; vaciamos la pila

finish:
pop DX
pop CX
pop AX
ret
Division endp

Modulo proc
push AX
push CX
push DX

cmp SI , 2
JNG faltaGente1									; si no hay al menos dos operandos no se puede ejecutar la operacion

mov AX , ES : [SI - 4]
mov CX , ES : [SI - 2]

cmp CX , 0
JE finish2										; si el divisor es igual a 0 la division no esta definida

cmp AX , 0
JNGE dividendoNeg1								; si el dividendo no es negativo

mov DX , 0000h									; guardamos 0000h en DX
JMP operacion3

dividendoNeg1:
mov DX , 0xffff									; si el dividendo es negativo tenemos que guardar 0xffff en DX

operacion3:
idiv CX											; AX = AX / CX
sub SI , 2										; actualizamos el tope
mov ES : [SI - 2] , DX							; guardo en el tope el resultado de la division

mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX								
JMP finish2

faltaGente1:
mov AX , 8								  
mov DX , [puerto_bitacora]						; la operacion fallo por falta de operandos en la pila
out DX , AX									
xor SI , SI										; vaciamos la pila

finish2:
pop DX
pop CX
pop AX
ret
Modulo endp

andBit proc
push AX
push BX
push DX

cmp SI , 2
JNG faltanElementos

mov AX , ES : [SI - 2]
mov BX , ES : [SI - 4]
and AX , BX										; realizo el and bit a bit
sub SI , 2										; actualizo el tope
mov ES : [SI - 2] , AX							; guardo el resultado en el tope

mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX					
JMP final2

faltanElementos:
mov AX , 8 							  
mov DX , [puerto_bitacora]
out DX , AX										; la operacion fallo por falta de operandos en la pila
xor SI , SI 									; vaciamos la pila

final2:
pop DX
pop BX
pop AX
ret
andBit endp

orBit proc
push AX
push BX
push DX

cmp SI , 2
JNG faltanElementos2

mov AX , ES : [SI - 2]
mov BX , ES : [SI - 4]
or AX , BX										; realizo el and bit a bit
sub SI , 2										; actualizo el tope
mov ES : [SI - 2] , AX							; guardo el resultado en el tope

mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX					
JMP final3

faltanElementos2:
mov AX , 8 							  
mov DX , [puerto_bitacora]
out DX , AX										; la operacion fallo por falta de operandos en la pila
xor SI , SI 									; vaciamos la pila

final3:
pop DX
pop BX
pop AX
ret
orBit endp

ShiftL proc
push AX
push BX
push DX

cmp SI , 2
JNG pocosOperandos1								; si no hay por lo menos dos operandos salta al end

mov AX , ES : [SI - 2]							; en AX esta la cantidad de veces que tenemos que shiftear BX hacia la izquierda
mov BX , ES : [SI - 4] 

while_shiftL:
cmp AX , 0						
JE quedo_shifteadoL								; mientras que no se baya shifteado las veces necesarias se sigue sifhteando 1 lugar

sal BX , 1										
dec AX											; atualiza la veces restantes a shiftear
JMP while_shiftL

quedo_shifteadoL:
mov ES : [SI - 4] , BX
sub SI , 2

mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX						
JMP endSal

pocosOperandos1:
mov AX , 8								  	
mov DX , [puerto_bitacora]						; la operacion fallo por falta de operandos en la pila
out DX , AX											
xor SI , SI										; vaciamos la pila

endSal:
pop DX
pop BX
pop AX
ret
ShiftL endp

ShiftR proc
push AX
push BX
push DX

cmp SI , 2
JNG pocosOperandos2								; si no hay por lo menos dos operandos salta al end

mov AX , ES : [SI - 2]							; en AX esta la cantidad de veces que tenemos que shiftear BX hacia la izquierda
mov BX , ES : [SI - 4] 

while_shiftR:
cmp AX , 0						
JE quedo_shifteadoL								; mientras que no se baya shifteado las veces necesarias se sigue sifhteando 1 lugar

sar BX , 1										
dec AX											; atualiza la veces restantes a shiftear
JMP while_shiftR

quedo_shifteadoR:
mov ES : [SI - 4] , BX
sub SI , 2

mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX						
JMP endSar

pocosOperandos2:
mov AX , 8								  	
mov DX , [puerto_bitacora]						; la operacion fallo por falta de operandos en la pila
out DX , AX											
xor SI , SI										; vaciamos la pila

endSar:
pop DX
pop BX
pop AX
ret
ShiftR endp

Clear proc
xor SI , SI 									; vaciamos la pila
push AX
push DX
mov AX , 16								  
mov DX , [puerto_bitacora]						; la operacion se realizo con exito
out DX , AX						
pop DX
pop AX
ret
Clear endp

.ports
10: C_NUM,1, C_NUM,2, C_NUM,3, C_FACT, C_DUMP, C_PORT,3, C_FACT, C_DUMP, C_LOG,4, C_SWAP, C_FACT, C_DUMP, 999, -999, C_PORT,5, C_DUMP, C_CLS, C_NUM,-6, C_NUM,2, C_DIV, C_TOP, C_NUM,-2, C_MULT, C_TOP, C_HALT
