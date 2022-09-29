module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    //判断卡诺图中abcd的关系即可
    assign mux_in[0] = c | d;
    assign mux_in[1] = 1'b0;
    assign mux_in[2] = ~d;
    assign mux_in[3] = c & d;
endmodule
