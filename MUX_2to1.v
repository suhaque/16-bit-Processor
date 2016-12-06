`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2016 06:09:10 PM
// Design Name: 
// Module Name: MUX_2to1
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


module MUX_2to1(a,b,sel,out);

//inputs
input a,b, sel;

//outputs
output out;

//wires
wire s0, s1, s2;

//b sel
not(s0, sel);

and a0 (s1, a, sel);
and a1 (s2, b, s0);

//output
or (out, s1, s2);
endmodule
