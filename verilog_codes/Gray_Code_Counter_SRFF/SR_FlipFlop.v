`include "SR_Latch.v"

module SR_FlipFlop(S, R, clk, p, c, Q,Qb);
    input S, R, clk,p, c;
    output Q,Qb;
    wire a,b;
    SR_Latch S1(.S(S),.R(R),.clk(~clk),.p(p), .c(c), .Q(a),.Qb(b));
    SR_Latch S2(.S(a),.R(b),.clk(clk),.p(p), .c(c), .Q(Q),.Qb(Qb));
endmodule