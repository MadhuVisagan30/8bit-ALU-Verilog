`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 18:30:47
// Design Name: 
// Module Name: ALU
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


module ALU(input clk,reset,input [7:0] A,B,input [2:0] opcode,output reg zero,carry,overflow,output reg [7:0] result,
output reg [15:0] mul_result);
    wire [8:0] temp;
    wire [7:0] temp2;
    assign temp=A+B;
    assign temp2=A-B;
    always @(posedge clk or posedge reset)begin
    if(reset)begin
        mul_result<=0;
        result<=0;
        carry<=0;
        overflow<=0;
        zero<=0;end
     else begin
        mul_result<=0;
        carry<=0;
        overflow<=0;
        zero<=0;
        case(opcode)
            3'b000:begin 
                {carry,result}<=temp; 
                overflow<=((A[7]^temp[7])&(B[7]^temp[7]));
                zero<=(temp[7:0]==0);
             end   
            3'b001:begin result<=temp2;
                         overflow<=((A[7]^B[7])&(A[7]^temp2[7]));
                         zero<=(temp2==0);end
            3'b010:begin
                mul_result<=A*B;
                result<=0;
                zero<=((A*B)==0);end                
            3'b011:begin result<=A&B;
                         zero<=((A&B)==0);end      
            3'b100:begin result<=A|B;zero<=((A|B)==0);end
            3'b101:begin result<=A^B;zero<=(A==B);end
            3'b110:begin result<=A>>1;zero<=((A>>1==0));end
            3'b111:begin result<=A<<1;zero<=((A<<1==0));end
            default:result <= 0; endcase
            end  
            end     
endmodule
