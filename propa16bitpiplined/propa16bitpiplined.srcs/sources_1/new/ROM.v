module ROM (
    input  wire [7:0]  PC,
    output reg  [15:0] instruction
);
    always @(*) begin
        case (PC)
            8'd0:    instruction = 16'b0001_010_000_001_000; // ADD R2 = R0 + R1
            default: instruction = 16'h0000;                // NOP
        endcase
    end
endmodule