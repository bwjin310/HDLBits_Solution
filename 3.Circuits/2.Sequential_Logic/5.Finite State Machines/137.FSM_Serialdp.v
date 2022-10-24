module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 

    parameter IDLE=0, START=1, DONE=2, ERROR=3;
    reg[2:0] pre, state, next;
    reg[3:0] cnt;
    reg[8:0] temp_byte;
    reg odd = 1'b0;

    always@(*) begin 
        case(state)
            IDLE: next = in ? IDLE : START;
            START: next = (cnt == 9) ? DONE : START;
            DONE: next = in ? IDLE: ERROR;
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
                START: begin
                    cnt <= cnt + 1;
                end
                default: cnt <= cnt;
            endcase
        end
    end
    
    always@(posedge clk) begin
        if(state == IDLE || reset) odd <= 1'b0;
        else if (state == START) odd <= in ? ~odd : odd;
        else odd <= odd;
    end
    
    always@(posedge clk) begin
        if (state == START) begin
            temp_byte[cnt-1] <= in;
        end
    end
    
    assign done = (state == IDLE && pre == DONE && odd); 
    always@(posedge clk) begin
        if (state==DONE && next==IDLE) begin
            out_byte <= temp_byte[7:0];
        end
    end
endmodule

