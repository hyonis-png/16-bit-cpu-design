module top_fpga (
    input  wire       clk,
    input  wire       btn_reset, 
    input  wire [3:0] sw,        
    output reg  [2:0] led,           // LD2, LD3, LD4
    output wire       led5_heartbeat // LD5
);

    wire sys_reset = ~btn_reset; 

    // Clock Divider (~0.7Hz)
    reg [26:0] div = 0;
    always @(posedge clk) begin
        if (sys_reset) div <= 0;
        else           div <= div + 1;
    end
    
    assign led5_heartbeat = div[26]; // LD5 blinks to show life
    wire cpu_enable = (div == 27'd0);

    wire [15:0] writevalue_out;
    wire [7:0]  PC_out;

    CPU_top cpu (
        .clk(clk),
        .reset(sys_reset),
        .enable(cpu_enable),
        .writevalue_out(writevalue_out),
        .PC_out(PC_out)
    );

    always @(*) begin
        case (sw[1:0]) 
            2'b00: led = PC_out[2:0];          // Mode 0: Counting (PC)
            2'b01: led = writevalue_out[2:0];  // Mode 1: Math Result
            2'b10: led = 3'b111;               // Mode 2: Test All ON
            default: led = 3'b000;
        endcase
    end
endmodule

