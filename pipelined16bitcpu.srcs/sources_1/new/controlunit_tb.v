module controlunit_tb;

    reg  [15:0] instruction;

    wire [2:0] alu_op;
    wire       writeenable;
    wire [2:0] regaddy1;
    wire [2:0] regaddy2;
    wire [2:0] writeaddy;

    controlunit dut (
        .instruction(instruction),
        .alu_op(alu_op),
        .writeenable(writeenable),
        .regaddy1(regaddy1),
        .regaddy2(regaddy2),
        .writeaddy(writeaddy)
    );

    initial begin
        instruction = 16'b0000_000_000_000_000;
        #10;

        instruction = 16'b0001_001_010_011_000;
        #10;

        instruction = 16'b0010_100_101_110_000;
        #10;

        instruction = 16'b0101_111_001_010_000;
        #10;

        $stop;
    end

endmodule