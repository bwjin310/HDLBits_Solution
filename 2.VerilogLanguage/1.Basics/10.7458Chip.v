module top_module (
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);
//-----------solution 1-------------
    // wire g1, g2, g3, g4;
    // assign g1 = p1a & p1b & p1c;
    // assign g2 = p1d & p1e & p1f;
    // assign g3 = p2a & p2b;
    // assign g4 = p2c & p2d;
    // assign p1y = g1 | g2;
    // assign p2y = g3 | g4;
//-----------solution 2--------------
    assign p1y = (p1a & p1b & p1c) | (p1d & p1e & p1f);
    assign p2y = (p2a & p2b) | (p2c & p2d);
endmodule