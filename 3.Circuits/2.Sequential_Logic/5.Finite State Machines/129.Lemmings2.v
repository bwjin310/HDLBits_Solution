module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter LEFT=0, RIGHT=1, AHH=2;
    reg [1:0] previous, state, next;

    always@(*) begin
        case(state)
            LEFT: next = ground? (bump_left? RIGHT : LEFT) : AHH;
            RIGHT: next = ground? (bump_right? LEFT : RIGHT) : AHH;
            AHH: next = ground? previous : AHH; 
        endcase
    end

    always@(posedge clk, posedge areset) begin
        if (areset) begin
            state <= LEFT;
        end else begin
            state <= next;
            if (next == AHH && state != AHH) begin
            previous <= state;
            end
        end
    end

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == AHH);

endmodule
