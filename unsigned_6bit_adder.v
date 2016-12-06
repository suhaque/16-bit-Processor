`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2016 09:51:05 AM
// Design Name: 
// Module Name: unsigned_6bit_adder
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


module FA_6bit_adder(X, Y, Cin, Cout, Ov, S);

//inputs
input [5:0] X, Y;
input Cin;

//outputs
output [5:0] S;
output Cout, Ov; 

//wires
wire [4:0]w;
wire [5:0]t;

//2s complement for adder
xor xor0  (t[0],  Y[0],  Cin);
xor xor1  (t[1],  Y[1],  Cin);
xor xor2  (t[2],  Y[2],  Cin);
xor xor3  (t[3],  Y[3],  Cin);
xor xor4  (t[4],  Y[4],  Cin);
xor xor5  (t[5],  Y[5],  Cin);

//adder for 16 bit unsigned
//full adder format      (a,     b,     cin,   sum,   cout)   
FA          f0           (X[0],  t[0],  Cin,   S[0],  w[0]);
FA          f1           (X[1],  t[1],  w[0],  S[1],  w[1]);
FA          f2           (X[2],  t[2],  w[1],  S[2],  w[2]);
FA          f3           (X[3],  t[3],  w[2],  S[3],  w[3]);
FA          f4           (X[4],  t[4],  w[3],  S[4],  w[4]);
FA          f5           (X[5],  t[5],  w[4],  S[5],  Cout);

//overflow flag
xor(Ov, Cout, S[4]);

endmodule
