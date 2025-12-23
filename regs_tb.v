`timescale 1ns/1ps

module regs_tb;

  reg clk;
  reg reset;
  reg en;
  reg [15:0] A;
  wire [15:0] Y;

  regs dut (
    .clk(clk),
    .reset(reset),
    .en(en),
    .A(A),
    .Y(Y)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    en = 0;
    D = 16'hAAAA;

    #10;
    reset = 0;     
    #10;
    D = 16'h1234;
    #10;

    en = 1;
    #10;

    en = 0;
    D = 16'hFFFF;
    #10;

    $stop;
  end

endmodule
