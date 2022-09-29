module top_module( 
    input [2:0] in,
    output [1:0] out );
    
	reg [1:0] sum;
    always@(*) begin
        sum = 2'd0; //初始化sum
        for(integer i = 0; i < 3; i++) begin //初始化i
            sum = sum + in[i];        
        end
    end
    
    assign out = sum;
endmodule
