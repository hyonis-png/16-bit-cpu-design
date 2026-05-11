module regfiles (
    input  wire        clk,
    input  wire        enable,      
    input  wire [2:0]  regaddy1,
    output reg  [15:0] regvalue1,

    input  wire [2:0]  regaddy2,
    output reg  [15:0] regvalue2,

    input  wire [2:0]  writeaddy,
    input  wire [15:0] writevalue
);

    // Registers
    reg [15:0] R0, R1, R2, R3, R4, R5, R6, R7;

    // 🔥 Initialize with useful values
    initial begin
        R0 = 16'd5;
        R1 = 16'd3;
        R2 = 16'd0;
        R3 = 16'd0;
        R4 = 16'd0;
        R5 = 16'd0;
        R6 = 16'd0;
        R7 = 16'd0;
    end

    // =========================
    // READ PORT 1
    // =========================
    always @(*) begin
        case (regaddy1)
            3'd0: regvalue1 = R0;
            3'd1: regvalue1 = R1;
            3'd2: regvalue1 = R2;
            3'd3: regvalue1 = R3;
            3'd4: regvalue1 = R4;
            3'd5: regvalue1 = R5;
            3'd6: regvalue1 = R6;
            3'd7: regvalue1 = R7;
            default: regvalue1 = 16'd0;
        endcase
    end

    // =========================
    // READ PORT 2
    // =========================
    always @(*) begin
        case (regaddy2)
            3'd0: regvalue2 = R0;
            3'd1: regvalue2 = R1;
            3'd2: regvalue2 = R2;
            3'd3: regvalue2 = R3;
            3'd4: regvalue2 = R4;
            3'd5: regvalue2 = R5;
            3'd6: regvalue2 = R6;
            3'd7: regvalue2 = R7;
            default: regvalue2 = 16'd0;
        endcase
    end

    // =========================
    // WRITE PORT
    // =========================
    always @(posedge clk) begin
        if (enable) begin
            case (writeaddy)
                3'd0: R0 <= writevalue;
                3'd1: R1 <= writevalue;
                3'd2: R2 <= writevalue;
                3'd3: R3 <= writevalue;
                3'd4: R4 <= writevalue;
                3'd5: R5 <= writevalue;
                3'd6: R6 <= writevalue;
                3'd7: R7 <= writevalue;
            endcase
        end
    end

endmodule