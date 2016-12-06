`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2016 08:57:03 AM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(Clk, MemWrite, Addr, In, Out);
//inputs
input Clk, MemWrite;
input [3:0] Addr;
input [15:0]In;

//outputs
output [15:0]Out;

reg [15:0]Memory[15:0];

initial begin
Memory[0] = 16'h0000; //0
Memory[1] = 16'h0001; //1
Memory[2] = 16'h0080; //128
Memory[3] = 16'h0092; //146
end

always @(posedge Clk)

begin
//write
if(MemWrite)

begin
Memory[Addr] = In;

end

end
    
//reading memory

assign Out = Memory[Addr];


endmodule
