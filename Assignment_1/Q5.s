        AREA UCODE, CODE, READONLY
        ENTRY
        EXPORT start

start   PROC
        LDR R0,=0x7FFFFFFF    ; Load large constant to R0
        LDR R1,=0x10000000    ; Load constant to R1

        BL subroutine1        ; Call subroutine1
        BL subroutine2        ; Call subroutine2
		B    .                ; Infinite loop (make sure this is intentional)

        ENDP

subroutine1 PROC
        ADDS R2, R0, R1       ; Add R0 and R1, result in R2
		BX LR
        ENDP

subroutine2 PROC
	    SUBS R3, R0, R1
		BX LR
       

        ENDP

END                   ; End of program (lowercase 'end')