module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

    reg [31:0] in_pre;
    always @(posedge clk ) begin
        in_pre <= in;
        out <= reset? 32'b0 : (~in & in_pre | out);// 或out 正是capture含义所在 获取对应信号后维持直到reset
    end
endmodule
