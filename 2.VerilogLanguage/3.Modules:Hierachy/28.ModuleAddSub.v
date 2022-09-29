module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b_in;
    wire cout1, cout2;
    assign b_in = {32{sub}}^b;
    add16 adder1(a[15:0],b_in[15:0], sub, sum[15:0], cout1);
    add16 adder2(a[31:16], b_in[31:16], cout1, sum[31:16], cout2);
    
endmodule