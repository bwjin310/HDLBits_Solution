module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q 
); 

    reg [323:0] data_padding;
    wire [255:0] q_next;
    integer i, j, neighbor;

    always @(*) begin
        data_padding[17:0] = {q[240], q[255:240], q[255]};
        data_padding[323:306] = {q[0], q[15:0], q[15]};
        for (i = 1; i < 17; i++) begin
            data_padding[i*18 +: 18] = {q[(i-1)*16], q[(i-1)*16 +: 16], q[i*16-1]};
        end

        for (i = 0; i <16; i++) begin
            for (j = 0; j < 16; j++) begin
                neighbor = data_padding[i*18+j] + data_padding[i*18+j+1] + data_padding[i*18+j+2] +
                            data_padding[(i+1)*18+j] + data_padding[(i+1)*18+j+2] +
                            data_padding[(i+2)*18+j] + data_padding[(i+2)*18+j+1] + data_padding[(i+2)*18+j+2];
                if (neighbor <= 1 || neighbor >=4) begin
                    q_next[16*i+j] = 0;
                end else if (neighbor == 3)begin
                    q_next[16*i+j] = 1;
                end else begin
                    q_next[16*i+j] = q[16*i+j];
                end
            end
        end
    end


    always @(posedge clk ) begin
        if (load) begin
            q <= data;
        end else begin
            q <= q_next;
        end
    end
endmodule
