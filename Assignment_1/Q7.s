	AREA mycode,CODE,READWRITE
	
	EXPORT start
		
string
       DCB "hello world",0
	
start PROC
     LDR R0, = string
	 LDRB R1,[R0]
	 
convert_loop	 
	 CMP R1,#0
	 BEQ end_conversion
	 
	 CMP R1,#'a'
	 BLT next_char
	 
	 CMP R1,#'z'
	 BGT next_char
	 
	
	 SUB R1,R1,#32
	 STRB R1,[R0]
	 
	 ADD R0,R0,#1
	 LDRB R1,[R0]
	 B convert_loop
	
	 ENDP

next_char	PROC
	 STRB R1,[R0]
     ADD R0,R0,#1
	 LDRB R1,[R0]
     B convert_loop
	 ENDP
		 
end_conversion PROC
    
	 BX LR
		 
     ENDP