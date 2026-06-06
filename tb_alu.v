`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 23:11:58
// Design Name: 
// Module Name: tb_alu
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


module tb_alu(

    );
    reg [7:0]A,B;
    reg [2:0] opcode;
    reg clk,reset;
    wire [7:0] result;
    wire [15:0] mul_result;
    wire zero,carry,overflow;
    
    ALU dut(clk,reset,A,B,opcode,zero,carry,overflow,result,mul_result);
    initial begin
        A=0;
        B=0;
        opcode=0;
        clk=0;
        reset=1;end 
        
    always #10 clk=~clk;
    
    initial begin
         #5 A=8'hFF;
            B=8'hff;
         #10 reset=0;
            
         #20 opcode=3'd0;
         #20 opcode=3'd1;
         #20 opcode=3'd2;
         #20 opcode=3'd3;
         #20 opcode=3'd4;
         #20 opcode=3'd5;
         #20 opcode=3'd6;
         #20 opcode=3'd7;
         
         #30;
         $finish;
         
         end
         initial $monitor("t=%0t A=%b B=%b opcode=%b result=%b mul_result=%b",$time,A,B,opcode,result,mul_result);
         
endmodule
