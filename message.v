`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
module message(
    input [447:0] inputmessage,
    input clk, rst_n,
    output reg [7:0] outputmessage,
    output reg bytestop, bytestart
    );
    reg [7:0] index;
    reg [7:0] tempinput [0:55];
    reg messagein;
    
    always@(posedge clk)
        begin
            if(~rst_n)
                begin
                    tempinput[0] = 0; tempinput[1] = 0; tempinput[2] = 0; tempinput[3] = 0;
                    tempinput[4] = 0; tempinput[5] = 0; tempinput[6] = 0; tempinput[7] = 0;
                    tempinput[8] = 0; tempinput[9] = 0; tempinput[10] = 0; tempinput[11] = 0;
                    tempinput[12] = 0; tempinput[13] = 0; tempinput[14] = 0; tempinput[15] = 0;
                    tempinput[16] = 0; tempinput[17] = 0; tempinput[18] = 0; tempinput[19] = 0;
                    tempinput[20] = 0; tempinput[21] = 0; tempinput[22] = 0; tempinput[23] = 0;
                    tempinput[24] = 0; tempinput[25] = 0; tempinput[26] = 0; tempinput[27] = 0;
                    tempinput[28] = 0; tempinput[29] = 0; tempinput[30] = 0; tempinput[31] = 0;
                    tempinput[32] = 0; tempinput[33] = 0; tempinput[34] = 0; tempinput[35] = 0;
                    tempinput[36] = 0; tempinput[37] = 0; tempinput[38] = 0; tempinput[39] = 0;
                    tempinput[40] = 0; tempinput[41] = 0; tempinput[42] = 0; tempinput[43] = 0;
                    tempinput[44] = 0; tempinput[45] = 0; tempinput[46] = 0; tempinput[47] = 0;
                    tempinput[48] = 0; tempinput[49] = 0; tempinput[50] = 0; tempinput[51] = 0;
                    tempinput[52] = 0; tempinput[53] = 0; tempinput[54] = 0; tempinput[55] = 0;
                    messagein = 1;
                    outputmessage = 0;
                    index = 0;
                    bytestart = 1;
                    bytestop = 0;
                end
            else
                begin
                    if(messagein == 1)
                        begin
                            tempinput[0] = inputmessage[447:440];
                            tempinput[1] = inputmessage[439:432];
                            tempinput[2] = inputmessage[431:424];
                            tempinput[3] = inputmessage[423:416];
                            tempinput[4] = inputmessage[415:408];
                            tempinput[5] = inputmessage[407:400];
                            tempinput[6] = inputmessage[399:392];
                            tempinput[7] = inputmessage[391:384];
                            tempinput[8] = inputmessage[383:376];
                            tempinput[9] = inputmessage[375:368];
                            tempinput[10] = inputmessage[367:360];
                            tempinput[11] = inputmessage[359:352];
                            tempinput[12] = inputmessage[351:344];
                            tempinput[13] = inputmessage[343:336];
                            tempinput[14] = inputmessage[335:328];
                            tempinput[15] = inputmessage[327:320];
                            tempinput[16] = inputmessage[319:312];
                            tempinput[17] = inputmessage[311:304];
                            tempinput[18] = inputmessage[303:296];
                            tempinput[19] = inputmessage[295:288];
                            tempinput[20] = inputmessage[287:280];
                            tempinput[21] = inputmessage[279:272];
                            tempinput[22] = inputmessage[271:264];
                            tempinput[23] = inputmessage[263:256];
                            tempinput[24] = inputmessage[255:248];
                            tempinput[25] = inputmessage[247:240];
                            tempinput[26] = inputmessage[239:232];
                            tempinput[27] = inputmessage[231:224];
                            tempinput[28] = inputmessage[223:216];
                            tempinput[29] = inputmessage[215:208];
                            tempinput[30] = inputmessage[207:200];
                            tempinput[31] = inputmessage[199:192];
                            tempinput[32] = inputmessage[191:184];
                            tempinput[33] = inputmessage[183:176];
                            tempinput[34] = inputmessage[175:168];
                            tempinput[35] = inputmessage[167:160];
                            tempinput[36] = inputmessage[159:152];
                            tempinput[37] = inputmessage[151:144];
                            tempinput[38] = inputmessage[143:136];
                            tempinput[39] = inputmessage[135:128];
                            tempinput[40] = inputmessage[127:120];
                            tempinput[41] = inputmessage[119:112];
                            tempinput[42] = inputmessage[111:104];
                            tempinput[43] = inputmessage[103:96];
                            tempinput[44] = inputmessage[95:88];
                            tempinput[45] = inputmessage[87:80];
                            tempinput[46] = inputmessage[79:72];
                            tempinput[47] = inputmessage[71:64];
                            tempinput[48] = inputmessage[63:56];
                            tempinput[49] = inputmessage[55:48];
                            tempinput[50] = inputmessage[47:40];
                            tempinput[51] = inputmessage[39:32];
                            tempinput[52] = inputmessage[31:24];
                            tempinput[53] = inputmessage[23:16];
                            tempinput[54] = inputmessage[15:8];
                            tempinput[55] = inputmessage[7:0];
                            messagein = 0;
                            bytestart = 1;
                            bytestop = 0; 
                        end
                    else
                        if(index < 56)
                            begin
                                if(tempinput[index] != 8'b0000000)
                                    begin
                                        outputmessage = tempinput[index];
                                    end
                                index = index + 1;
                                
                            end
                        else
                            begin
                                index = 0;
                                bytestart = 0;
                                bytestop = 1;
                                if((tempinput[0] != inputmessage[447:440])&&(tempinput[55] != inputmessage[7:0])&&(tempinput[1] != inputmessage[439:432]))
                                    messagein = 1;
                            end
                end
        end
endmodule