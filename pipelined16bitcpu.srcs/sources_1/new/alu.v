module alu (
    input  wire [15:0] A, 
    input  wire [15:0] B, 
    input  wire [2:0]  control, 
    output reg  [15:0] Y 
); 

    always @(*) begin
        case (control)
            3'd0: Y = A + B;
            3'd1: Y = A - B;
            3'd2: Y = A & B;
            3'd3: Y = A | B;
            3'd4: Y = A ^ B;
            3'd5: Y = (A < B) ? 16'd1 : 16'd0;
            default: Y = 16'd0;
        endcase
    end

endmodule