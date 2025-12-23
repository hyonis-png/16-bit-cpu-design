module CPU_top ( 
    input wire clk, 
    input wire reset
);  

    // from reg files
    wire [2:0]  regaddy1, regaddy2, writeaddy;
    wire [15:0] regvalue1, regvalue2, writevalue; 

    // from alu
    wire [2:0]  control; 

    // from control unit / rom
    wire [15:0] instruction; 

    // from pc
    wire [7:0]  PC; 

    wire writeenable;

    PC u_PC ( 
        .clk(clk),  
        .PC(PC) 
    );

    ROM u_ROM ( 
        .PC(PC), 
        .instruction(instruction)   
    );

    controlunit U_controlunit (
        .instruction(instruction),   
        .alu_op(control),       
        .writeenable(writeenable),  
        .regaddy1(regaddy1),        
        .regaddy2(regaddy2),        
        .writeaddy(writeaddy)    
    ); 

    alu U_alu (
        .A(regvalue1),   
        .B(regvalue2),       
        .control(control),  
        .Y(writevalue)
    ); 

    regfiles U_regfiles (
        .clk(clk),   
        .enable(writeenable),
        .regaddy1(regaddy1),        
        .regaddy2(regaddy2),        
        .writeaddy(writeaddy),
        .writevalue(writevalue),
        .regvalue1(regvalue1),
        .regvalue2(regvalue2)
    );  

endmodule
