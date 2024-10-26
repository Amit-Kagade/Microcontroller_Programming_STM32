        AREA mycode, CODE, READONLY
        ENTRY
        EXPORT start
        
start   PROC
        ; Set the Process Stack Pointer (PSP) to the specified address
        MOV R0, #0x20002000       ; Load the address into R0
        MSR PSP, R0               ; Move the value of R0 into the PSP register

        ; Set the CONTROL register to use the PSP
        MRS R0, CONTROL           ; Move the current value of CONTROL into R0
        ORR R0, R0, #1           ; Set bit 0 to use the PSP
        ORR R0, R0, #2           ; Set bit 1 to enable unprivileged access
        MSR CONTROL, R0          ; Move the modified value back to CONTROL

        ISB                       ; Instruction Synchronization Barrier

        BX LR                     ; Return from the procedure
        ENDP                     ; End of procedure
        END                       ; End of the assembly file
