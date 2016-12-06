`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2016 08:30:24 PM
// Design Name: 
// Module Name: PC
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


module PC(in,out, clock);

//inputs
input [5:0] in;
input clock;

//outputs
output [5:0] out;

reg [5:0] out;

//initialize pc
initial begin
out = 6'b0;
end


always @(posedge clock) 
begin

out = in;

end
endmodule
