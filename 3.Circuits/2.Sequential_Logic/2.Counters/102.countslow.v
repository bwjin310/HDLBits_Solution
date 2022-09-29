module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q
);

    always @(posedge clk ) begin
        if (reset || (slowena && q == 4'b1001)) begin
            q <= 4'b0000;
        end
        else if (slowena) begin
            q <= q + 4'b0001;
        end
        else begin
            q <= q;
        end
    end

endmodule
