module alu_tb; 
 reg [15:0]A; 
 reg [15:0]B; 
 reg [2:0]control; 
 wire [15:0]Y; 
 

  alu_tb dut(
 .A(A),
 .B(B),
 .control(control), 
 .Y(Y)
 );
 
 
 initial begin
A = 16'd2;
B = 16'd7;
control = 3'd0;
#10;

control = 3'd1;
#10; 
control = 3'd2;

  $stop;
    
        end
    endmodule

    