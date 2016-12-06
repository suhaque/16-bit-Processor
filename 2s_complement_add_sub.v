`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2016 11:24:55 AM
// Design Name: 
// Module Name: 2s_complement_add_sub
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


module twos_complement_add_sub(X, Y, Cin, Cout, Ov, S);

//inputs
input [15:0] X, Y;
input Cin;

//outputs
output [15:0] S;
output Cout, Ov; 

//wires
wire [14:0]w;
wire [15:0]t;

//2s complement for adder
xor xor0  (t[0],  Y[0],  Cin);
xor xor1  (t[1],  Y[1],  Cin);
xor xor2  (t[2],  Y[2],  Cin);
xor xor3  (t[3],  Y[3],  Cin);
xor xor4  (t[4],  Y[4],  Cin);
xor xor5  (t[5],  Y[5],  Cin);
xor xor6  (t[6],  Y[6],  Cin);
xor xor7  (t[7],  Y[7],  Cin);
xor xor8  (t[8],  Y[8],  Cin);
xor xor9  (t[9],  Y[9],  Cin);
xor xor10 (t[10], Y[10], Cin);
xor xor11 (t[11], Y[11], Cin);
xor xor12 (t[12], Y[12], Cin);
xor xor13 (t[13], Y[13], Cin);
xor xor14 (t[14], Y[14], Cin);
xor xor15 (t[15], Y[15], Cin);  

//adder for 16 bit unsigned
//full adder format      (a,     b,     cin,   sum,   cout)   
FA          f0           (X[0],  t[0],  Cin,   S[0],  w[0]);
FA          f1           (X[1],  t[1],  w[0],  S[1],  w[1]);
FA          f2           (X[2],  t[2],  w[1],  S[2],  w[2]);
FA          f3           (X[3],  t[3],  w[2],  S[3],  w[3]);
FA          f4           (X[4],  t[4],  w[3],  S[4],  w[4]);
FA          f5           (X[5],  t[5],  w[4],  S[5],  w[5]);
FA          f6           (X[6],  t[6],  w[5],  S[6],  w[6]);
FA          f7           (X[7],  t[7],  w[6],  S[7],  w[7]);
FA          f8           (X[8],  t[8],  w[7],  S[8],  w[8]);
FA          f9           (X[9],  t[9],  w[8],  S[9],  w[9]);
FA          f10          (X[10], t[10], w[9],  S[10], w[10]);
FA          f11          (X[11], t[11], w[10], S[11], w[11]);
FA          f12          (X[12], t[12], w[11], S[12], w[12]);
FA          f13          (X[13], t[13], w[12], S[13], w[13]);
FA          f14          (X[14], t[14], w[13], S[14], w[14]);
FA          f15          (X[15], t[15], w[14], S[15], Cout);

//overflow flag
xor(Ov, Cout, S[14]);

endmodule
