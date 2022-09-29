module top_module (
    input x, y,
    output z
);
    assign z = (x ^ y) & x;
endmodule