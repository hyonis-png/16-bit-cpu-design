module ROM (
    input  wire [7:0]  PC,
    output reg  [15:0] instruction
);

    always @(*) begin
        case (PC)
            // Example: Opcode 4'b0001 is ADD
            // Instruction format: Opcode(4) | DestReg(3) | SrcReg1(3) | SrcReg2(3) | Unused(3)
            
            // PC 0: ADD R2, R0, R1  -> (5 + 3 = 8)
            8'd0: instruction = 16'b0001_010_000_001_000; 
            
            // PC 1: NOP (No Operation) - Important for pipeline stalls!
            8'd1: instruction = 16'h0000; 
            
            // PC 2: ADD R3, R2, R0  -> (8 + 5 = 13)
            8'd2: instruction = 16'b0001_011_010_000_000;
            
            default: instruction = 16'h0000;
        endcase
    end
endmodule