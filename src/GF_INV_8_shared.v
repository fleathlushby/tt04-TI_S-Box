`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 01:58:43
// Design Name: 
// Module Name: GF_INV_8_shared
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module GF_INV_8_shared(input[7:0] sh1, input[7:0] sh2, input[7:0] sh3, input[3:0] r1, input[3:0] r2, input[3:0] r3, input[3:0] r4, input clk, input rst, output[7:0] out_sh1, output[7:0] out_sh2, output[7:0] out_sh3);

wire[3:0] mod_mul1_out1, mod_mul1_out2, mod_mul1_out3;
wire[3:0] mod_mul2_out1, mod_mul2_out2, mod_mul2_out3;
wire[3:0] mod_mul3_out1, mod_mul3_out2, mod_mul3_out3;
wire[3:0] sh3_xor_out, sh2_xor_out, sh1_xor_out, sq_scl_in;
wire[3:0] sq_scl_out1, sq_scl_out2;
wire[3:0] inv_in1, inv_in2, inv_in3, inv_in4;
wire[3:0] inv_out1, inv_out2, inv_out3, inv_out4;
wire[3:0] mul_in1, mul_in2, mul_in3;
//Phase I
(*keep = "true" , keep_hierarchy = "yes" *)GF_MULS_4_shared mod_mul1(sh1[7:4], sh2[7:4], sh3[7:4], sh1[3:0], sh2[3:0], sh3[3:0], mod_mul1_out1, mod_mul1_out2, mod_mul1_out3);
 
assign sh3_xor_out= sh3[7:4] ^ sh3[3:0];
assign sh2_xor_out= sh2[7:4] ^ sh2[3:0];
assign sh1_xor_out= sh1[7:4] ^ sh1[3:0];
assign sq_scl_in= sh3_xor_out ^ sh2_xor_out;

(*keep = "true" , keep_hierarchy = "yes" *)GF_SQ_SCL_4 sh_mod1(sq_scl_in, sq_scl_out1);
(*keep = "true" , keep_hierarchy = "yes" *)GF_SQ_SCL_4 sh_mod2(sh1_xor_out, sq_scl_out2);

reg[3:0] sh1_reg_0_1, sh2_reg_0_1, sh3_reg_0_1,sh1_reg_0_2, sh2_reg_0_2, sh3_reg_0_2;
reg[3:0] sh1_reg_1_1, sh2_reg_1_1, sh3_reg_1_1,sh1_reg_1_2, sh2_reg_1_2, sh3_reg_1_2; 
reg[3:0] sq_scl_out1_reg, sq_scl_out2_reg;
reg[3:0] mod_mul1_out1_reg, mod_mul1_out2_xor, mod_mul1_out3_xor;
reg[3:0] random_xor_1;

always @(posedge clk)
    begin
        if(rst)
            begin
                sh1_reg_0_1<=4'd0;
                sh2_reg_0_1<=4'd0;
                sh3_reg_0_1<=4'd0;
                sh1_reg_0_2<=4'd0;
                sh2_reg_0_2<=4'd0;
                sh3_reg_0_2<=4'd0;
                
                sq_scl_out1_reg<=4'd0;
                sq_scl_out2_reg<=4'd0;
                random_xor_1<= 4'd0;
                
                mod_mul1_out1_reg<=4'd0;
                mod_mul1_out2_xor<=4'd0;
                mod_mul1_out3_xor<=4'd0;
            end
        else
            begin
                sh1_reg_0_1<=sh1[7:4];
                sh2_reg_0_1<=sh2[7:4];
                sh3_reg_0_1<=sh3[7:4];
                sh1_reg_0_2<=sh1[3:0];
                sh2_reg_0_2<=sh2[3:0];
                sh3_reg_0_2<=sh3[3:0];
                
                sq_scl_out1_reg<=sq_scl_out1;
                sq_scl_out2_reg<=sq_scl_out2;
                random_xor_1<= r1 ^ r2;
                
                mod_mul1_out1_reg<=mod_mul1_out1;
                mod_mul1_out2_xor<=mod_mul1_out2 ^ r1;
                mod_mul1_out3_xor<=mod_mul1_out3 ^ r2;
            end
    end

assign inv_in1= sq_scl_out1_reg;
assign inv_in2= sq_scl_out2_reg ^ random_xor_1;
assign inv_in3= mod_mul1_out1_reg ^ mod_mul1_out2_xor;
assign inv_in4= mod_mul1_out3_xor;

(*keep = "true" , keep_hierarchy = "yes" *)GF_INV_4_shared inv_mod(inv_in1, inv_in2, inv_in3, inv_in4, inv_out1, inv_out2, inv_out3, inv_out4); 

reg[3:0] inv_out1_reg, inv_out2_xor, inv_out3_xor, inv_out4_reg, random_xor_2;

always @(posedge clk)
    begin
        if(rst)
            begin
                sh1_reg_1_1<=4'd0;
                sh2_reg_1_1<=4'd0;
                sh3_reg_1_1<=4'd0;
                sh1_reg_1_2<=4'd0;
                sh2_reg_1_2<=4'd0;
                sh3_reg_1_2<=4'd0;
                
                inv_out1_reg<=4'd0;
                inv_out2_xor<=4'd0;
                inv_out3_xor<=4'd0;
                inv_out4_reg<=4'd0;
                random_xor_2<= 4'd0;
            end
        else
            begin
                sh1_reg_1_1<=sh1_reg_0_1;
                sh2_reg_1_1<=sh2_reg_0_1;
                sh3_reg_1_1<=sh3_reg_0_1;
                sh1_reg_1_2<=sh1_reg_0_2;
                sh2_reg_1_2<=sh2_reg_0_2;
                sh3_reg_1_2<=sh3_reg_0_2;
                
                inv_out1_reg<=inv_out1;
                inv_out2_xor<=r3 ^ inv_out2;
                inv_out3_xor<=inv_out3 ^ r4;
                inv_out4_reg<=inv_out4;
                random_xor_2<= r3 ^ r4;
            end
    end

assign mul_in1= inv_out1_reg ^ inv_out2_xor;
assign mul_in2= inv_out3_xor;
assign mul_in3= inv_out4_reg ^ random_xor_2;
    
(*keep = "true" , keep_hierarchy = "yes" *)GF_MULS_4_shared mod_mul2(sh1_reg_1_1, sh2_reg_1_1, sh3_reg_1_1, mul_in1, mul_in2, mul_in3, mod_mul2_out1, mod_mul2_out2, mod_mul2_out3);
(*keep = "true" , keep_hierarchy = "yes" *)GF_MULS_4_shared mod_mul3(sh1_reg_1_2, sh2_reg_1_2, sh3_reg_1_2, mul_in1, mul_in2, mul_in3, mod_mul3_out1, mod_mul3_out2, mod_mul3_out3);

assign out_sh1= {mod_mul3_out1, mod_mul2_out1};
assign out_sh2= {mod_mul3_out2, mod_mul2_out2};
assign out_sh3= {mod_mul3_out3, mod_mul2_out3};

endmodule
