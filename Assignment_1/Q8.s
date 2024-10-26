        AREA mycode,CODE,READONLY
	
        EXPORT start
		
start   PROC
        LDR R0,=0x12345678          ; Load immediate value into R0
	 
        MOV R1,R0                   ; Move R0 to R1
        REV R2,R1                   ; Reverse byte order of R1 into R2
        LDR R3,=0xFFFF0000           ; Load mask into R3
        AND R1,R2,R3                ; AND R2 with the mask in R3 into R1
	 
        LDR R3,=0x0000FFFF           ; Load lower mask
        AND R4,R3,R2                ; AND R2 with the lower mask into R4
        LDR R3,=0x0000000F           ; Load nibble mask
        AND R2,R2,R3                ; AND R2 with nibble mask
        LSL R3,R2,#12               ; Left shift by 12
	 
        LDR R5,=0x000000F0           ; Load another mask
        AND R2,R5,R4                ; AND with R4
        LSL R2,R2,#4                ; Left shift by 4
        ORR R3,R2,R3                ; OR with result in R3
	 
        LDR R5,=0x00000F00           ; Load another mask
        AND R2,R5,R4                ; AND with R4
        LSR R2,R2,#4                ; Right shift by 4
        ORR R3,R2,R3                ; OR with result in R3
	 
        LDR R5,=0x0000F000           ; Load another mask
        AND R2,R5,R4                ; AND with R4
        LSR R2,R2,#12               ; Right shift by 12
        ORR R3,R2,R3                ; OR with result in R3
	 
        MOV R2,R3                   ; Move result to R2

        B .                         ; Infinite loop (halt)

        ENDP                        ; End of the start procedure
        END                         ; End of file
