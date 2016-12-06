`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AUTHOR: 
// Module Name: Register16b
// Create Date: 
// ECE425L 
// Purpose: Develope a 16bit register using d flip flops
//////////////////////////////////////////////////////////////////////////////////

//                 Clock,AsyncReset,RegInput,RegOutput               
module Register16b(Clk  ,     reset,      In,Out);
    input [15:0] In;
    input Clk, reset;
    output [15:0] Out;
    
    //***** 16 bit Parallel in, Parallel out register
    //                  Clock, Reset, Input, Output                                
    D_FF    DFF [15:0] (Clk  , reset, In    , Out);
    
endmodule
