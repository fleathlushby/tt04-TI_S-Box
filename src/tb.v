`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2023 13:03:45
// Design Name: 
// Module Name: test_wrapper
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


module test_wrapper;

reg[7:0] in;
reg in_load,clk,rst;
wire out_ready;
wire[7:0] out;

topmod dut(in, in_load, clk, rst, out_ready, out);

initial
    begin
        clk<=1'd0;
        rst<=1'd1;
        in_load<=1'd0;
    end

always #10 clk=~clk;

initial 
    begin
        #30 rst<=1'd0;
        in_load<=1'd1;
        in<=8'h63 ^ 8'h4 ^ 8'h5;
        #20 in<=8'h4;
        #20 in<=8'h5;
        #20 in<=8'hf8;
        #20 in<=8'h95;
        #20 in_load<=1'd0;
    end

endmodule
