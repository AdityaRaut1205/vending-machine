`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2026 21:11:46
// Design Name: 
// Module Name: vending_machine_tb
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


module vending_machine_tb;
    //inputs
    reg clk;
    reg[1:0] in;
    reg rst;
    
    //output
    wire out;
    wire[1:0] change;
    
    vending_machine dut(
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out),
        .change(change));
        
        initial begin
            rst=1;   //initially rst=1 to flush if any garbage value is there
            clk=0;
            #6 rst=0;
            in=1;
            #11 in=1;
            #16 in=1;
            #25 $finish;
        end
        always #5 clk=!clk ;

endmodule
