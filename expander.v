`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2019 08:33:42 AM
// Design Name: 
// Module Name: expander
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

//module instantations
    //might instantiate two new modules in here instead because of the rotations and shift are of different sizes
    //most likely can't do a generic one and insantiate that twice isntead
    module sigma0(
        input [31:0] X,
        output [31:0] Y
        );
        
        assign Y = {X[6:0], X[31:7]} ^ {X[17:0], X[31:18]} ^ {3'b000, X[31:3]};
        
    endmodule
    
    module sigma1(
        input [31:0] X,
        output [31:0] Y
        );
        
        assign Y = {X[16:0], X[31:17]} ^ {X[18:0], X[31:18]} ^ {10'b0000000000, X[31:10]};
        
    endmodule
    
    module demux(
        input [511:0] X,
        input [3:0] sel,
        output reg [31:0] Y
        );
        
        always@(*) begin
            case(sel)
                4'd0: begin
                    Y = X[31:0];
                end
                4'd1: begin
                    Y = X[63:32];
                end
                4'd2: begin
                    Y = X[95:64];
                end
                4'd3: begin
                    Y = X[127:96];
                end
                4'd4: begin
                    Y = X[159:128];
                end
                4'd5: begin
                    Y = X[191:160];
                end
                4'd6: begin
                    Y = X[223:192];
                end
                4'd7: begin
                    Y = X[255:224];
                end
                4'd8: begin
                    Y = X[287:256];
                end
                4'd9: begin
                    Y = X[63:32];
                end
                4'd10: begin
                    Y = X[63:32];
                end
                4'd11: begin
                    Y = X[63:32];
                end
                4'd12: begin
                    Y = X[63:32];
                end
                4'd13: begin
                    Y = X[63:32];
                end
                4'd14: begin
                    Y = X[63:32];
                end
                4'd15: begin
                    Y = X[511:32];
                end
                default: Y = 0;
            endcase    
        end
    endmodule
//////////////////////////////////////////////////////////////////////////////////

module expander(
    input sys_clk,
    input rst_n,
//    input [511:0] M,             //final output of padding that gives out N amount of 512 bits block
//    output [2044:0] W,
    //if reading in parsed msgs already of a 512 bits block broken into 16 Mt blocks of 32 bits
    input [511:0] dataIn,
    
    output [31:0] Wt0, Wt1, Wt2, Wt3, Wt4, Wt5, Wt6, Wt7, Wt8, Wt9, Wt10, Wt11, Wt12, Wt13, Wt14, Wt15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W26, W27, W28, W29, W30, W31, W32, W33, W34, W35, W36, W37, W38, W39, W40, W41, W42, W43, W44, W45, W46, W47, W48, W49, W50, W51, W52, W53, W54, W55, W56, W57, W58, W59, W60, W61, W62, W63
    );
    
    reg [31:0] Mt0;
    reg [31:0] Mt1;
    reg [31:0] Mt2;
    reg [31:0] Mt3;
    reg [31:0] Mt4;
    reg [31:0] Mt5;
    reg [31:0] Mt6;    
    reg [31:0] Mt7;
    reg [31:0] Mt8;
    reg [31:0] Mt9;
    reg [31:0] Mt10;
    reg [31:0] Mt11;
    reg [31:0] Mt12;
    reg [31:0] Mt13;
    reg [31:0] Mt14;
    reg [31:0] Mt15;
    
    demux DM0(     
        .X(dataIn),
        .sel(4'd0),
        .Y(Mt0)    
        );
        
    demux DM1(     
        .X(dataIn),
        .sel(4'd1),
        .Y(Mt0)    
        );   
        
    demux DM2(     
        .X(dataIn),
        .sel(4'd2),
        .Y(Mt0)    
        );         
    
    demux DM3(     
        .X(dataIn),
        .sel(4'd3),
        .Y(Mt0)    
        );   
    
    demux DM4(     
        .X(dataIn),
        .sel(4'd4),
        .Y(Mt0)    
        );   
    
    demux DM5(     
        .X(dataIn),
        .sel(4'd5),
        .Y(Mt0)    
        );
    
    demux DM6(     
        .X(dataIn),
        .sel(4'd6),
        .Y(Mt0)    
        );   
        
    demux DM7(     
        .X(dataIn),
        .sel(4'd7),
        .Y(Mt0)    
        ); 
    demux DM8(     
        .X(dataIn),
        .sel(4'd8),
        .Y(Mt0)    
        );   
        
    demux DM9(     
        .X(dataIn),
        .sel(4'd9),
        .Y(Mt0)    
        );  
           
    demux DM10(     
        .X(dataIn),
        .sel(4'd10),
        .Y(Mt0)    
        );
    
    demux DM11(     
        .X(dataIn),
        .sel(4'd11),
        .Y(Mt0)    
        );
    
    demux DM12(     
        .X(dataIn),
        .sel(4'd12),
        .Y(Mt0)    
        );
    
    demux DM13(     
        .X(dataIn),
        .sel(4'd13),
        .Y(Mt0)    
        );
    
    demux DM14(     
        .X(dataIn),
        .sel(4'd14),
        .Y(Mt0)    
        );
    
    demux DM15(     
        .X(dataIn),
        .sel(4'd15),
        .Y(Mt0)    
        );
    
    reg [31:0] sigmaL1Out, sigmaL0Out;
    
    assign Wt0 = Mt0;
    assign Wt1 = Mt1;
    assign Wt2 = Mt2;
    assign Wt3 = Mt3;
    assign Wt4 = Mt4;
    assign Wt5 = Mt5;
    assign Wt6 = Mt6;
    assign Wt7 = Mt7;
    assign Wt8 = Mt8;
    assign Wt9 = Mt9;
    assign Wt10 = Mt10;
    assign Wt11 = Mt11;
    assign Wt12 = Mt12;
    assign Wt13 = Mt13;
    assign Wt14 = Mt14;
    assign Wt15 = Mt15;
    
    sigmaL1 s16(.X(Mt14), .Y(sigmaL1Out));
    assign Wt16 = {(sigmaL1Out), W};
    assign Wt17 = {};
    assign Wt18 = ;
    assign Wt19 = ;
    assign Wt20 = ;
    assign Wt21 = ;
    assign Wt22 = ;
    assign Wt23 = ;
    assign Wt24 = ;
    assign Wt26 = ;
    assign Wt27 = ;
    assign Wt28 = ;
    assign Wt29 = ;
    assign Wt30 = ;
    assign Wt31 = ;
    assign Wt32 = ;
    assign Wt33 = ;
    assign Wt34 = ;
    assign Wt35 = ;
    assign Wt36 = ;
    assign Wt37 = ;
    assign Wt38 = ;
    assign Wt39 = ;
    assign Wt40 = ;
    assign Wt41 = ;
    assign Wt42 = ;
    assign Wt43 = ;
    assign Wt44 = ;
    assign Wt45 = ;
    assign Wt46 = ;
    assign Wt47 = ;
    assign Wt48 = ;
    assign Wt49 = ;
    assign Wt50 = ;
    assign Wt51 = ;
    assign Wt52 = ;
    assign Wt53 = ;
    assign Wt54 = ;
    assign Wt55 = ;
    assign Wt56 = ;
    assign Wt57 = ;
    assign Wt58 = ;
    assign Wt59 = ;
    assign Wt60 = ;
    assign Wt61 = ;
    assign Wt62 = ;
    assign Wt63 = ; 
    
endmodule