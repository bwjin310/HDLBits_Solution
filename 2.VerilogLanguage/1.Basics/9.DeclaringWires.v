module top_module (
    input a, b, c, d,
    output out, out_n
);
    wire e, f;
    assign e = a & b;
    assign f = c & d;
    assign out = e | f;
    assign out_n = ~out;

endmodule