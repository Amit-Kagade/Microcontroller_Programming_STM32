    AREA mycode, CODE, READONLY  ; Define a code section called 'mycode'
    ENTRY                          ; Define the entry point for the program
    EXPORT start                   ; Export the 'start' procedure

start PROC                       ; Start of the procedure
    LDR R0, =0x2200001C         ; Load the address 0x2200001C into R0
    MOV R1, #1                  ; Load the immediate value 1 into R1
    STR R1, [R0]                ; Store the value in R1 into the address pointed by R0

    B .                         ; Infinite loop (stay here indefinitely)
    ENDP                            ; End of procedure
    END                             ; End of the assembly file
