`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: David Kaddis & Siam Haque
// 
// Create Date: 11/19/2016 05:38:15 PM
// Design Name: 
// Module Name: ALU
// Project Name: ALU module
// Target Devices: 
// Tool Versions: 
// Description: Develop an RTL models of an ALU to support the instruction set given for this project. Your ALU should
//perform operations that support the mathematical and logical instructions as well as offset calculation for
//memory access and branching. To support these requirements, your ALU should minimally implement:
//1. Unsigned addition of 16-bit numbers
//2. 2s-complement addition/subtraction of 16-bit numbers
//3. Logical "and"
//4. Logical "or"
//5. Set on less than
//6. Branch if not equal
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(X, Y, Out, Cin, Cout, Lt, Eq, Gt, oV, opcode);

//inputs
//16-bit inputs X and Y
input [15:0] X, Y;
//cin
input Cin;
input [2:0]opcode;

//outputs
//less than, equal, greater than,cout and overflow
output Cout,Lt,Eq,Gt,oV;
//Ouput Word Result
output [15:0]Out;

//wires to relay the outputs
wire [15:0] o0, o1, o2, o3, o4, o5, o6, o7;        //7 outputs from 7 different Alu functions
wire [1:0]C;        //Cout for Add/Sub
wire [1:0]Overflow; //Overflow from the Add/Sub
wire nEq;           //not equal flag

//unsigned addition
//format                               (a, b, cin, cout, ov, s)   
//opcode: 000             
twos_complement_add_sub     addition   (X, Y, 1'b0, C[0], Overflow[0], o0);

//2's complement add/sub
//format                               (a, b, cin, cout, ov, s)                
//opcode: 001
twos_complement_add_sub  subtraction   (X, Y, 1'b1, C[1], Overflow[1], o1);

or  (oV, Overflow[0], Overflow[1]);

//logical "and"
//opcode: 010
bitwise_AND a(X, Y, o2);

//logical "or"
//opcode: 011
bitwise_OR b(X, Y, o3);

//set on less than
//format LT(X,Y,S)
//opcode: 100
LT  set_lt (X, Y, o4, Lt);

//Branch if not equal
//BNE(X,Y,S,nEq);
//opcode: 101
BNE branch (X,Y, o5, nEq); 

//eq flag
not eq_flag (Eq, nEq);

//gt flag
GT gt_than (X, Y, o6,  Gt);

//Add immediate
//opcode 110
FA_16bit Addimmediate (X, Y, Cin, Cout, Ov, o6);

//selecting the output
//format MUX_16bit_8to1(Enable, A, B, C, D, E, F, G, H,  sel, out);
//enable is always on for the ALU
//selection for 6 and 7 are set to 0 as it serves no function
MUX_16bit_8to1 m(1'b1, o0, o1, o2, o3, o4, o5, o6, 16'b0, opcode, Out);

endmodule
