module pad_parse(
    input clk, rst_n, source_ready, source_stop,
    input [7:0] din,
    output reg [31:0] dout32,
    output reg [511:0] dout512,
    output reg overflow_flag
    );
    reg [64:0] counter32, counter512;
    reg appendlength, size_check,tb_check, pad_done, done;
    reg [7:0] m_block [0:63]; //8bit word * 64 add = 512
    reg [6:0] block_index, startpaddingindex, index0, index1, index2, index3, counter,index; 
    reg [63:0] m_size;  //length of message

    always @(posedge clk)
        begin
            if(~rst_n)
                begin
                    done = 0;
                    counter32 = 0;
                    counter512 = 0;
                    startpaddingindex = 0;
                    tb_check = 0;
                    size_check = 0;
                    counter = 0;
                    index0 = 0;
                    index1 = 1;
                    index2 = 2;
                    index3 = 3;
                    index = 0;
                    block_index = 0;
                    m_size = 0;
                    pad_done = 0;
                    dout32 = 0;
                    dout512 = 0;
                    appendlength = 0;
                    overflow_flag = 0;
                    for(index = 0; index <64; index = index + 1)
                        begin
                            m_block[index] = 0;
                        end
                end
            else
                begin
                    if((source_ready)&&(din != 8'b00000000))//on when transferring byte and off when byte is transferred
                        begin
                          m_block[block_index] = din;
                          block_index = block_index + 1;
                          startpaddingindex = block_index;
                        end
                    else if((~source_ready))//start padding
                        begin
                            if(source_stop)
                                begin
                                    if(block_index < 56) //56 bytes
                                        begin
                                            if(size_check == 0)
                                              begin 
                                                m_size = block_index*8;
                                                size_check = 1;  
                                              end
                                              
                                            case(block_index)  
                                            1:
                                              begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            2:
                                              begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end                                               
                                            3:
                                              begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end     
                                            4:
                                              begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            5:
                                              begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end     
                                            6:
                                             begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end     
                                            7:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            8:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            9:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            10:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            11:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            12:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            13:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            14:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            15:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            16:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            17:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            18:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            19:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end                                               
                                            20:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            21:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            22:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            23:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            24:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            25:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            26:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            27:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            28:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            29:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            30:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            31:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            32:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            33:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            34:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            35:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            36:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            37:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            38:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            39:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end                                                  
                                            40:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            41:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            42:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            43:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            44:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            45:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            46:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            47:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            48:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            49:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            50:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            51:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            52:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            53:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            54:begin
                                                if(block_index == startpaddingindex)
                                                    begin
                                                         m_block[block_index] = 8'b10000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                     end
                                                 else
                                                    begin
                                                         m_block[block_index] = 8'b00000000;
                                                         block_index = block_index + 1;
                                                         tb_check = 1;
                                                    end
                                              end   
                                            55:
                                                begin
                                                    m_block[block_index] = 8'b00000000;
                                                    appendlength = 1;
                                                end   
                                            default: overflow_flag = 1;
                                            endcase    
                                        end
                                end
                    if(appendlength)
                       begin
                           m_block[63] = m_size[7:0];
                           m_block[62] = m_size[15:8];
                           m_block[61] = m_size[23:16];
                           m_block[60] = m_size[31:24];
                           m_block[59] = m_size[39:32];
                           m_block[58] = m_size[47:40]; 
                           m_block[57] = m_size[55:48]; 
                           m_block[56] = m_size[63:56]; 
                           appendlength = 0;
                           pad_done = 1;
                           overflow_flag = 0;                              
                       end               
                            
                        end
                    if(pad_done)
                        begin
                            if((index0 == 0) || (index3 < 64))
                                begin
                                    dout32[31:24] = m_block[index0];
                                    dout32[23:16] = m_block[index1];
                                    dout32[15:8] = m_block[index2];
                                    dout32[7:0] = m_block[index3];
                                    
                                    index0 = index0 + 4;
                                    index1 = index1 + 4;
                                    index2 = index2 + 4;
                                    index3 = index3 + 4;
                                    
                                    counter32 = counter32 + 1;
                                end
                        end
                    if(counter32 == 16)
                        begin
                            counter512 = counter512 + 1;
                            counter32 = 0;
                            done = 1;
                        end 
                    if(done == 1)
                        begin
                            dout512[511:504] = m_block[0];
                            dout512[503:496] = m_block[1];
                            dout512[495:488] = m_block[2];                                
                            dout512[487:480] = m_block[3];
                            dout512[479:472] = m_block[4];
                            dout512[471:464] = m_block[5];
                            dout512[463:456] = m_block[6];                                
                            dout512[455:448] = m_block[7];
                            dout512[447:440] = m_block[8];
                            dout512[439:432] = m_block[9];
                            dout512[431:424] = m_block[10];
                            dout512[423:416] = m_block[11];
                            dout512[415:408] = m_block[12];                               
                            dout512[407:400] = m_block[13];
                            dout512[399:392] = m_block[14];
                            dout512[391:384] = m_block[15];                               
                            dout512[383:376] = m_block[16];
                            dout512[375:368] = m_block[17];
                            dout512[367:360] = m_block[18];
                            dout512[359:352] = m_block[19];                            
                            dout512[351:344] = m_block[20];
                            dout512[343:336] = m_block[21];
                            dout512[335:328] = m_block[22];
                            dout512[327:320] = m_block[23];                                
                            dout512[319:312] = m_block[24];
                            dout512[311:304] = m_block[25];
                            dout512[303:296] = m_block[26];                                    
                            dout512[295:288] = m_block[27];
                            dout512[287:280] = m_block[28];
                            dout512[279:272] = m_block[29];
                            dout512[271:264] = m_block[30];         
                            dout512[263:256] = m_block[31];                       
                            dout512[255:248] = m_block[32];
                            dout512[247:240] = m_block[33];
                            dout512[239:232] = m_block[34];
                            dout512[231:224] = m_block[35];                                
                            dout512[223:216] = m_block[36];
                            dout512[215:208] = m_block[37];
                            dout512[207:200] = m_block[38];
                            dout512[199:192] = m_block[39];                            
                            dout512[191:184] = m_block[40];
                            dout512[183:176] = m_block[41];
                            dout512[175:168] = m_block[42];
                            dout512[167:160] = m_block[43];                                
                            dout512[159:152] = m_block[44];
                            dout512[151:144] = m_block[45];
                            dout512[143:136] = m_block[46];
                            dout512[135:128] = m_block[47];                                
                            dout512[127:120] = m_block[48];
                            dout512[119:112] = m_block[49];
                            dout512[111:104] = m_block[50];
                            dout512[103:96] = m_block[51];                        
                            dout512[95:88] = m_block[52];
                            dout512[87:80] = m_block[53];
                            dout512[79:72] = m_block[54];
                            dout512[71:64] = m_block[55];                                
                            dout512[63:56] = m_block[56];
                            dout512[55:48] = m_block[57];
                            dout512[47:40] = m_block[58];
                            dout512[39:32] = m_block[59];                                
                            dout512[31:24] = m_block[60];
                            dout512[23:16] = m_block[61];
                            dout512[15:8] = m_block[62];
                            dout512[7:0] = m_block[63];                            
                        end  
                end
        end    
endmodule