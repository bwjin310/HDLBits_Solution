module top_module (
    input [99:0] a, b,
    input cin,
    output [99:0] sum, cout
);
    genvar i;
    generate
        for(i = 0; i < 100; i++)
            begin: adder100
                if (i == 0)
                    assign {cout[i], sum[i]} = a[i] + b[i] + cin; //生成块中要使用assign
                else
                	assign {cout[i], sum[i]} = a[i] + b[i] + cout[i - 1];
            end
    endgenerate
endmodule