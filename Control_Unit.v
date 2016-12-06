`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2016 06:15:04 PM
// Design Name: 
// Module Name: Control_Unit
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
//////////////////////////////////////////////////////////////////////////////////
 
module Control_Unit(opcode, control);

//inputs
input [3:0]opcode;

//outputs
output reg [10:0] control;

always @(*)
case(opcode)
//control
//Control Unit(opcode,control): RegDst(B or C select), 
//MemtoReg(select between memory or ALU Results), RegWrite(Load), Clear, MemWrite, Branch, ALUOp(3b), ALUSrc

//Add
0 : control = 10'b1_0_1_0_0_0_000_0;
//Sub 
1 : control = 10'b1_0_1_0_0_0_001_0;
//AND
2 : control = 10'b1_0_1_0_0_0_010_0;
//OR
3 : control = 10'b1_0_1_0_0_0_011_0;
//SLT
4 : control = 10'b1_0_1_0_0_0_100_0;
//BNE
5 : control = 10'b0_0_0_0_0_1_101_0;
//LW
6 : control = 10'b0_1_1_0_0_0_000_1;
//SW
7 : control = 10'b0_1_0_0_1_0_000_1;
 
endcase


endmodule
