`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2016 10:57:36 AM
// Design Name: 
// Module Name: MUX_16b_2to1
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


module MUX_16b_2to1(a,b,sel,out);

//inputs
input [15:0] a,b; 
input sel;

//outputs
output [15:0]out;

//wires
wire s0, s1, s2;

//b sel
not(s0, sel);

and a0[15:0] (s1, a, sel);
and a1[15:0] (s2, b, s0);

//output
or or0[15:0] (out, s1, s2);
endmodule
