`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 07:00:13
// Design Name: 
// Module Name: GF_SQ_2
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


module GF_SQ_2( A, Q );
  input [1:0] A;
  output [1:0] Q;
  
  assign Q = { A[0], A[1] };
endmodule

