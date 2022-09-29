/*PROVIDED:
module count4(
	input clk,
	input enable,
	input load,
	input [3:0] d,
	output reg [3:0] Q
);
*/

module top_module (
    input clk,
    input reset,
    input enable,//使能端
    output [3:0] Q,
    output c_enable,
    output c_load,//装载端 开始数据输入
    output [3:0] c_d
); //

    assign c_enable = enable;
    assign c_load = reset || (enable && Q == 4'd12);
    assign c_d = c_load?1:0;//判断有无加载数据
    count4 the_counter (clk, c_enable, c_load, c_d, Q);

endmodule
