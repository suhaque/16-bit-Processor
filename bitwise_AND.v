`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2016 11:24:55 AM
// Design Name: 
// Module Name: bitwise_AND
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


module bitwise_AND(X, Y, Out);

//inputs
input [15:0] X,Y;

//output
output [15:0] Out;

and bit_and[15:0](Out,X,Y);

endmodule
