module CPU_top_tb; 
    reg clk; 
    reg reset;


cpu_top dut (
.clk(clk), 
.reset(reset)
);    
always #5 clk = ~clk; 
initial begin
clk = 0; 
reset = 0; 
#10; 
$stop;
end
endmodule
