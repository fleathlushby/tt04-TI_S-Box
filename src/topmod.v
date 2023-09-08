`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2023 10:29:28
// Design Name: 
// Module Name: topmod
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module topmod(input[7:0] in, input in_load, input clk, input rst, output reg out_ready, output reg[7:0] out);

reg[39:0] in_reg;
reg[1:0] count,out_count;
wire[7:0] out1,out2,out3;
wire[7:0] sbox_out;

sbox_ti uut(.in1(in_reg[39:32]), .in2(in_reg[31:24]), .in3(in_reg[23:16]), .R0(in_reg[15:8]), .R1(in_reg[7:0]), .clk(clk), .rst(rst), .out1(out1), .out2(out2), .out3(out3));

always@(posedge clk)
    begin
        if(rst)
            count<=2'd0;
        else if(in_load==1'd0 && count<2'd2)
            count<=count+1'd1;
        else
            count<=count;
    end

always@(posedge clk)
    begin
        if(rst)
            out_ready<=1'd0;
        else if(count==2'd1)
            out_ready<=1'd1;
        else
            out_ready<=out_ready;
    end

always@(posedge clk)
    begin
        if(rst)
            begin
                in_reg=40'd0;
            end
        else if(in_load==1'b1)
            begin
                in_reg[39:8]=in_reg[31:0];
                in_reg[7:0]=in;
            end   
        else
            begin
                in_reg=in_reg;
            end   
    end
    
always@(posedge clk)
    begin
        if(rst)
            out_count<=8'd0;
        else if(out_ready==1'd1 && out_count<2'd3)
            begin
                out_count<=out_count+1;
            end
        else
            out_count<=out_count;
    end
    
always@(posedge clk)
    begin
        if(rst)
            out<=8'd0;
        else if(out_count==2'd1)
            out<=out1;
        else if(out_count==2'd2)
            out<=out2;
        else if(out_count==2'd3)
            out<=out3;
        else
            out<=out;
    end 
endmodule
