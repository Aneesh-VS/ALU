module ALU_tb;

reg      [7:0] op1             ;                 
reg      [7:0] op2             ;                 
reg      [3:0] opcode          ;                 
reg            clock           ;
reg            resetn          ;                   
wire     [8:0] result          ;                 
wire           carry_flag      ;
wire           zero_flag       ;           

ALU dut ( op1, op2, opcode, clock, resetn, result, carry_flag, zero_flag );

task simulate ( input [3:0] operational_code ); 
	begin
		op1       = 8'b10111010         ;
		op2       = 8'b10101011         ;
		#10 clock = 1'b0                ; 
		#10 clock = 1'b1                ;
		opcode    = operational_code    ;
	end
endtask
initial begin
	resetn = 1'b1                           ;
	#10 resetn = 1'b0                       ;
	simulate ( 4'b0000 )			;
	simulate ( 4'b0001 )			;
	simulate ( 4'b0010 )			;
	simulate ( 4'b0011 )			;
	simulate ( 4'b0100 )			;
	simulate ( 4'b0101 )			;
	simulate ( 4'b0110 )			;
	simulate ( 4'b0111 )			;	
	simulate ( 4'b1000 )			;
	simulate ( 4'b1001 )			;
	simulate ( 4'b1010 )			;
	simulate ( 4'b1011 )			;
	simulate ( 4'b1100 )			;
	simulate ( 4'b1101 )			;
	simulate ( 4'b1110 )			;
	simulate ( 4'b1111 )			;
end
endmodule 