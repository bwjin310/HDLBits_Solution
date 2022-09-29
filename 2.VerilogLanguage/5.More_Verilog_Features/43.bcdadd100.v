module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    wire [99:0] cout1;
    genvar i;
    generate
        
        for (i = 0; i < 400; i = i + 4)
            begin: bcdadder
            if (i == 0)
                bcd_fadd adder1(.a(a[i + 3:i]), .b(b[i + 3:i]), .cin(cin), .cout(cout1[i]), .sum(sum[i + 3:i]));
        	else
                bcd_fadd adder2(.a(a[i + 3:i]), .b(b[i + 3:i]), .cin(cout1[i/4 - 1]), .cout(cout1[i/4]), .sum(sum[i + 3:i]));
        	end
        assign cout = cout1[99];
    endgenerate
endmodule
