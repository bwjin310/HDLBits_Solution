module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter BYTE1=0, BYTE2=1, BYTE3=2, DONE=3;
    reg [1:0] state, next;

    // State transition logic (combinational)
    always@(*) begin
        case (state)
            BYTE1 : next = in[3] ? BYTE2 : BYTE1;
            BYTE2 : next = BYTE3;
            BYTE3: next = DONE;
            DONE: next = in[3] ? BYTE2 :BYTE1;
            default: next = BYTE1;
        endcase
    end
    // State flip-flops (sequential)
 
    always@(posedge clk) begin
        if (reset) begin
            state <= BYTE1;
        end else begin
            state <= next;
        end
    end
    // Output logic
    assign done = (state == DONE);
endmodule

