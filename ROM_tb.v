module ROM_tb; 
reg [7:0]PC; 
wire [15:0] instruction;  
 

ROM dut (
.PC(PC), 
.instruction(instruction), 
); 



initial begin 
PC = 8'd0;
#10;

PC = 8'd1;
#10;

PC = 8'd10;
#10;

PC = 8'd255;
#10;


$stop;  

end
endmodule 