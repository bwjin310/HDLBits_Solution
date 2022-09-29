module top_module (
    input a, b, c,
    output w, x, y, z
);

    assign w = a;
    assign x = b, y = b;
    assign z = c;
    
endmodule