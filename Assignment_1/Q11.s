        AREA mycode,CODE,READONLY
		ENTRY
		EXPORT start
			
start  PROC
       MOV R0,#8
	   CMP R0,#0
	   
	   IT GT
	   MOVGT R1,#5
	   
	   IT LT
	   MOVLT R1,#1
	   
	   IT EQ
	   MOVEQ R1,#9
	   
	   B .
	   ENDP
		   END