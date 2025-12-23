module ROM (
input wire [7:0]PC, 
output  wire [15:0] instruction   
);

reg [15:0] mem [0:255]; 
integer i; 
initial begin
for (i = 0; i < 256; i = i + 1) 
mem[i] = 16'd0; 
    end


assign instruction = mem[PC]; 

endmodule
 