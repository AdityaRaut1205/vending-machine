`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2026 20:36:23
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
    input clk,
    input rst,
    input [1:0]in,          // 01=5rs, 10=10rs 
    output reg out,           
    output reg[1:0] change   //return the extra amount
    );
    
parameter s0=2'b00;      // initial state s0 where we have 0rs
parameter s1=2'b01;     // state s1 having 5 rs
parameter s2=2'b10;     // state s1 having 10 rs

reg[1:0] current, next;      //current_state and next_state

always @(posedge clk) begin
    if(rst==1)begin
        current=0;
        next=0;
        change=2'b00;
    end
    else
        current = next;
        
    case(current)
        s0:    //state s0 having 0 rs
            if(in==0)begin
                next= s0;
                out=0;
                change=2'b00;
            end  
            else if(in== 2'b01) begin
                next= s1;
                out=0;
                change=2'b00;
            end  
            else if(in== 2'b10) begin
                next= s2;
                out=0;
                change=2'b00;
            end  
            
        s1:    //state s1 having 5 rs
            if(in==0)begin
                next= s0;       //ideal vending machine returns back the amount
                out=0;          //if no further amount is deppsited
                change=2'b01;   // change returned 5rs
            end  
            else if(in== 2'b01) begin
                next= s2;
                out=0;
                change=2'b00;
            end  
            else if(in== 2'b10) begin
                next= s0;
                out=1;
                change=2'b00;
            end  
            
         s2:    //state s2 having 10 rs
            if(in==0)begin
                next= s0;       //ideal vending machine returns back the amount
                out=0;          //if no further amount is deppsited
                change=2'b10;   // change returned 10rs
            end  
            else if(in== 2'b01) begin
                next= s0;
                out=1;
                change=2'b00;
            end  
            else if(in== 2'b10) begin
                next= s0;
                out=1;
                change=2'b01;    //change returned is 5rs
            end       
    endcase
end    



endmodule
