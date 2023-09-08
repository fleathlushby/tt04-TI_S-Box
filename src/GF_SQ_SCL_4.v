`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 06:59:41
// Design Name: 
// Module Name: GF_SQ_SCL_4
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


module GF_SQ_SCL_4( A, Q );
  input [3:0] A;
  output [3:0] Q;
  wire [1:0] a, b, ab2, b2, b2N2;
  assign a = A[3:2];
  assign b = A[1:0];
  GF_SQ_2 absq(a ^ b, ab2);
  GF_SQ_2 bsq(b, b2);
  GF_SCLW_2 bmulN2(b2, b2N2);

  assign Q = { ab2, b2N2 };
endmodule
