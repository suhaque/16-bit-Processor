`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 12:08:15 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File(readAddr1, readAddr2, writeAddr, writeData, readData1, readData2, RegWrite);
     input [4:0]readAddr1, readAddr2, writeAddr;
     input [15:0]writeData;     //address of the register to be written on to.
     input RegWrite;    //RegWrite - register write signal; writeReg-the destination register.
     
     output [15:0]readData1, readData2;
     
     reg [15:0]readData1, readData2;
     
     reg [15:0]RegMemory[0:31];
     
     integer placeVal, i, j, writeRegINT=0, readReg1INT=0, readReg2INT=0;
     
     initial
     begin
       for(i=0 ; i<16 ; i=i+1)
       begin
              for(j=0 ; j<16 ; j= j+1)
                RegMemory[i][j] = 1'b0;
       end
     end
     
     always@ (RegWrite or readAddr1 or readAddr2 or writeAddr or writeData)
     begin
       
        if(RegWrite == 1)
        begin
          
          placeVal = 1;
          readReg1INT=0;
          readReg2INT=0;
          for(i=0 ; i<5 ; i=i+1)
          begin
               if(readAddr1[i] == 1)
                  readReg1INT = readReg1INT + placeVal;
                  
               if(readAddr2[i] == 1)
                  readReg2INT = readReg2INT + placeVal; 
                    
               placeVal = placeVal * 2;
          end
          
          
          for(i=0 ; i<16 ; i=i+1)
          begin
              readData1[i] = RegMemory[readReg1INT][i];
              readData2[i] = RegMemory[readReg2INT][i];
          end
          
          
          
          //binary to decimal address translation.
          placeVal = 1;
          writeRegINT=0;
          for(i=0 ; i<5 ; i=i+1)
          begin
               if(writeAddr[i] == 1)
                  writeRegINT = writeRegINT + placeVal;
                  
               placeVal = placeVal * 2;
          end
          
          $display("before writing %d at %d", writeData, writeRegINT);
          for(i=0 ; i<16 ; i=i+1)
          begin
                RegMemory[writeRegINT][i] = writeData[i];
          end
          $display("after writing %d at %d", writeData, writeRegINT);
            
        end  // Register Write
        
        if(RegWrite == 0)
        begin
            //binary to decimal address translation.
          placeVal = 1;
          readReg1INT=0;
          readReg2INT=0;
          for(i=0 ; i<5 ; i=i+1)
          begin
               if(readAddr1[i] == 1)
                  readReg1INT = readReg1INT + placeVal;
                  
               if(readAddr2[i] == 1)
                  readReg2INT = readReg2INT + placeVal; 
                    
               placeVal = placeVal * 2;
          end
          
          
          for(i=0 ; i<16 ; i=i+1)
          begin
              readData1[i] = RegMemory[readReg1INT][i];
              readData2[i] = RegMemory[readReg2INT][i];
          end
          
          
        end// Register Read
          
     end  //always@
     
endmodule  