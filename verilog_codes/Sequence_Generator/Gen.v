`include "DFF.v"
module Gen (
    output Q2, Q1, Q0, Y,
    input S2, S1, S0, X_i, clk,rst
);

DFF Q_2(Q2, (S2 && (!S1)) || (S1 && S0) , clk, rst); 

DFF Q_1(Q1, ( ((!S1) && S0) || ((!S2) && S1 && (!S0)) ), clk, rst); 

DFF Q_0(Q0, ((!S0 && X_i) || ((!S2) && S1 && (!S0)) || ((S2 && (!S1)) && (!S0))), clk, rst); 

assign Y= S0 || ((!S2) && (!S1) && X_i) || (S2 && S1 && X_i);

    
endmodule