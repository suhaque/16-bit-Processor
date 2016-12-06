`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2016 03:25:47 PM
// Design Name: 
// Module Name: FA
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


module FA(a,b,cin,s, cout);
//input
input a, b, cin;

//output
output s, cout;
    
wire w1,w2,w3;

//sum = a ^ b ^ cin
xor xor1(w1,a,b);
xor xor2(s,w1,cin);

// cout = (a & b) | (a & cin) | (b & cin)
and and1(w2,a,b);
and and2(w3,w1,cin);

or c_out (cout,w2,w3);
 
endmodule
