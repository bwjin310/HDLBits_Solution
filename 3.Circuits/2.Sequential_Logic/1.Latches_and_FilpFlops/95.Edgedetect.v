module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] in_pre;
    always @(posedge clk ) begin
        in_pre <= in;//先用寄存器保存之前状态
        pedge <= in & ~in_pre;
    end
endmodule
