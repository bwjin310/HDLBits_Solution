module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q
); 
//计算机按补码运算 -8: 1111_000 -64: 1100 0000
//左移总是移位补零，算术逻辑一样
//右移时，无符号数移位补零，有符号数移位补符号位
//算术移位时要声明是有符号数$signed()
    always @(posedge clk ) begin
        if (load) begin
            q <= data;
        end
        else if (ena) begin
            case (amount) 
                2'b00: q <= q <<< 1;
                2'b01: q <= q <<< 8;
                2'b10: q <= $signed(q) >>> 1;
                2'b11: q <= $signed(q) >>> 8;
            endcase
        end
    end
endmodule

