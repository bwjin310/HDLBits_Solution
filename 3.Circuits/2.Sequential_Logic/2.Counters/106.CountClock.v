module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);

    wire em;
    wire eh;
    
    assign em = (ss == 8'h59) & ena;
    assign eh = (ss == 8'h59) & (mm == 8'h59) & ena;
    
    ms60 s60(clk, reset, ena, ss);
    ms60 m60(clk, reset, em, mm);   
    h12 h(clk, reset, eh, hh, pm);
    
endmodule

module h12(
    input clk,
    input reset,
    input ena,
    output [7:0] h,
    output reg pm
);
    
    always@(posedge clk)begin
        if(reset)begin
            h <= 8'h12;//0001_0010
            pm <= 0;
        end else begin
            if(ena)begin
                case(h)
                    8'd09:begin
                        h <= 8'h10;
                    end
                    8'h11:begin
                        h <= h + 1;
                        pm <= ~pm;
                    end
                    8'h12:begin
                        h <= 8'h01;
                    end
                    default:begin
                        h <= h + 1;
                    end         
                endcase
            end
        end
    end
    
endmodule

module ms60(
    input clk,
    input reset,
    input ena,
    output [7:0] ms);
    
    bcd #(.M(4'd9)) l(clk, reset, ena, ms[3:0]);
    bcd #(.M(4'd5)) h(clk, reset, (ms[3:0] == 4'd9) & ena, ms[7:4]);
    
endmodule

module bcd
    #(parameter M = 4'd9)
(
    input clk,
    input reset,
    input ena,
    output [3:0] out
);
    
    always@(posedge clk)begin
        if(reset)begin
            out <= 0;
        end else begin
            if(ena)begin
                if(out < M)out <= out + 1;
                else out <= 0;
            end
        end
    end
    
endmodule
