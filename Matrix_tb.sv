module Matrix_tb(); //test bench for bomb' pattern detector

reg clk, rst;
reg [15:0] a11, a12, a21, a22, b11, b12, b21, b22;
reg [31:0] c11, c12, c21, c22;
reg [1:0] current_state, next_state; 

Matrix DUT(clk, rst, a11, a12, a21, a22, b11, b12, b21, b22, c11, c12, c21, c22); //device under test


initial clk=0;
always #5 clk = ~clk;

initial
	begin
		#10 rst = 1'b0;
		#10 rst = 1'b1;

a11= 16'h0001;   //input values to the 8-input registers
a12= 16'h0002;
a21= 16'h0003;
a22= 16'h0004;
b11= 16'h0005;
b12= 16'h0006;
b21= 16'h0007;
b22= 16'h0008;  
#100
rst = 1'b0;           // to showcase how the output remains zero when reset is high
#50 rst = 1'b1;    //lowering the reset
#10
a11= 16'h0001;
a12= 16'h0002;
a21= 16'h0003;
a22= 16'h0004;
b11= 16'h0005;
b12= 16'h0006;
b21= 16'h0007;
b22= 16'h0000;  //last bit kept zero to check if the FSM changes states when b22=0
#100



		
		$finish;
	end
always @(posedge clk)
#1 $display("At current_state=%b next_state=%b clk=%b rst=%b c11=%h c12=%h c21=%h c22=%h" ,current_state, next_state, clk, rst, c11, c12, c21, c22);
endmodule
