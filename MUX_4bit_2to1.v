`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2016 01:28:49 PM
// Design Name: 
// Module Name: MUX_4bit_2to1
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


module MUX_4bit_2to1(A,B,Sel,Out);
//inputs
input [3:0]A,B;
input Sel;

//outputs
output [3:0]Out;

MUX_2to1 MUX4bit[3:0] (A,B,Sel,Out);

endmodule
