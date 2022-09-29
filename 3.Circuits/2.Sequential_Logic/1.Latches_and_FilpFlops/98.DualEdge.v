module top_module (
    input clk,
    input d,
    output q
);
    
    /
    reg q_d1,q_d2;
    //上升沿检测
	always@(posedge clk)begin
        q_d1 <= d ^ q_d2;
    end
    //下降沿检测
    always@(negedge clk)begin
        q_d2 <= d ^ q_d1;
    end
    
    assign q = q_d1 ^ q_d2;

endmodule