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


module MIPS(clk,PC, R1,R2,R3,instruction);
//inputs
input clk;

//outputs
output wire [5:0] PC; 
output [15:0] R1,R2,R3; //R1*R2 = R3
output [15:0]instruction;


wire [5:0]ProgramCount; //PC
wire [5:0]ProgramCount_new;
wire cin,cout;
wire [15:0] ALU_B;
wire [10:0] Control;
//wire [15:0]instruction;         //wire out of instruction memory
wire [15:0]A,B,C;               //wire out of register file
wire [3:0]Caddr;                //choosing between Rt or Rd 
wire [15:0]ALU_out;             //wire from the output of the ALU
wire [15:0]ALU_Src;             //chooses which input 2 goes into the ALU 
wire Lt, Eq,nEq, Gt,oV;         //Flags
wire [15:0]Mem_Out;             //Memory Out
wire Branch_Select;
wire [15:0] LW;                 //LW sign extended
wire [5:0] branch_add;          //branch address
wire [3:0] data_addr;

//program counter PC(in,out, clock);
PC pc(ProgramCount, PC, clk);

//instruction memory Instruction_Mem(Addr,Out);
Instruction_Mem im(PC, instruction);

//control initialization Control_Unit(opcode, control)
Control_Unit cu(instruction[15:12], Control);

//regdest mux 
MUX_4b_2to1 regdest(instruction[7:4],instruction[3:0], Control[9], Caddr); 

//regfile Reg_File_16b(A,B,C,Aaddr,Baddr,Caddr,Load,Clear,Clk);
Reg_File16b regfile(A,B,C, instruction[11:8], instruction[7:4],Caddr,Control[7], Control[6],clk);

//Sign_Extend(In,Out);
Sign_Extend lW (instruction[3:0], LW);

//ALU Source Mux
//MUX_4bit_2to1(A,B,Sel,Out)
MUX_16b_2to1 alusrc(B,LW,Control[0],ALU_B);

//ALU (X, Y, Out, Cin, Cout, Lt, Eq, Gt, oV, opcode);
ALU alu(A,ALU_B,ALU_out,cin, cout, Lt, Eq,Gt, oV,Control[3:1]);

conv16b_to_4b   conv(ALU_out,data_addr);

//DataMemory Data_Memory(Clk, MemWrite,  Addr,     In, Out,    r1,r2,r3);
Data_Memory    dm       (clk, Control[5],data_addr,B,  Mem_Out,R1,R2,R3);

//mem to reg mux
MUX_16b_2to1 mtor(Mem_Out,ALU_out, Control[8], C);

//increment PC FA_6bit_adder(X, Y, Cin, Cout, Ov, S);
FA_6bit_adder pcnext(PC, 6'b000001, 1'b0, cout, Ov, ProgramCount_new);

//turning Eq flag to nEq
not (nEq, Eq);

//branch flag
assign Branch_Select = nEq & Control[4];
//and(Branch_Select,Control[5], nEq);

sign_extend_6b branchaddress (instruction[3:0],branch_add);
//branch destination
// MUX_2to1(a,b,sel,out)
MUX_6bit_2to1 PC_new(ProgramCount_new, branch_add, Branch_Select,ProgramCount);

endmodule
