`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2026 10:56:35 PM
// Design Name: 
// Module Name: PC_tb
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

module PC_tb; 
reg reset;  
reg clk; 
wire [7:0]PC; 
 

PC dut (
.reset(reset), 
.clk(clk), 
.PC(PC)
); 


initial clk = 0;
always #5 clk = ~clk; 


initial begin 
reset = 1;
#10;  
reset = 0; 
#10; 



$stop;  

end
endmodule