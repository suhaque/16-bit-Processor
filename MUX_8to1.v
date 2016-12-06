`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2016 12:35:32 AM
// Design Name: 
// Module Name: MUX_8to1
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


module MUX_8to1(Enable, A, B, C, D, E, F, G, H,  sel, out);

//inputs 
input Enable; 
input A,B,C,D,E,F,G,H;
input [2:0] sel;

//outputs
output out;

//wires
wire [2:0]w;
wire [7:0]o;
wire and_out;

//sel[0]bar
not (w[0],sel[0]);

//sel[1]bar
not (w[1], sel[1]);

//sel[2]nar
not (w[2], sel[2]);


and and0 (o[0], w[0],    w[1],      w[2],      A);
and and1 (o[1], w[0],    w[1],      sel[2],    B);
and and2 (o[2], w[0],    sel[1],    w[2],      C);
and and3 (o[3], w[0],    sel[1],    sel[2],    D);
and and4 (o[4], sel[0],  w[1],      w[2],      E);
and and5 (o[5], sel[0],  w[1],      sel[2],    F);
and and6 (o[6], sel[0],  sel[1],    w[2],      G);
and and7 (o[7], sel[0],  sel[1],    sel[2],    H);

//or all outputs
or (and_out, o[0], o[1], o[2], o[3], o[4], o[5], o[6], o[7]);

//and with enable
and mux_8to1 (out, and_out, Enable);

endmodule

