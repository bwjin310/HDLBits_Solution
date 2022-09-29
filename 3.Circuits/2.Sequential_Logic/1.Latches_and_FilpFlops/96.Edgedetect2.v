module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);

    reg [7:0] in_pre;
    always @(posedge clk ) begin
        in_pre <= in;
        anyedge = in ^ in_pre;
    end
endmodule
