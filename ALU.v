module ALU 
       (
       input       [7:0] op1,
       input       [7:0] op2,                         
       input       [3:0] Opcode,                           
       input  	         Clock,
       input             Resetn,                          
       output reg  [8:0] Result,                           
       output reg        Carry_Flag, 
       output reg        Zero_Flag                  
       ) ;
always@(posedge Clock or negedge Resetn) 
	case(Opcode)
		4'b0000 : Result = op1 - 1         ; // decrement operator
		4'b0001 : Result = op1 >> 1        ; // right shift 
		4'b0010 : Result = op1 << 1        ; // left shift
		4'b0011 : Result = ~ (op1 | op2)   ; // bitwise NOR
		4'b0100 : Result = ~ (op1 & op2)   ; // bitwise NAND
		4'b0101 : Result = ~ (op1 ^ op2)   ; // bitwise XNOR
		4'b0110 : Result = op1 == op2      ; // compare equality
	        4'b0111 : Result = op1 < op2       ; // compare smaller than equality
                4'b1000 : Result = op1 > op2       ; // compare greater than equality	
		4'b1001 : Result = op1 |  op2      ; // bitwise OR
		4'b1010 : Result = op1 &  op2      ; // bitwise AND
		4'b1011 : Result = op1 ^  op2      ; // bitwise XOR
		4'b1100 : Result = op1 + 1         ; // increment operator
		4'b1101 : Result = op1 + op2       ; // addition
		4'b1110 : Result = op1 - op2       ; // subtraction
                4'b1111 : Result = op1 / op2       ; // divider 
		default : Result = 9'Bzzzzzzzzz    ; 
	endcase

	always@(*) begin
		if ( Result[8] == 1'b1 ) begin
			Carry_Flag = 1'b1          ;
			Zero_Flag  = 1'b0          ;
		end 
		else if ( Result == 9'd0) begin 
			Zero_Flag  = 1'b1          ;
		        Carry_Flag = 1'b0          ;
		end
		else begin 
			Carry_Flag = 1'b0          ;
			Zero_Flag  = 1'b0          ;
		end 
	end
endmodule 
