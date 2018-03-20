module Matrix(clk, rst, a11, a12, a21, a22, b11, b12, b21, b22, c11, c12, c21, c22);
 
//defining inputs and outputs//
input clk, rst;
input [15:0] a11, a12, a21, a22, b11, b12, b21, b22; //8 16-bit words from memory--input
output reg [31:0] c11, c12, c21, c22; //4 32-bit words to memory---output

reg [1:0] current_state, next_state; //state registers

//states and their names with values
parameter [1:0] IDLE     = 2'b00;
parameter [1:0] MULTIPLY = 2'b01;
parameter [1:0] DONE     = 2'b10;
parameter [1:0] DEFAULT  = 2'b11;

//first sequential block of three-always coding style
always_ff @ (posedge clk or negedge rst) //at clk or rst
begin
	if (!rst)                             //if rst is high, go to IDLE state
		current_state <= IDLE;
	else
		current_state <= next_state;  // or else continue with the next state
end


//combinatorial block
always_comb
begin
	next_state = 2'b00;

		case (current_state)
			IDLE 		: if ( b22 == 0) next_state = IDLE; //checks for the last input register to be loaded into the system
						  else next_state = MULTIPLY;       //if its not zero, the matrix multiplication occurs
			MULTIPLY : next_state = DONE;
			DONE		: next_state = IDLE;
			DEFAULT  : next_state = IDLE;
		endcase
end


//2nd sequential block
always_ff @(posedge clk)
begin
if(!rst) begin
c11 <= 0;
c12 <= 0;
c21 <= 0;
c22 <= 0;
end
else begin
c11 <= 0;
c12 <= 0;
c21 <= 0;
c22 <= 0;

	case (next_state)
//		IDLE:
//		begin
//		c11 <= 0;
//		c12 <= 0;
//		c21 <= 0;
//		c22 <= 0;
//		end
		MULTIPLY : 
		begin
		c11 <= (a11*b11)+(a12*b21); //code for matrix multiplication for 2*2 multiplication
		c12 <= (a11*b12)+(a12*b22);
		c21 <= (a21*b11)+(a22*b21);
		c22 <= (a21*b12)+(a22*b22);
		end
//		DONE:
//		begin
//		c11 <= 1;    //not necessary to keep it “1” but it is just to show that
//		c12 <= 1;   // how switching between states affects the output
//		c21 <= 1;
//		c22 <= 1;
//		end
		

	endcase
end
end
endmodule
