`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2022 14:58:13
// Design Name: 
// Module Name: MUX21I
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


module MUX21I( A, B, s, Q );
  input A;
  input B;
  input s;
  output Q;

  assign Q = ~( s ? A : B );
endmodule
