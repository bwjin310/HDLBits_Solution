module top_module (
    input x1, x2, x3,
    output f
);
    assign f = ~x3&x2&~x1 | ~x3&x2&x1 | x3&~x2&x1 | x3&x2&x1;
    //assign f = (!x3 & x2) | (x3 & x1);最小项化简
endmodule