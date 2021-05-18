`include "SR_FlipFlop.v"

module Mod_Counter(A,B,C,D,clk,p,c, A2,B2,C2,D2);
    input A,B,C,D,clk,p,c;
    output A2,B2,C2,D2;
    wire a2,b2,c2,d2;
    wire sa,ra,sb,rb,sc,rc,sd,rd;
    assign sa=B && !C && !D;
    assign ra=!B && !C && !D;
    assign sb=!A && C && !D;
    assign rb= A && C && !D;
    assign sc=(!A && !B && D) || (A && B && D);
    assign rc=(!A && B && D) || (A && !B && D);
    assign sd=(!A && !B && !C) || (A && B && !C) || (!A && B && C) || (A && !B && C);
    assign rd=(!A && !B && C) || (A && B && C) || (!A && B && !C) || (A && !B && !C);
    SR_FlipFlop S1(.S(sa),.R(ra),.clk(clk),.p(p), .c(c), .Q(A2),.Qb(a2));
    SR_FlipFlop S2(.S(sb),.R(rb),.clk(clk),.p(p), .c(c),.Q(B2),.Qb(b2));
    SR_FlipFlop S3(.S(sc),.R(rc),.clk(clk),.p(p), .c(c),.Q(C2),.Qb(c2));
    SR_FlipFlop S4(.S(sd),.R(rd),.clk(clk),.p(p), .c(c),.Q(D2),.Qb(d2));
endmodule



 /*wire q1,q2;
    and(q1,C,D);
    and(q2,q1,B);
    and(sa,~A,q2);
    and(ra,A,q2);
    and(sb,~B,q1);
    and(rb,B,q1);
    and(sc,D,1);
    and(rc,~D,1);
    and(sd,~D,1);
    and(rd,D,1);*/