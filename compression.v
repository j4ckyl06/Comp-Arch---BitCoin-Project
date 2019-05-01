`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2019 08:33:42 AM
// Design Name: 
// Module Name: compression
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
module ch(
        input [31:0] X,
        input [31:0] Y,
        input [31:0] Z,
        output [31:0] chOut
        );
        
        assign chOut = Z ^ ( X & ( Y ^ Z ));
    endmodule
    
    module maj(
        input [31:0] X,
        input [31:0] Y,
        input [31:0] Z,
        output [31:0] majOut
        );
        
        assign majOut = ( X & Y ) | ( Z & ( X | Y ));
    endmodule
    
    module SIGMA0(
        input [31:0] X,
        input [31:0] Y,
        input [31:0] Z,
        output [31:0] S0
        );
        
        assign S0 = {X[1:0], X[31:2]} ^ {X[12:0], X[31:13]} ^ {X[21:0], X[31:22]};
    endmodule
    
    module SIGMA1(
        input [31:0] X,
        input [31:0] Y,
        input [31:0] Z,
        output [31:0] S1
        );
        
        assign S1 = {X[5:0], X[31:6]} ^ {X[10:0], X[31:11]} ^ {X[24:0], X[31:25]};
    endmodule
//////////////////////////////////////////////////////////////////////////////////

module compression(
    input sys_clk,
    input rst_n,
    //only takes in one block of Wt at a time but there is 64 of them being output
    //does it work on one T at a time and loop that 64 times or does T loop
    //is it a good idea to have flags in code(ie. z, error, ready, overflow)
    //data during error would vary depending on situaiton?  
    input [31:0] W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17
    output [255:0] hash
    );

    localparam
        H01 = 32'h6A09E667,
        H02 = 32'hBB67AE85,
        H03 = 32'h3C6EF372,
        H04 = 32'hA54FF53A,
        H05 = 32'h510E527F,
        H06 = 32'h9B05688C,
        H07 = 32'h1F83D9AB,
        H08 = 32'h5BE0CD19,
        Kt = {
            32'h428a2f98, 32'h71374491, 32'hb5c0fbcf, 32'he9b5dba5,
            32'h3956c25b, 32'h59f111f1, 32'h923f82a4, 32'hab1c5ed5,
            32'hd807aa98, 32'h12835b01, 32'h243185be, 32'h550c7dc3,
            32'h72be5d74, 32'h80deb1fe, 32'h9bdc06a7, 32'hc19bf174,
            32'he49b69c1, 32'hefbe4786, 32'h0fc19dc6, 32'h240ca1cc,
            32'h2de92c6f, 32'h4a7484aa, 32'h5cb0a9dc, 32'h76f988da,
            32'h983e5152, 32'ha831c66d, 32'hb00327c8, 32'hbf597fc7,
            32'hc6e00bf3, 32'hd5a79147, 32'h06ca6351, 32'h14292967,
            32'h27b70a85, 32'h2e1b2138, 32'h4d2c6dfc, 32'h53380d13,
            32'h650a7354, 32'h766a0abb, 32'h81c2c92e, 32'h92722c85,
            32'ha2bfe8a1, 32'ha81a664b, 32'hc24b8b70, 32'hc76c51a3,
            32'hd192e819, 32'hd6990624, 32'hf40e3585, 32'h106aa070,
            32'h19a4c116, 32'h1e376c08, 32'h2748774c, 32'h34b0bcb5,
            32'h391c0cb3, 32'h4ed8aa4a, 32'h5b9cca4f, 32'h682e6ff3,
            32'h748f82ee, 32'h78a5636f, 32'h84c87814, 32'h8cc70208,
            32'h90befffa, 32'ha4506ceb, 32'hbef9a3f7, 32'hc67178f2};
    
    reg [6:0] iteration_count = 0;
    reg done = 0;
    //compression loops for 64 times, at the start A-H have set values
    //can I declare them here as reg = .... or in a reset routine or in the case statements
    reg [31:0] A, B, C, D, E, F, G, H;
    reg [31:0] T1, T2;

    always @(posedge sys_clk or negedge rst_n) begin
        if(!rst_n || done) begin
            iteration_count = 0;
        end
        else begin
            iteration_count = iteration_count + 1;
        end
    end

    assign [255:0] hash = {}

    always @(*) begin
        case(iteration_count)
        d'0: begin
            

        d'1: begin

            iteration_count = iteration_count + 1
        end
        d'1: begin

        end

        d'2: begin

        end

        d'3: begin

        end

        d'4: begin

        end

        d'5: begin

        end

        d'6: begin

        end

        d'7: begin

        end

        d'8: begin

        end

        d'9: begin

        end

        d'10: begin

        end

        d'11: begin

        end

        d'12: begin

        end

        d'13: begin

        end

        d'14: begin

        end

        d'15: begin

        end

        d'16: begin

        end
        
        d'17: begin

        end
        
        d'18: begin

        end

        d'19: begin

        end

        d'20: begin

        end

        d'21: begin

        end

        d'22: begin

        end

        d'23: begin

        end

        d'24: begin

        end

        d'25: begin

        end

        d'26: begin

        end

        d'27: begin

        end

        d'28: begin

        end

        d'29: begin

        end

        d'30: begin

        end

        d'31: begin

        end

        d'32: begin

        end

        d'33: begin

        end

        d'34: begin

        end

        d'35: begin

        end

        d436: begin

        end

        d'37: begin

        end

        d'38: begin

        end

        d'39: begin

        end

        d'40: begin

        end

        d'41: begin

        end

        d'42: begin

        end

        d'43: begin

        end

        d'44: begin

        end

        d'45: begin

        end

        d'46: begin

        end
        
        d'47: begin

        end
        
        d'48: begin

        end

        d'49: begin

        end

        d'50: begin

        end

        d'51: begin

        end

        d'52: begin

        end

        d'53: begin

        end

        d'54: begin

        end

        d'55: begin

        end

        d'56: begin

        end

        d'57: begin

        end

        d'58: begin

        end

        d'59: begin

        end

        d'60: begin

        end

        d'61: begin

        end

        d'62: begin

        end

        d'63: begin
            done = 1;
        end
    end

endmodule