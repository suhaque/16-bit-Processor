`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2016 11:24:55 AM
// Design Name: 
// Module Name: bitwise_OR
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


module bitwise_OR(X, Y, Out);

//inputs
input [15:0] X,Y;

//outputs
output [15:0] Out;

or bit_or[15:0] (Out, X, Y);

endmodule
