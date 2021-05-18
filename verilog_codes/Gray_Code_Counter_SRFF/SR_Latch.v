module SR_Latch(S, R, clk,p,c ,Q ,Qb);
    input S,R,clk,p,c;
    output Q,Qb;
    wire sk,rk,x,y;
    nand g1(sk,clk,S);
    nand g2(rk,clk,R);
    assign Q= ~(Qb & ~p & sk);
    assign Qb=~(Q & ~c & rk);
endmodule
