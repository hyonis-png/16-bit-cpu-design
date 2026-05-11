module controlunit (
    input  wire [15:0] instruction,   
    output reg  [2:0]  alu_op,           
    output reg         writeenable,     
    output wire [2:0]  regaddy1, regaddy2, writeaddy         
);
    wire [3:0] op = instruction[15:12];
    assign writeaddy = instruction[11:9];
    assign regaddy1  = instruction[8:6];
    assign regaddy2  = instruction[5:3];

    always @(*) begin
        alu_op = 3'd0; writeenable = 1'b0;
        case (op)
            4'd1: begin alu_op = 3'd1; writeenable = 1'b1; end // ADD
            4'd2: begin alu_op = 3'd2; writeenable = 1'b1; end // SUB
            default: writeenable = 1'b0; // Opcode 0 is now a NOP
        endcase
    end
endmodule
