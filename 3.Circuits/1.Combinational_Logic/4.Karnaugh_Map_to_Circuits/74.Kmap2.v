module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  
); 
    assign out = ~b & ~c | ~d & ~a | c & d & (a | ~a & b);
    // assign out = ~a & ~d | ~b & ~c | b & c & d | a & c & d;
endmodule
