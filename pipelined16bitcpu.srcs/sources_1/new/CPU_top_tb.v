`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2026 10:51:21 PM
// Design Name: 
// Module Name: CPU_top_tb
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


module CPU_top_tb; 
    reg clk; 
    reg reset;


CPU_top dut (
.clk(clk), 
.reset(reset)
);    
always #5 clk = ~clk; 
initial begin
clk = 0; 
reset = 1;
 #20; 
 reset = 0; 
#200; 
$stop;
end
endmodule
