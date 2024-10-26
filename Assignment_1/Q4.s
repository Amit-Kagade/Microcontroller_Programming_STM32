	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT start
		
start PROC
	
	LDR R0,=0X12345678
	LDR R1,=0X87654321
	
	BL addnum
	BL subnum
	B	.
	
addnum PROC
	ADDS R2, R0, R1
	BX LR
	ENDP
		
subnum PROC
	SUBS R3, R1, R0
	BX LR
	ENDP

ENDP
	END
