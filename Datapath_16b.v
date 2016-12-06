`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2016 02:01:51 PM
// Design Name: 
// Module Name: Datapath_16b
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


module MIPS(clk,PC, R1,R2,R3);
//inputs
input clk;

//outputs
output wire [5:0] PC; 
output [15:0] R1,R2,R3; //R1*R2 = R3


wire [5:0]ProgramCount; //PC
wire [5:0]ProgramCount_new;
wire [15:0]PC_out;
wire cin,cout;
wire [10:0] Control;
wire [15:0]instruction;     //wire out of instruction memory
wire [15:0]A,B,C;           //wire out of register file
wire [3:0]Caddr;            //choosing between Rt or Rd 
wire [15:0]ALU_out;         //wire from the output of the ALU
wire [5:0]Sign_Extend_Branch;     //sign extend for branch
wire [5:0]Sign_Extend_lw;    //mem address
wire [15:0]ALU_Src;         //chooses which input 2 goes into the ALU 
wire Lt, Eq,nEq, Gt,oV;         //Flags
wire [15:0]Mem_Out;         //Memory Out
wire [15:0]MemToReg_Out;       //mem to reg 
wire Branch_Select;


//program counter
PC pc(ProgramCount_new, PC, clk);
//instruction memory
Instruction_Mem im(PC, instruction);
//control initialization
Control_Unit cu(instruction[15:12], Control);
//regdest mux
MUX_4bit_2to1 regdest(instruction[7:4],instruction[3:0], Control[10], Caddr); 

//regfile Reg_File_16b(A,B,C,Aaddr,Baddr,Caddr,Load,Clear,Clk);
Reg_File16b regfile(A,B,C, instruction[11:8], instruction[7:4],instruction[3:0],Control[6], 1'b0,clk);

//signextend
Sign_Extend se(instruction[3:0], Sign_Extend);

//ALU Source Mux
MUX_4bit_2to1 alusrc(B,Sign_Extend,Control[0],ALU_Src);

//ALU
ALU alu(A,B,ALU_out,cin, cout, Lt, Eq,Gt, oV,Control[3:1]);

//DataMemory Data_Memory(Clk, MemWrite, Addr, In, Out,r1,r2,r3);
Data_Memory dm(clk, Control[5],ALU_out,B,Mem_Out);

//mem to reg mux
MUX_4bit_2to1 mtor(Mem_Out,ALU_out, Control[8],MemToReg_Out);

//increment PC FA_6bit_adder(X, Y, Cin, Cout, Ov, S);
FA_6bit_adder pcnext(PC, 6'b000001, 1'b0, cout, Ov, ProgramCount_new);

//branch adress
assign Branch_Select = nEq & Control[5];
//and(Branch_Select,Control[5], nEq);
//branch destination
MUX_4bit_2to1 PC_new(ProgramCount_new, Sign_Extend, Branch_Select,ProgramCount);

assign R1 = Mem_Out;

endmodule
