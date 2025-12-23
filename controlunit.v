module controlunit (
    input  wire [15:0] instruction,   

    output reg  [2:0]  alu_op,          
    output reg         writeenable,     
    output wire [2:0]  regaddy1,        
    output wire [2:0]  regaddy2,         
    output wire [2:0]  writeaddy         
);

    wire [3:0] instrucop = instruction[15:12];
    wire [2:0] reg4res   = instruction[11:9];
    wire [2:0] reg41     = instruction[8:6];
    wire [2:0] reg42     = instruction[5:3];

    assign regaddy1  = reg41; 
    assign regaddy2  = reg42; 
    assign writeaddy = reg4res; 

    always @(*) begin
        alu_op      = 3'd0;
        writeenable = 1'b0;

        case (instrucop)
            4'd0: begin 
                alu_op      = 3'd0;
                writeenable = 1'b1;
            end
            4'd1: begin 
                alu_op      = 3'd1;
                writeenable = 1'b1;
            end
            4'd2: begin 
                alu_op      = 3'd2;
                writeenable = 1'b1;
            end
            4'd3: begin 
                alu_op      = 3'd3;
                writeenable = 1'b1;
            end
            4'd4: begin 
                alu_op      = 3'd4;
                writeenable = 1'b1;
            end
            4'd5: begin 
                alu_op      = 3'd5;
                writeenable = 1'b1;
            end
            default: begin
                writeenable = 1'b0;
            end
        endcase
    end

endmodule
