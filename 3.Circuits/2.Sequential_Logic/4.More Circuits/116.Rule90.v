module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg[511:0] q ); 
	
    int i;
    always @(posedge clk ) begin
        if(load) begin
            q <= data;
        end else begin
            q[0] <= q[1] ^ 0;
            q[511] <= 0 ^ q[510];
            for(i = 1; i < 511; i = i + 1)
                q[i] <= q[i - 1] ^ q[i + 1]; 
        end
    end
endmodule