module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    parameter BYTE1=0, BYTE2=1, BYTE3=2, DONE=3;
    reg [1:0] state, next;
    reg [23:0] out_reg;
    // State transition logic (combinational)
    always@(*) begin
        case (state)
            BYTE1 : begin
                next = in[3] ? BYTE2 : BYTE1;
                out_reg[23:16] = in;
            end
            BYTE2 : begin 
                next = BYTE3;
                out_reg[15:8] = in;
            end
            BYTE3: begin 
                next = DONE;
                out_reg[7:0] = in;
            end
            DONE: begin 
                next = in[3] ? BYTE2 :BYTE1;
                out_reg[23:16] = in;
            end
            default: next = BYTE1;
        endcase
    end
    // State flip-flops (sequential)

    always@(posedge clk) begin
        if (reset) begin
            state <= BYTE1;
        end else
            state <= next;
    end

    always@(posedge clk) begin
        if (state == BYTE3) out_bytes <= out_reg;
    end
    // Output logic
    assign done = (state == DONE);
endmodule

