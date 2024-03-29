module SwitchFreq(select,CLK,clk);
  input select;
  input CLK;
  output reg clk;
  wire clk1,clk2;
  //assign clk = CLK;
  
  divider_ #(100000)  divider1
     (
        .clk(CLK),.parameterN(1),.clk_N(clk1)
        );
  divider_ #(10000000)  divider2
           (
              .clk(CLK),.parameterN(1),.clk_N(clk2)
              );
  always @(posedge CLK) begin
  	if (select)
  		clk <= clk1;
  	else
  		clk <= clk2;
  end
  
endmodule

/*
    对系统时钟进行分频，参数N可以任意改变，将时钟降到不同频率 
*/
module divider_
#(parameter N = 100_000)
 (clk,parameterN,clk_N);
    input clk;                      // 系统时钟
    input [3:0] parameterN;              //分频参数
    output reg clk_N;               // 分频后的时钟
    reg [31:0] counter;             /* 计数器变量，通过计数实现分频。
                                   当计数器从0计数到(N/2-1)时，
                                   输出时钟翻转，计数器清零 */
initial begin
   counter = 0; 
   clk_N = 0;
end
always @(posedge clk)  begin    // 时钟上升沿
    if(counter == N*parameterN/2 - 1)begin 
    	counter = 0;
    	clk_N = ~clk_N;
    end
    else 	counter = counter + 1;
end                           
endmodule
