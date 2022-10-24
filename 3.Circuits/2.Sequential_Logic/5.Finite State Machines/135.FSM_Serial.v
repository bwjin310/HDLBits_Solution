module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

    parameter IDLE=0, START=1, DONE=2, ERROR=3;
    reg[2:0] pre, state, next;
    reg[3:0] cnt;

    always@(*) begin 
        case(state)
            IDLE: next = in ? IDLE : START;
            START: next = (cnt == 8) ? DONE : START;
            DONE: next = in ? IDLE : ERROR;
            ERROR: next = in ? IDLE : ERROR;
        endcase
    end

    always@(posedge clk) begin
        if (reset) begin 
            state <= IDLE;
        end else begin
            pre <= state;
            state <= next;
        end
    end

    always@(posedge clk)begin
        if (reset) begin
            cnt<=0;
        end else begin
            case(next)
                IDLE: cnt <= 0;
                START: cnt <= cnt + 1;
                default: cnt <= cnt;
            endcase
        end
    end

    assign done = (state == IDLE && pre == DONE); 
endmodule

