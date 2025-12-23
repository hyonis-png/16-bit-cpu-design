module regfiles_tb;

    // Inputs (regs because TB drives them)
    reg        clk;
    reg        enable;
    reg [2:0]  regaddy1;
    reg [2:0]  regaddy2;
    reg [2:0]  writeaddy;
    reg [15:0] writevalue;

    // Outputs (wires because DUT drives them)
    wire [15:0] regvalue1;
    wire [15:0] regvalue2;

    // Instantiate DUT
    regfiles dut (
        .clk(clk),
        .enable(enable),
        .regaddy1(regaddy1),
        .regvalue1(regvalue1),
        .regaddy2(regaddy2),
        .regvalue2(regvalue2),
        .writeaddy(writeaddy),
        .writevalue(writevalue)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize
        enable = 0;
        regaddy1 = 0;
        regaddy2 = 0;
        writeaddy = 0;
        writevalue = 0;

        // WRITE 15 into R1
        #10;
        enable = 1;
        writeaddy = 3'd1;
        writevalue = 16'd15;

        // clock edge happens here

        #10;
        enable = 0;

        // READ R1
        regaddy1 = 3'd1;

        #10;

        // At this point:
        // regvalue1 should be 16'd15

        $stop;
    end

endmodule
