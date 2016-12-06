`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AUTHOR: 
// Module Name: 
// Create Date: 
// Edit Date:
// Edit Date: 
// ECE425L 
// Purpose: 
//////////////////////////////////////////////////////////////////////////////////

//                (RegOut1[16b],RegOut2[16b],RegIn[16b],RegAddressA,RegAddressB,RegAddressC,EnableLW,ClearAll,Clock) 
module Reg_File16b(A,B,C,Aaddr,Baddr,Caddr,Load,Clear,Clk);
    output [15:0] A,B;
    input [15:0] C;
    input [3:0] Aaddr,Baddr,Caddr;
    input Load,Clear,Clk;
    wire [255:0] In, Out; // 16,16bit MUX in/out
    wire [15:0] dec;    //output of decoder 
    
    //Register16b         REG[15:0]      (Clk ,reset      ,In           ,Out);
    Register16b         REG0            (Clk  ,Clear      ,In[15:0]     ,Out[15:0]);
    Register16b         REG1            (Clk  ,Clear      ,In[31:16]    ,Out[31:16]);
    Register16b         REG2            (Clk  ,Clear      ,In[47:32]    ,Out[47:32]);
    Register16b         REG3            (Clk  ,Clear      ,In[63:48]    ,Out[63:48]);
    Register16b         REG4            (Clk  ,Clear      ,In[79:64]    ,Out[79:64]);
    Register16b         REG5            (Clk  ,Clear      ,In[95:80]    ,Out[95:80]);
    Register16b         REG6            (Clk  ,Clear      ,In[111:96]   ,Out[111:96]);
    Register16b         REG7            (Clk  ,Clear      ,In[127:112]  ,Out[127:112] );
    Register16b         REG8            (Clk  ,Clear      ,In[143:128]  ,Out[143:128]);
    Register16b         REG9            (Clk  ,Clear      ,In[159:144]  ,Out[159:144]);
    Register16b         REG10           (Clk  ,Clear      ,In[175:160]  ,Out[175:160]);
    Register16b         REG11           (Clk  ,Clear      ,In[191:176]  ,Out[191:176]);
    Register16b         REG12           (Clk  ,Clear      ,In[207:192]  ,Out[207:192]);
    Register16b         REG13           (Clk  ,Clear      ,In[223:208]  ,Out[223:208]);
    Register16b         REG14           (Clk  ,Clear      ,In[239:224]  ,Out[239:224]);
    Register16b         REG15           (Clk  ,Clear      ,In[255:240]  ,Out[255:240]);

    // Wire each 16 bit reg into input of 1st 16bit mux. Using Aaddr as select. Output is 16bit out A
    // MUX_16b_16to1(E,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,S,O);
    MUX_16b_16to1       MUX1        (1'b1,Out[15:0],Out[31:16],Out[47:32],Out[63:48],Out[79:64],Out[95:80],Out[111:96],Out[127:112],Out[143:128],Out[159:144],Out[175:160],Out[191:176],Out[207:192],Out[223:208],Out[239:224],Out[255:240],Aaddr,A);
    // Wire each 16 bit reg into input of 2nd 16bit mux. Using Baddr as select. Output is 16bit out B
    //                               (Enable,Select(3b),Input0[16b_all],Input1,Input2,Input3,Input4,Input5,Input6,Input7,Input8,Input9,Input10,Input11,Input12,Input13,Input14,input15, Output)
    MUX_16b_16to1       MUX2        (1'b1,Out[15:0],Out[31:16],Out[47:32],Out[63:48],Out[79:64],Out[95:80],Out[111:96],Out[127:112],Out[143:128],Out[159:144],Out[175:160],Out[191:176],Out[207:192],Out[223:208],Out[239:224],Out[255:240],Baddr,B);
    

    // Instatiate 4-to-16 Decoder using Caddr as input. Wire output to enable pin of each 16bit2to1mux
    // If decoder output is 0 keep current value at Q of register
    // If decoder output is 1 load C into register
    // If load is disabled no values will be loaded
    // If load is enabled 1 single register will be loaded with C, chosen by Caddr
    // Decoder_4to16(E,i,o);             
    Decoder_4to16         DECODER1            (Load     ,Caddr        ,dec);
    // The output of DECODER1 will be the load selecter
    // LOAD 1 - Load value of C into Reg
    // LOAD 0 - Hold the current values of Reg
    // Outputs of each mux will wire to input of one of 16 registers
    //                                         Input1[16b],Input0[16b],     Sel[1b],       Output[16b]
    //MUX_16b_2to1(a,b,sel,out);
    MUX_16b_2to1          MUX_0                (C         , Out[15:0]       ,dec[0]       , In[15:0]);
    MUX_16b_2to1          MUX_1                (C         , Out[31:16]      ,dec[1]       , In[31:16]);
    MUX_16b_2to1          MUX_2                (C         , Out[47:32]      ,dec[2]       , In[47:32]);
    MUX_16b_2to1          MUX_3                (C         , Out[63:48]      ,dec[3]       , In[63:48]);
    MUX_16b_2to1          MUX_4                (C         , Out[79:64]      ,dec[4]       , In[79:64]);
    MUX_16b_2to1          MUX_5                (C         , Out[95:80]      ,dec[5]       , In[95:80]);
    MUX_16b_2to1          MUX_6                (C         , Out[111:96]     ,dec[6]       , In[111:96]);
    MUX_16b_2to1          MUX_7                (C         , Out[127:112]    ,dec[7]       , In[127:112]);
    MUX_16b_2to1          MUX_8                (C         , Out[143:128]    ,dec[8]       , In[143:128]);
    MUX_16b_2to1          MUX_9                (C         , Out[159:144]    ,dec[9]       , In[159:144]);
    MUX_16b_2to1          MUX_10               (C         , Out[175:160]    ,dec[10]      , In[175:160]);
    MUX_16b_2to1          MUX_11               (C         , Out[191:176]    ,dec[11]      , In[191:176]);
    MUX_16b_2to1          MUX_12               (C         , Out[207:192]    ,dec[12]      , In[207:192]);
    MUX_16b_2to1          MUX_13               (C         , Out[223:208]    ,dec[13]      , In[223:208]);
    MUX_16b_2to1          MUX_14               (C         , Out[239:224]    ,dec[14]      , In[239:224]);
    MUX_16b_2to1          MUX_15               (C         , Out[255:240]    ,dec[15]      , In[255:240]);
    
        
endmodule
