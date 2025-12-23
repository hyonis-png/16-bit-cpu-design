module regs (
    input  wire clk,
    input  wire clr, 
input wire en,     
    input  wire [15:0]A,
    output reg  [15:0] Y
);


    always @(posedge clk) begin
        if (clr)
            Y <= 16'b0;
				
				else if (en)
				Y <= A; 

    end

 

endmodule
