module CPU_top ( 
    input  wire clk, reset, enable,
    output wire [15:0] writevalue_out,
    output wire [7:0]  PC_out
);  

    wire [2:0]  regaddy1, regaddy2, writeaddy;
    wire [15:0] regvalue1, regvalue2, writevalue; 
    wire [2:0]  control; 
    wire [15:0] instruction; 
    wire [7:0]  PC; 
    wire        writeenable;

    reg [15:0] IF_ID_instruction;
    reg [15:0] ID_EX_A, ID_EX_B;
    reg [2:0]  ID_EX_control;

    always @(posedge clk) begin
        if (reset) begin
            IF_ID_instruction <= 0; ID_EX_A <= 0; ID_EX_B <= 0; ID_EX_control <= 0;
        end else if (enable) begin
            IF_ID_instruction <= instruction;
            ID_EX_A <= regvalue1;
            ID_EX_B <= regvalue2;
            ID_EX_control <= control;
        end
    end

    PC u_PC (.clk(clk), .reset(reset), .enable(enable), .PC(PC));
    ROM u_ROM (.PC(PC), .instruction(instruction));

    controlunit U_controlunit (
        .instruction(IF_ID_instruction),   
        .alu_op(control), .writeenable(writeenable),  
        .regaddy1(regaddy1), .regaddy2(regaddy2), .writeaddy(writeaddy)    
    ); 

    alu U_alu (.A(ID_EX_A), .B(ID_EX_B), .control(ID_EX_control), .Y(writevalue)); 

    regfiles U_regfiles (
        .clk(clk), .enable(writeenable), // Fixed: Use current writeenable
        .regaddy1(regaddy1), .regaddy2(regaddy2), 
        .writeaddy(writeaddy), .writevalue(writevalue),
        .regvalue1(regvalue1), .regvalue2(regvalue2)
    );  

    assign writevalue_out = writevalue;
    assign PC_out = PC;
endmodule