module IM(pc,instru);
    input [31:0] pc;
    output [31:0] instru;
    reg [31:0] memory [0:1023];
    wire [9:0] pc1;
    initial begin
        $readmemh("/home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/Verilog_Test/ccmb_.hex",memory);
    end
    assign pc1[9:0] = pc[11:2];
    assign instru = memory[pc1][31:0];
endmodule
