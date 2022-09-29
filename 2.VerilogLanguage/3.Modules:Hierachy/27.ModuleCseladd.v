module top_module (
    input [31:0] a, b,
    output [31:0] sum
);

    wire sel, cout1, cout2;
    wire [15:0] sum1, sum2;
    add16 inst1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum[15:0]), .cout(sel));
    add16 inst2(.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(sum1), .cout(cout1));
    add16 inst3(.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(sum2), .cout(cout2));

    always@(*)
        begin
            if (sel == 0)
                sum[31:16] = sum1;
            else
                sum[31:16] = sum2; 
        end
        
endmodule