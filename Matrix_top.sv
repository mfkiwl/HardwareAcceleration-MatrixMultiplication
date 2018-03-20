module Matrix_top(CLOCK_50, KEY, HEX0, HEX1, HEX2, HEX3);


input CLOCK_50;
input [0:0] KEY;
output [0:6] HEX0, HEX1, HEX2, HEX3;


wire [31:0] to_HEX_0;
wire [31:0] to_HEX_1;
wire [31:0] to_HEX_2;
wire [31:0] to_HEX_3;


    Matrix_new u0 (
        .clk_clk                   (CLOCK_50),                   //            clk.clk
//        .memory_mem_a              (<connected-to-memory_mem_a>),              //         memory.mem_a
//        .memory_mem_ba             (<connected-to-memory_mem_ba>),             //               .mem_ba
//        .memory_mem_ck             (<connected-to-memory_mem_ck>),             //               .mem_ck
//        .memory_mem_ck_n           (<connected-to-memory_mem_ck_n>),           //               .mem_ck_n
//        .memory_mem_cke            (<connected-to-memory_mem_cke>),            //               .mem_cke
//        .memory_mem_cs_n           (<connected-to-memory_mem_cs_n>),           //               .mem_cs_n
//        .memory_mem_ras_n          (<connected-to-memory_mem_ras_n>),          //               .mem_ras_n
//        .memory_mem_cas_n          (<connected-to-memory_mem_cas_n>),          //               .mem_cas_n
//        .memory_mem_we_n           (<connected-to-memory_mem_we_n>),           //               .mem_we_n
//        .memory_mem_reset_n        (<connected-to-memory_mem_reset_n>),        //               .mem_reset_n
//        .memory_mem_dq             (<connected-to-memory_mem_dq>),             //               .mem_dq
//        .memory_mem_dqs            (<connected-to-memory_mem_dqs>),            //               .mem_dqs
//        .memory_mem_dqs_n          (<connected-to-memory_mem_dqs_n>),          //               .mem_dqs_n
//        .memory_mem_odt            (<connected-to-memory_mem_odt>),            //               .mem_odt
//        .memory_mem_dm             (<connected-to-memory_mem_dm>),             //               .mem_dm
//        .memory_oct_rzqin          (<connected-to-memory_oct_rzqin>),          //               .oct_rzqin
        .reset_reset_n             (KEY[0]),             //          reset.reset_n
//        .slave_template_dataout_0  (<connected-to-slave_template_dataout_0>),  // slave_template.dataout_0
//        .slave_template_dataout_1  (<connected-to-slave_template_dataout_1>),  //               .dataout_1
//        .slave_template_dataout_2  (<connected-to-slave_template_dataout_2>),  //               .dataout_2
//        .slave_template_dataout_3  (<connected-to-slave_template_dataout_3>),  //               .dataout_3
//        .slave_template_dataout_4  (<connected-to-slave_template_dataout_4>),  //               .dataout_4
//        .slave_template_dataout_5  (<connected-to-slave_template_dataout_5>),  //               .dataout_5
//        .slave_template_dataout_6  (<connected-to-slave_template_dataout_6>),  //               .dataout_6
//        .slave_template_dataout_7  (<connected-to-slave_template_dataout_7>),  //               .dataout_7
//        .slave_template_dataout_8  (<connected-to-slave_template_dataout_8>),  //               .dataout_8
//        .slave_template_dataout_9  (<connected-to-slave_template_dataout_9>),  //               .dataout_9
//        .slave_template_dataout_10 (<connected-to-slave_template_dataout_10>), //               .dataout_10
//        .slave_template_dataout_11 (<connected-to-slave_template_dataout_11>), //               .dataout_11
//        .slave_template_dataout_12 (<connected-to-slave_template_dataout_12>), //               .dataout_12
//        .slave_template_dataout_13 (<connected-to-slave_template_dataout_13>), //               .dataout_13
//        .slave_template_dataout_14 (<connected-to-slave_template_dataout_14>), //               .dataout_14
//        .slave_template_dataout_15 (<connected-to-slave_template_dataout_15>), //               .dataout_15
        .slave_template_datain_0   (to_HEX_0),  									 //               .datain_0
        .slave_template_datain_1   (to_HEX_1),									   //               .datain_1
        .slave_template_datain_2   (to_HEX_2),									   //               .datain_2
        .slave_template_datain_3   (to_HEX_3),   									//               .datain_3
//        .slave_template_datain_4   (<connected-to-slave_template_datain_4>),   //               .datain_4
//        .slave_template_datain_5   (<connected-to-slave_template_datain_5>),   //               .datain_5
//        .slave_template_datain_6   (<connected-to-slave_template_datain_6>),   //               .datain_6
//        .slave_template_datain_7   (<connected-to-slave_template_datain_7>),   //               .datain_7
//        .slave_template_datain_8   (<connected-to-slave_template_datain_8>),   //               .datain_8
//        .slave_template_datain_9   (<connected-to-slave_template_datain_9>),   //               .datain_9
//        .slave_template_datain_10  (<connected-to-slave_template_datain_10>),  //               .datain_10
//        .slave_template_datain_11  (<connected-to-slave_template_datain_11>),  //               .datain_11
//        .slave_template_datain_12  (<connected-to-slave_template_datain_12>),  //               .datain_12
//        .slave_template_datain_13  (<connected-to-slave_template_datain_13>),  //               .datain_13
//        .slave_template_datain_14  (<connected-to-slave_template_datain_14>),  //               .datain_14
//        .slave_template_datain_15  (<connected-to-slave_template_datain_15>),  //               .datain_15
//        .slave_template_write      (<connected-to-slave_template_write>),      //               .write
//        .slave_template_read       (<connected-to-slave_template_read>),       //               .read
//        .slave_template_chipselect (<connected-to-slave_template_chipselect>), //               .chipselect
//        .slave_template_byteenable (<connected-to-slave_template_byteenable>)  //               .byteenable
    );



hex7seg h0(to_HEX_0[3:0], HEX0);
hex7seg h1(to_HEX_1[3:0], HEX1);
hex7seg h2(to_HEX_2[3:0], HEX2);
hex7seg h3(to_HEX_3[3:0], HEX3);
endmodule
