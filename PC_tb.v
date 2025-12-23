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