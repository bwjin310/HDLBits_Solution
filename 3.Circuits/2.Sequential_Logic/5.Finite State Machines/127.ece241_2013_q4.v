module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
);

parameter A=0, B=1, C=2, D=3, E=4, F=5;
reg [2:0] state, next_state;

always@(*) begin
    case(state)
        A: next_state = s[1]? B : A;
        B: next_state = s[2]? D : (s[1]? B : A);
        C: next_state = s[2]? D : (s[1]? C : A);
        D: next_state = s[3]? F : (s[2]? D : C);
        E: next_state = s[3]? F : (s[2]? E : C);
        F: next_state = s[3]? F : E;
    endcase
end

always@(posedge clk) begin
    if (reset) begin
        state <= A;
    end else begin
        state <= next_state;
    end
end

always@(*) begin
    case (state)
        A: {fr1, fr2, fr3, dfr} = 4'b1111;
        B: {fr1, fr2, fr3, dfr} = 4'b1100;
        C: {fr1, fr2, fr3, dfr} = 4'b1101;
        D: {fr1, fr2, fr3, dfr} = 4'b1000;
        E: {fr1, fr2, fr3, dfr} = 4'b1001;
        F: {fr1, fr2, fr3, dfr} = 4'b0000;
    endcase
end

endmodule
