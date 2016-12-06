`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2016 11:09:55 AM
// Design Name: 
// Module Name: Instruction
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


module Instruction_Mem(Addr,Out);
//inputs
input [5:0]Addr;
//outputs
output reg [15:0]Out;

//registers holding instructions
reg [15:0] Memory [15:0];

//Initializing
initial begin
Memory[0] = 16'b0110_0001_0001_0000; //LW $t1,0($R1)         [Memory 0]
Memory[1] = 16'b0110_0010_0010_0000; //LW $t2,0($R2)         [Memory 1]
Memory[2] = 16'b0110_0111_0010_0000; //LW $t7,0($R2)         [Memory 2]
Memory[3] = 16'b0000_0000_0000_0011; //ADD $t3,$t0,$t0       [Memory 3]  i = 0
Memory[4] = 16'b0000_0010_0011_0100; //ADD $t4,$t3,t2        [Memory 4]  i = n
//Loop              
Memory[5] = 16'b0000_0001_0001_0101; //ADD $t5,$t1,$t1       [Memory 5]
Memory[6] = 16'b0000_0010_0110_0111; //ADD $t2,$t2,$t7       [Memory 6]  i++ => $t2 = $t2 + 1
Memory[7] = 16'b0111_0101_0011_0000; //SW  $t5, 0($R3)       [Memory 7]
Memory[8] = 16'b0101_0010_0011_0101; //BNE $t2,$t3,Memory[5] [Memory 8] i<n

end

initial begin
Out = Memory[Addr];
end

endmodule
