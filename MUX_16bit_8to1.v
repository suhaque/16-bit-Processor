`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2016 12:19:59 AM
// Design Name: 
// Module Name: MUX_16bit_8to1
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


module MUX_16bit_8to1(Enable, A, B, C, D, E, F, G, H,  sel, out);

//inputs 
input Enable; 
input [15:0]A,B,C,D,E,F,G,H;
input [2:0] sel;

//outputs
output [15:0] out;

wire [15:0] W0, W1, W2, W3, W4, W5;


    //FORMAT MUX_16b_2to1(a,b,sel,out);
    MUX_16b_2to1         MUX4        (A   , B   , sel[0]  ,  W0); 
    MUX_16b_2to1         MUX3        (C   , D   , sel[0]  ,  W1); 
    MUX_16b_2to1         MUX2        (E   , F   , sel[0]  ,  W2);     
    MUX_16b_2to1         MUX1        (G   , H   , sel[0]  ,  W3);
        
    
    //FORMAT MUX_16b_2to1(a,b,sel,out);
    MUX_16b_2to1         MUX6        (W0  , W1  , sel[1]  , W4);
    MUX_16b_2to1         MUX5        (W2  , W3  , sel[1]  , W5);
    
    //FORMAT MUX_16b_2to1(a,b,sel,out);
    MUX_16b_2to1         MUX7        (W4  , W5  , sel[2]   , out);        

endmodule
