`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2016 10:24:12 AM
// Design Name: 
// Module Name: MUX_16b_8to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:AC
// 
//////////////////////////////////////////////////////////////////////////////////

//                  Enable, Select, Inputs[7:0],                output
module MUX_16b_8to1(E,      S,      I0,I1,I2,I3,I4,I5,I6,I7,    O);
//inputs
input E; 
input [2:0] S;
input [15:0] I0,I1,I2,I3,I4,I5,I6,I7;

//outputs
output O;

wire [15:0] A,B,C,D,E,F,G;

//format MUX_16b_2to1(A,B,Sel,Out);

endmodule
