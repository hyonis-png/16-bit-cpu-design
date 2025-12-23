module PC (
input wire reset, 
input wire clk, 
output reg [7:0]PC 
); 



always @(posedge clk) begin
    if (reset)
        PC <= 8'd0;   
    else
        PC <= PC + 8'b1;
end
endmodule 