module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    mux_Dff ins1(
        .r(SW[2]), 
        .l(KEY[1]), 
        .clk(KEY[0]), 
        .data(LEDR[2]^LEDR[1]),
        .q(LEDR[2]));
    mux_Dff ins2(
        .r(SW[1]), 
        .l(KEY[1]), 
        .clk(KEY[0]), 
        .data(LEDR[0]),
        .q(LEDR[1]));
    mux_Dff ins3(
        .r(SW[0]), 
        .l(KEY[1]), 
        .clk(KEY[0]), 
        .data(LEDR[2]),
        .q(LEDR[0]));
endmodule

module mux_Dff (
    input r,l,clk,data,
    output q
);
    always @(posedge clk ) begin
        q <= l ? r : data;
    end
endmodule