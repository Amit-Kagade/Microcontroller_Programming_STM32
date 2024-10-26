	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT start
		
start	PROC
	
	MOV R0,#0X7FFFFFFF
	MOV R1,#0X00000001
	MOV R2,#0X80000000
	MOV R3,#1
	
	BL addnum
	BL subnum
	B	.
	
addnum PROC
	ADDS R4, R0, R1
	BVS addition_overflow
	ENDP
		
subnum PROC
	SUBS R5, R2, R3
	BVS subtraction_overflow
	ENDP
		
addition_overflow PROC
	MOV R4,#0XFFFFFFFF
	BX LR
	ENDP
	
	
subtraction_overflow PROC
	MOV R5,#0XFFFFFFFF
	ENDP
	BX LR
	B	.
ENDP
	END