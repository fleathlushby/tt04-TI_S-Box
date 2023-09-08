`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2022 14:51:06
// Design Name: 
// Module Name: sbox_ti
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


module sbox_ti(input[7:0] in1, input[7:0] in2, input[7:0] in3, input[7:0] R0, input[7:0] R1, input clk, input rst, output[7:0] out1, output[7:0] out2, output[7:0] out3);

wire [7:0] B_sh1, C_sh1, D_sh1, X_sh1, Y_sh1, Z_sh1;
wire R1_sh1, R2_sh1, R3_sh1, R4_sh1, R5_sh1, R6_sh1, R7_sh1, R8_sh1, R9_sh1;
wire T1_sh1, T2_sh1, T3_sh1, T4_sh1, T5_sh1, T6_sh1, T7_sh1, T8_sh1, T9_sh1, T10_sh1;

wire [7:0] B_sh2, C_sh2, D_sh2, X_sh2, Y_sh2, Z_sh2;
wire R1_sh2, R2_sh2, R3_sh2, R4_sh2, R5_sh2, R6_sh2, R7_sh2, R8_sh2, R9_sh2;
wire T1_sh2, T2_sh2, T3_sh2, T4_sh2, T5_sh2, T6_sh2, T7_sh2, T8_sh2, T9_sh2, T10_sh2;

wire [7:0] B_sh3, C_sh3, D_sh3, X_sh3, Y_sh3, Z_sh3;
wire R1_sh3, R2_sh3, R3_sh3, R4_sh3, R5_sh3, R6_sh3, R7_sh3, R8_sh3, R9_sh3;
wire T1_sh3, T2_sh3, T3_sh3, T4_sh3, T5_sh3, T6_sh3, T7_sh3, T8_sh3, T9_sh3, T10_sh3;

assign R1_sh1 = in1[7] ^ in1[5] ;
assign R2_sh1 = in1[7] ~^ in1[4] ;
assign R3_sh1 = in1[6] ^ in1[0] ;
assign R4_sh1 = in1[5] ~^ R3_sh1 ;
assign R5_sh1 = in1[4] ^ R4_sh1 ;
assign R6_sh1 = in1[3] ^ in1[0] ;
assign R7_sh1 = in1[2] ^ R1_sh1 ;
assign R8_sh1 = in1[1] ^ R3_sh1 ;
assign R9_sh1 = in1[3] ^ R8_sh1 ;
assign B_sh1[7] = R7_sh1 ~^ R8_sh1 ;
assign B_sh1[6] = R5_sh1 ;
assign B_sh1[5] = in1[1] ^ R4_sh1 ;
assign B_sh1[4] = R1_sh1 ~^ R3_sh1 ;
assign B_sh1[3] = in1[1]^ R2_sh1 ^ R6_sh1 ;
assign B_sh1[2] = ~ in1[0] ;
assign B_sh1[1] = R4_sh1 ;
assign B_sh1[0] = in1[2] ~^ R9_sh1 ;
assign Y_sh1[7] = R2_sh1 ;
assign Y_sh1[6] = in1[4] ^ R8_sh1 ;

assign Y_sh1[5] = in1[6] ^ in1[4] ;
assign Y_sh1[4] = R9_sh1 ;
assign Y_sh1[3] = in1[6] ~^ R2_sh1 ;
assign Y_sh1[2] = R7_sh1 ;
assign Y_sh1[1] = in1[4] ^ R6_sh1 ;
assign Y_sh1[0] = in1[1] ^ R5_sh1 ;

SELECT_NOT_8 sel_in_sh1( B_sh1, Y_sh1, 1'd1, Z_sh1 );

/////////////////////////////////////////////////////////////////////////

assign R1_sh2 = in2[7] ^ in2[5] ;
assign R2_sh2 = in2[7] ~^ in2[4] ;
assign R3_sh2 = in2[6] ^ in2[0] ;
assign R4_sh2 = in2[5] ~^ R3_sh2 ;
assign R5_sh2 = in2[4] ^ R4_sh2 ;
assign R6_sh2 = in2[3] ^ in2[0] ;
assign R7_sh2 = in2[2] ^ R1_sh2 ;
assign R8_sh2 = in2[1] ^ R3_sh2 ;
assign R9_sh2 = in2[3] ^ R8_sh2 ;
assign B_sh2[7] = R7_sh2 ~^ R8_sh2 ;
assign B_sh2[6] = R5_sh2 ;
assign B_sh2[5] = in2[1] ^ R4_sh2 ;
assign B_sh2[4] = R1_sh2 ~^ R3_sh2 ;
assign B_sh2[3] = in2[1]^ R2_sh2 ^ R6_sh2 ;
assign B_sh2[2] = ~ in2[0] ;
assign B_sh2[1] = R4_sh2 ;
assign B_sh2[0] = in2[2] ~^ R9_sh2 ;
assign Y_sh2[7] = R2_sh2 ;
assign Y_sh2[6] = in2[4] ^ R8_sh2 ;

assign Y_sh2[5] = in2[6] ^ in2[4] ;
assign Y_sh2[4] = R9_sh2 ;
assign Y_sh2[3] = in2[6] ~^ R2_sh2 ;
assign Y_sh2[2] = R7_sh2 ;
assign Y_sh2[1] = in2[4] ^ R6_sh2 ;
assign Y_sh2[0] = in2[1] ^ R5_sh2 ;

SELECT_NOT_8 sel_in_sh2( B_sh2, Y_sh2, 1'd1, Z_sh2 );

//////////////////////////////////////////////////////

assign R1_sh3 = in3[7] ^ in3[5] ;
assign R2_sh3 = in3[7] ~^ in3[4] ;
assign R3_sh3 = in3[6] ^ in3[0] ;
assign R4_sh3 = in3[5] ~^ R3_sh3 ;
assign R5_sh3 = in3[4] ^ R4_sh3 ;
assign R6_sh3 = in3[3] ^ in3[0] ;
assign R7_sh3 = in3[2] ^ R1_sh3 ;
assign R8_sh3 = in3[1] ^ R3_sh3 ;
assign R9_sh3 = in3[3] ^ R8_sh3 ;
assign B_sh3[7] = R7_sh3 ~^ R8_sh3 ;
assign B_sh3[6] = R5_sh3 ;
assign B_sh3[5] = in3[1] ^ R4_sh3 ;
assign B_sh3[4] = R1_sh3 ~^ R3_sh3 ;
assign B_sh3[3] = in3[1]^ R2_sh3 ^ R6_sh3 ;
assign B_sh3[2] = ~ in3[0] ;
assign B_sh3[1] = R4_sh3 ;
assign B_sh3[0] = in3[2] ~^ R9_sh3 ;
assign Y_sh3[7] = R2_sh3 ;
assign Y_sh3[6] = in3[4] ^ R8_sh3 ;

assign Y_sh3[5] = in3[6] ^ in3[4] ;
assign Y_sh3[4] = R9_sh3 ;
assign Y_sh3[3] = in3[6] ~^ R2_sh3 ;
assign Y_sh3[2] = R7_sh3 ;
assign Y_sh3[1] = in3[4] ^ R6_sh3 ;
assign Y_sh3[0] = in3[1] ^ R5_sh3 ;

SELECT_NOT_8 sel_in_sh3( B_sh3, Y_sh3, 1'd1, Z_sh3 );

wire[7:0] out_sh1, out_sh2, out_sh3;

GF_INV_8_shared mod_inv(Z_sh1, Z_sh2, Z_sh3, R0[7:4], R0[3:0], R1[7:4], R1[3:0],clk,rst,  out_sh1, out_sh2, out_sh3);

assign T1_sh1 = out_sh1[7] ^ out_sh1[3];
assign T2_sh1 = out_sh1[6] ^ out_sh1[4];
assign T3_sh1 = out_sh1[6] ^ out_sh1[0];
assign T4_sh1 = out_sh1[5] ~^ out_sh1[3] ; 
assign T5_sh1 = out_sh1[5] ~^ T1_sh1 ; 
assign T6_sh1 = out_sh1[5] ~^ out_sh1[1] ; 
assign T7_sh1 = out_sh1[4] ~^ T6_sh1 ; 
assign T8_sh1 = out_sh1[2] ^ T4_sh1 ; 
assign T9_sh1 = out_sh1[1] ^ T2_sh1 ; 
assign T10_sh1 = T3_sh1 ^ T5_sh1 ; 
assign D_sh1[7] = T4_sh1 ;
assign D_sh1[6] = T1_sh1 ;
assign D_sh1[5] = T3_sh1 ;
assign D_sh1[4] = T5_sh1 ;
assign D_sh1[3] = T2_sh1 ^ T5_sh1;
assign D_sh1[2] = T3_sh1 ^ T8_sh1;
assign D_sh1[1] = T7_sh1 ;
assign D_sh1[0] = T9_sh1 ;
assign X_sh1[7] = out_sh1[4] ~^ out_sh1[1] ;
assign X_sh1[6] = out_sh1[1] ^ T10_sh1 ;
assign X_sh1[5] = out_sh1[2] ^ T10_sh1 ;
assign X_sh1[4] = out_sh1[6] ~^ out_sh1[1] ;
assign X_sh1[3] = T8_sh1 ^ T9_sh1 ;
assign X_sh1[2] = out_sh1[7] ~^ T7_sh1 ;
assign X_sh1[1] = T6_sh1 ;
assign X_sh1[0] = ~ out_sh1[2] ;

SELECT_NOT_8 sel_out1( D_sh1, X_sh1, 1'd1, out1 );

assign T1_sh2 = out_sh2[7] ^ out_sh2[3];
assign T2_sh2 = out_sh2[6] ^ out_sh2[4];
assign T3_sh2 = out_sh2[6] ^ out_sh2[0];
assign T4_sh2 = out_sh2[5] ~^ out_sh2[3] ; 
assign T5_sh2 = out_sh2[5] ~^ T1_sh2 ; 
assign T6_sh2 = out_sh2[5] ~^ out_sh2[1] ; 
assign T7_sh2 = out_sh2[4] ~^ T6_sh2 ; 
assign T8_sh2 = out_sh2[2] ^ T4_sh2 ; 
assign T9_sh2 = out_sh2[1] ^ T2_sh2 ; 
assign T10_sh2 = T3_sh2 ^ T5_sh2 ; 
assign D_sh2[7] = T4_sh2 ;
assign D_sh2[6] = T1_sh2 ;
assign D_sh2[5] = T3_sh2 ;
assign D_sh2[4] = T5_sh2 ;
assign D_sh2[3] = T2_sh2 ^ T5_sh2;
assign D_sh2[2] = T3_sh2 ^ T8_sh2;
assign D_sh2[1] = T7_sh2 ;
assign D_sh2[0] = T9_sh2 ;
assign X_sh2[7] = out_sh2[4] ~^ out_sh2[1] ;
assign X_sh2[6] = out_sh2[1] ^ T10_sh2 ;
assign X_sh2[5] = out_sh2[2] ^ T10_sh2 ;
assign X_sh2[4] = out_sh2[6] ~^ out_sh2[1] ;
assign X_sh2[3] = T8_sh2 ^ T9_sh2 ;
assign X_sh2[2] = out_sh2[7] ~^ T7_sh2 ;
assign X_sh2[1] = T6_sh2 ;
assign X_sh2[0] = ~ out_sh2[2] ;

SELECT_NOT_8 sel_out2( D_sh2, X_sh2, 1'd1, out2 );

assign T1_sh3 = out_sh3[7] ^ out_sh3[3];
assign T2_sh3 = out_sh3[6] ^ out_sh3[4];
assign T3_sh3 = out_sh3[6] ^ out_sh3[0];
assign T4_sh3 = out_sh3[5] ~^ out_sh3[3] ; 
assign T5_sh3 = out_sh3[5] ~^ T1_sh3 ; 
assign T6_sh3 = out_sh3[5] ~^ out_sh3[1] ; 
assign T7_sh3 = out_sh3[4] ~^ T6_sh3 ; 
assign T8_sh3 = out_sh3[2] ^ T4_sh3 ; 
assign T9_sh3 = out_sh3[1] ^ T2_sh3 ; 
assign T10_sh3 = T3_sh3 ^ T5_sh3 ; 
assign D_sh3[7] = T4_sh3 ;
assign D_sh3[6] = T1_sh3 ;
assign D_sh3[5] = T3_sh3 ;
assign D_sh3[4] = T5_sh3 ;
assign D_sh3[3] = T2_sh3 ^ T5_sh3;
assign D_sh3[2] = T3_sh3 ^ T8_sh3;
assign D_sh3[1] = T7_sh3 ;
assign D_sh3[0] = T9_sh3 ;
assign X_sh3[7] = out_sh3[4] ~^ out_sh3[1] ;
assign X_sh3[6] = out_sh3[1] ^ T10_sh3 ;
assign X_sh3[5] = out_sh3[2] ^ T10_sh3 ;
assign X_sh3[4] = out_sh3[6] ~^ out_sh3[1] ;
assign X_sh3[3] = T8_sh3 ^ T9_sh3 ;
assign X_sh3[2] = out_sh3[7] ~^ T7_sh3 ;
assign X_sh3[1] = T6_sh3 ;
assign X_sh3[0] = ~ out_sh3[2] ;

SELECT_NOT_8 sel_out3( D_sh3, X_sh3, 1'd1, out3 );

endmodule
