		AREA mycode, CODE, READONLY
		EXPORT start
			
start
	LDR R0, =0x20005000
	MOV SP, R0
	LDR R1, =0x20006000
	MSR PSP, R1
	
	MOV R0, #0x01
	MOV R1, #0x02
	MOV R2, #0x03
	MOV R3, #0x04
	MOV R4, #0x05
	MOV R5, #0x06
	
	PUSH {R0-R5, LR}
	MRS R6, PSR
	PUSH {R6}
	
	POP {R7-R12}
	POP {R14}
	POP {R6}
	MSR PSR, R6
	
	B	.
	
	END