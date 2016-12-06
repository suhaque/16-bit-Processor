`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2016 11:09:55 AM
// Design Name: 
// Module Name: shift_left_two
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


module shift_left_two(in,out);
//inputs
input [15:0]in;

//outputs
output [15:0]out;

assign out[0] = 0;
assign out[1] = 0;
assign out[2] = in[0];
assign out[3] = in[1];
assign out[4] = in[2];
assign out[5] = in[3];
assign out[6] = in[4];
assign out[7] = in[5];
assign out[8] = in[6];
assign out[9] = in[7];
assign out[10] = in[8];
assign out[11] = in[9];
assign out[12] = in[10];
assign out[13] = in[11];
assign out[14] = in[12];
assign out[15] = in[13];    

endmodule
