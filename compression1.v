`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
module compression(
    input [31:0] Ki, Wi,
    input clk, rst_n, donepad,
    input [6:0] counter,
    output reg [31:0] aout, bout, cout, dout, eout, fout, gout, hout
    );
    reg [31:0] S0, S1, T1, T2, Ch_efg, Maj_abc;
    reg [31:0] at, bt, ct, dt, et, ft, gt, ht;
    reg tcase, tif;
    
    localparam
        H01 = 32'h6A09E667,
        H02 = 32'hBB67AE85,
        H03 = 32'h3C6EF372,
        H04 = 32'hA54FF53A,
        H05 = 32'h510E527F,
        H06 = 32'h9B05688C,
        H07 = 32'h1F83D9AB,
        H08 = 32'h5BE0CD19,
        Ks = {
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
    
    always @(posedge clk)
        begin
            if (~rst_n)
                begin
                    aout <= H01;
                    bout <= H02;
                    cout <= H03;
                    dout <= H04;
                    eout <= H05;
                    fout <= H06;
                    gout <= H07;
                    hout <= H08;
                end 
            else
                begin
                    
                    S0<=({aout[1:0],aout[31:2]}) ^ ({aout[12:0],aout[31:13]}) ^ ({aout[21:0],aout[31:22]});
                    S1<=({eout[5:0],eout[31:6]}) ^ ({eout[10:0],eout[31:11]}) ^ ({eout[24:0],eout[31:25]});
         
                    Maj_abc=(aout & bout) ^ (aout & cout) ^ (bout & cout);
                    Ch_efg=(eout & fout) ^ (~eout & gout);
                    if(counter == 65)
                       begin
                            aout<=aout;
                            bout<=bout;
                            cout<=cout;
                            dout<=dout;
                            eout<=eout;
                            fout<=fout;
                            gout<=gout;
                            hout<=hout;
                       end
                    else
                       begin
                            if(donepad==1)
                                begin
                                    case(tcase)
                                    1'b0: tcase <=1'b1;
                                    1'b1: tif <= 1'b1;
                                    endcase
                                end
                       
                            if(tif == 1 && counter != 64)
                                 begin    
                                      T1 <= hout + S1 + Ch_efg + + Ki + Wi;
                                      T2 <= S0 + Maj_abc;
                                      aout <= T1 + T2;
                                      bout <= aout;
                                      cout <= bout;
                                      dout <= cout; 
                                      eout <= dout + T1; 
                                      fout <= eout;
                                      gout <= fout;
                                      hout <= gout;
                                  end
                       end
                end
         end
endmodule
