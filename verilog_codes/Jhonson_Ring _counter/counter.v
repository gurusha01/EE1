`include "DFF.v"
module counter (
    output Q0, Q1,Q2,Q3,
    input D0, D1, D2, D3,
    input clk,rst
);

DFF Q_3(Q3, ((!D1)&&D0)+((!D0)&&D1), clk, rst); 
DFF Q_2(Q2, D3, clk, rst); 
DFF Q_1(Q1, D2, clk, rst); 
DFF Q_0(Q0, D1, clk, rst); 
endmodule