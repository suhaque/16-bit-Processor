`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2016 11:24:55 AM
// Design Name: 
// Module Name: BNE
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

//if output is zero, flag = 0
//if output is not zero, flag = 1

module BNE(X,Y,S,nEq);

//inputs
input [15:0]X,Y;

//outputs
//sum
output [15:0]S;
//nEQ flag
output nEq;

//Carryout, Overflow adders
wire Cout, Ov_adders;

//subtract to do comparison
//format                              (a, b,  cin,  cout, ov,        s)                    
twos_complement_add_sub   Subtract    (X, Y,  1'b1, Cout, Ov_adders, S);

//BNE Flag
//if X-Y = 0, Flag == 0
//else X-Y != 0, Flag == 1
or(nEq,S[0],S[1],S[2],S[3],S[4],S[5],S[6],S[7],S[8],S[9],S[10],S[11],S[12],S[13],S[14],S[15]);

endmodule
