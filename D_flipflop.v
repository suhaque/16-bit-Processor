`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AUTHOR: 
// Create Date: 
// Module Name: D_FF
// ECE425L 
// Purpose: 
// Variables:

//////////////////////////////////////////////////////////////////////////////////

//          Clock, Reset, Input, Output                                
module D_FF(Clk  , reset, D    , Q);
    input D, Clk, reset;
    output reg Q;
    
    always @(posedge Clk or negedge reset)
        if (~reset)
            begin
                Q <= 1'b0;
            end 
        else
            begin
                Q <= D;
            end
endmodule 