module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum 
);

    wire [2:0] cout_temp;
    bcd_fadd adder1(
        .a(a[3:0]), 
        .b(b[3:0]), 
        .cin(cin),
        .cout(cout_temp[0]),
        .sum(sum[3:0])
    );

    bcd_fadd adder2(
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(cout_temp[0]),
        .cout(cout_temp[1]),
        .sum(sum[7:4])
    );

    bcd_fadd adder3(
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(cout_temp[1]),
        .cout(cout_temp[2]),
        .sum(sum[11:8])
    );

    bcd_fadd adder4(
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(cout_temp[2]),
        .cout(cout),
        .sum(sum[15:12])
    );
endmodule
