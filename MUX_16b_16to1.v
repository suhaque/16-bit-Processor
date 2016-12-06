`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2016 10:24:12 AM
// Design Name: 
// Module Name: MUX_16b_16to1
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


module MUX_16b_16to1(E,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,S,O);
//inputs
input E;
input [3:0]S;
input [15:0] I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15;

//outputs
output [15:0] O;

wire [15:0] W0,W1;


//FORMAT MUX_16bit_8to1(Enable, A, B, C, D, E, F, G, H,  sel, out);
MUX_16bit_8to1 mux  (E,  I0,  I1,  I2,  I3,  I4,  I5,  I6,  I7,  S[2:0], W0);
MUX_16bit_8to1 mux_ (E,  I8,  I9,  I10, I11, I12, I13, I14, I15, S[2:0], W1);

//MUX_16b_2to1(a,b,sel,out);
MUX_16b_2to1 muxtwo (W0,W1, S[3], O);

endmodule
