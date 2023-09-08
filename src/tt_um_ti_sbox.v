`default_nettype none

module tt_um_ti_sbox(
    input wire [7:0] ui_in, 
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    output wire [7:0] uo_out,
    input wire clk, 
    input wire rst_n, 
    input wire ena);

wire reset = ! rst_n;
wire in_load;
wire [7:0] in;
reg out_ready;
assign in_load = ena;
assign in = ui_in;
assign uio_oe = 8'b11111111;   // use bidirectionals as outputs
assign uio_out[0] = out_ready;
assign uio_out[7:1] = 7'b0000000;
reg[39:0] in_reg;
reg[1:0] count,out_count;
wire[7:0] out1,out2,out3;
wire[7:0] sbox_out;

sbox_ti uut(.in1(in_reg[39:32]), .in2(in_reg[31:24]), .in3(in_reg[23:16]), .R0(in_reg[15:8]), .R1(in_reg[7:0]), .clk(clk), .rst(reset), .out1(out1), .out2(out2), .out3(out3));

always@(posedge clk)
    begin
        if(reset)
            count<=2'd0;
        else if(in_load==1'd0 && count<2'd2)
            count<=count+1'd1;
        else
            count<=count;
    end

always@(posedge clk)
    begin
        if(reset)
            out_ready<=1'd0;
        else if(count==2'd1)
            out_ready<=1'd1;
        else
            out_ready<=out_ready;
    end

always@(posedge clk)
    begin
        if(reset)
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
        if(reset)
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
        if(reset)
            uo_out<=8'd0;
        else if(out_count==2'd1)
            uo_out<=out1;
        else if(out_count==2'd2)
            uo_out<=out2;
        else if(out_count==2'd3)
            uo_out<=out3;
        else
            uo_out<=uo_out;
    end 
endmodule
