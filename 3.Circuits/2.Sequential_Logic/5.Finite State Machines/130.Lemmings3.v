module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging 
); 

    parameter LEFT=0, RIGHT=1, DIGL=2, DIGR=3, FALLL=4,FALLR=5;
    reg [2:0] state, next;

    always@(*) begin
        case (state)
            LEFT: next = ground? (dig? DIGL : (bump_left? RIGHT : LEFT)) : FALLL;
            RIGHT: next = ground? (dig? DIGR : (bump_right? LEFT : RIGHT)) : FALLR;
            DIGL: next = ground? DIGL : FALLL;
            DIGR: next = ground? DIGR : FALLR;
            FALLL: next = ground? LEFT : FALLL;
            FALLR: next = ground? RIGHT : FALLR;
        endcase
    end

    always@(posedge clk, posedge areset) begin
        if (areset) begin
            state <= LEFT;
        end else begin
            state <= next;
        end
    end

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALLL || state == FALLR);
    assign digging = (state == DIGL || state == DIGR);

endmodule
