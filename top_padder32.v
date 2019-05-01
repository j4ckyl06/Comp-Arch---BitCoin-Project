`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
module top_padder32(
    input clk, rst_n,
    input [447:0] inputword,
    output wire [31:0] dout32,
    output wire [511:0] dout512,
    output wire overflow_flag
    );
    wire [7:0] outputbyte;
    wire bytestop, bytestart;
    
    message u_message(
        .inputmessage(inputword),
        .clk(clk), 
        .rst_n(rst_n),
        .outputmessage(outputbyte),
        .bytestop(bytestop),
        .bytestart(bytestart)
        );  

    pad_parse u_pad_parse(
        .clk(clk), 
        .rst_n(rst_n), 
        .source_ready(bytestart), 
        .source_stop(bytestop),
        .din(outputbyte),
        .dout32(dout32),
        .dout512(dout512),
        .overflow_flag(overflow_flag)
    );

    
endmodule
