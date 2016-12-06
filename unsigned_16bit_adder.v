`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Siam Haque & David Kaddis 
// 
// Create Date: 11/23/2016 11:24:55 AM
// Design Name: 
// Module Name: unsigned_16bit_adder
// Project Name:  
// Target Devices: 
// Tool Versions: 
// Description: Making a 16-bit unsigned adder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FA_16bit(X, Y, Cin, Cout, Ov, S);

//inputs
input [15:0] X, Y;
input Cin;

//outputs
output [15:0] S;
output Cout, Ov; 

wire [14:0]w;

//adder for 16 bit unsigned
//full adder format      (a,     b,     cin,   sum,   cout)   
FA          f0           (X[0],  Y[0],  Cin,   S[0],  w[0]);
FA          f1           (X[1],  Y[1],  w[0],  S[1],  w[1]);
FA          f2           (X[2],  Y[2],  w[1],  S[2],  w[2]);
FA          f3           (X[3],  Y[3],  w[2],  S[3],  w[3]);
FA          f4           (X[4],  Y[4],  w[3],  S[4],  w[4]);
FA          f5           (X[5],  Y[5],  w[4],  S[5],  w[5]);
FA          f6           (X[6],  Y[6],  w[5],  S[6],  w[6]);
FA          f7           (X[7],  Y[7],  w[6],  S[7],  w[7]);
FA          f8           (X[8],  Y[8],  w[7],  S[8],  w[8]);
FA          f9           (X[9],  Y[9],  w[8],  S[9],  w[9]);
FA          f10          (X[10], Y[10], w[9],  S[10], w[10]);
FA          f11          (X[11], Y[11], w[10], S[11], w[11]);
FA          f12          (X[12], Y[12], w[11], S[12], w[12]);
FA          f13          (X[13], Y[13], w[12], S[13], w[13]);
FA          f14          (X[14], Y[14], w[13], S[14], w[14]);
FA          f15          (X[15], Y[15], w[14], S[15], Cout);

//overflow flag
xor(Ov, Cout, S[14]);

endmodule
