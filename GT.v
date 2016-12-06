`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2016 03:21:21 PM
// Design Name: 
// Module Name: GT
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


module GT(X,Y,S,gt);

//input 
input [15:0] X, Y;

//output
output [15:0]S;
output gt;

//wires
wire CoutGt, OvGt, TmpGt, TmpGt_not, nEQ;
wire [15:0] Sgt;  

//format = (X, Y, Cin, Cout, Ov, S);
twos_complement_add_sub   Subtract  (X, Y, 1'b1, CoutGt, OvGt, Sgt);

//or with everybit of sum to see if perfectly equal

//if X-Y = 0, nEq == 0
//else X-Y != 0, nEq == 1
or(nEq,S[0],S[1],S[2],S[3],S[4],S[5],S[6],S[7],S[8],S[9],S[10],S[11],S[12],S[13],S[14],S[15]);

//check sign bit to see if positive or negative
//TmpGT = 1, if less
//TmpGt = 0, if great or equal
or (TmpGt_not, 1'b0, S[15]);

//flip-bit to indicate, greater or equal =1. less than = 0
not flipbit (TmpGt, TmpGt_not);

//flag to determine if it is greater than
and (gt, nEq, TmpGt);

//16-bit masked flag == 1 if X>Y
//16-bit masked flag == 0 if X<=Y

and maskedflag[15:0] (S, 1'b1, gt);

endmodule
