`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2016 03:21:21 PM
// Design Name: 
// Module Name: LT
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


module LT(X,Y,S,lt);

//input 
input [15:0] X, Y;

//output
output [15:0]S;
output lt;

//wires
wire CoutLt, OvLt;
wire [15:0] Slt;  

//format = (X, Y, Cin, Cout, Ov, S);
twos_complement_add_sub   Subtract  (X, Y, 1'b1, CoutLt, OvLt, Slt);

//check sign bit to see if positive or negative
//Tmplt = 1, if less
//Tmplt = 0, if great or equal
or (lt, 1'b0, S[15]);

//16-bit masked flag == 0 if X>=Y
//16-bit masked flag == 1 if X<Y

and maskedflag[15:0] (S, 1'b1, lt);

endmodule
