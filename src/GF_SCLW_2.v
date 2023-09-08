`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 07:01:00
// Design Name: 
// Module Name: GF_SCLW_2
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


module GF_SCLW_2( A, Q );
  input [1:0] A;
  output [1:0] Q;
  assign Q = { (A[1] ^ A[0]), A[1] };
endmodule
