module PC (
    input  wire reset,
    input  wire clk,
    input  wire enable,
    output reg [7:0] PC
);

always @(posedge clk) begin
    if (reset)
        PC <= 8'd0;
    else if (enable)
        PC <= PC + 8'd1;
end

endmodule