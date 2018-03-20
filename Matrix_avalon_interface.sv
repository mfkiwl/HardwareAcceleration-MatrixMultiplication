module Matrix_avalon_interface(clk, rst_n, 
	user_dataout_0,
	user_dataout_1,
	user_dataout_2,
	user_dataout_3,
	user_dataout_4,
	user_dataout_5,
	user_dataout_6,
	user_dataout_7,
	user_datain_0,
	user_datain_1,
	user_datain_2,
	user_datain_3,
	user_chipselect,
	user_byteenable,
	user_read,
	user_write);

//signals to coonnect to salve template
input clk, rst_n, user_read, user_write;
//, read, write;
//input [15:0] a11_import;
//input [15:0] a12_import;
//input [15:0] a21_import;
//input [15:0] a22_import;
//input [15:0] b11_import;
//input [15:0] b12_import;
//input [15:0] b21_import;
//input [15:0] b22_import;
//
//input [31:0] writedata;
//output [31:0] readdata;
//input [15:0] chipselect;
//input [3:0] byteenable;
//a11_import, a12_import, a21_import, a22_import, b11_import, b12_import, 
//b21_import,b22_import, writedata, readdata, c11_export, c12_export, c21_export, c22_export


//signal for exporting register contents outside embedded system
//output [31:0] c11_export;
//output [31:0] c12_export;
//output [31:0] c21_export;
//output [31:0] c22_export;
//  Read:  user_chipselect[x] AND user_read
//  Write:  user_chipselect[x] AND user_write AND user_byteenable

input [31:0] user_dataout_0;
input [31:0] user_dataout_1;
input [31:0] user_dataout_2;
input [31:0] user_dataout_3;
input [31:0] user_dataout_4;
input [31:0] user_dataout_5;
input [31:0] user_dataout_6;
input [31:0] user_dataout_7;
output [31:0] user_datain_0;
output [31:0] user_datain_1;
output [31:0] user_datain_2;
output [31:0] user_datain_3;
input [15:0] user_chipselect;
input [3:0] user_byteenable;




//defining local variables
wire [31:0] to_reg [0:7];
wire [31:0] from_reg [0:3];

assign to_reg[0] = (user_chipselect[0] & user_read) ? user_dataout_0 : 0;
assign to_reg[1] = (user_chipselect[1] & user_read) ? user_dataout_1 : 0;
assign to_reg[2] = (user_chipselect[2] & user_read) ? user_dataout_2 : 0;
assign to_reg[3] = (user_chipselect[3] & user_read) ? user_dataout_3 : 0;
assign to_reg[4] = (user_chipselect[4] & user_read) ? user_dataout_4 : 0;
assign to_reg[5] = (user_chipselect[5] & user_read) ? user_dataout_5 : 0;
assign to_reg[6] = (user_chipselect[6] & user_read) ? user_dataout_6 : 0;
assign to_reg[7] = (user_chipselect[7] & user_read) ? user_dataout_7 : 0;



Matrix U1 ( .clk(clk), .rst(rst_n), .a11(to_reg[0]), .a12(to_reg[1]), .a21(to_reg[2]),
 .a22(to_reg[3]), .b11(to_reg[4]), .b12(to_reg[5]), .b21(to_reg[6]), .b22(to_reg[7]),
.c11(from_reg[0]), .c12(from_reg[1]), .c21(from_reg[2]), .c22(from_reg[3]) ) ;


//assign readdata = from_reg;
assign user_datain_0 = (user_chipselect[8] & user_write & user_byteenable [1]) ? from_reg[0] : 0;
assign user_datain_1 = (user_chipselect[9] & user_write & user_byteenable [1]) ? from_reg[1] : 0;
assign user_datain_2 = (user_chipselect[10] & user_write & user_byteenable [1]) ? from_reg[2] : 0;
assign user_datain_3 = (user_chipselect[11] & user_write & user_byteenable [1]) ? from_reg[3] : 0;



endmodule
