module bcd (
    input clk,
    input reset,// Synchronous active-high reset
    input en,
    output [3:0] q
);

    always @(posedge clk ) begin
        if (reset) begin
            q <= 4'b0000;
        end    
        else if (en)begin
            q <= q == 4'd9 ? 4'd0 : q + 4'b1;
        end
    end
endmodule

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    assign ena = {q[11:8]==4'd9&&q[7:4]==4'd9&&q[3:0]==4'd9, q[7:4]==4'd9&&q[3:0]==4'd9, q[3:0]==4'd9};
    
    bcd counter1(.clk(clk),.reset(reset),.en(1'b1),.q(q[3:0]));
    bcd counter2(.clk(clk),.reset(reset),.en(ena[1]),.q(q[7:4]));
    bcd counter3(.clk(clk),.reset(reset),.en(ena[2]),.q(q[11:8]));
    bcd counter4(.clk(clk),.reset(reset),.en(ena[3]),.q(q[15:12]));
endmodule

