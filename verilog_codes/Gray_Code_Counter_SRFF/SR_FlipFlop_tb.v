
`timescale 1ns/1ns
`include "SR_FlipFlop.v"

module SR_FlipFlop_tb;
reg S,R,p,c, clk;
wire Q, Qb;

SR_FlipFlop DUT(.S(S), .R(R), .clk(clk), .p(p), .c(c), .Q(Q), .Qb(Qb)); // instantiation by port name.



initial 
    begin 
        $dumpfile("SR_FlipFlop_tb.vcd");
        $dumpvars(0,SR_FlipFlop_tb);
        clk=1; p=1; c=0;
        S= 1; R= 0; #1 p=0; c=0;
        #7; S= 0; R= 1; 
        #7; S= 0; R= 0; 
        #7; S= 1; R= 0;
        #7; S= 0; R= 1; 
        #7; S= 0; R= 0; 
        #7; S= 0; R= 1; 
        #7; S= 0; R= 0; 
        #7; S= 1; R= 0;
        #7; S= 0; R= 1; 
        #7; S= 0; R= 0; 
        #7; 
        $finish;
    end 
    always 
        #5 clk=~clk; 
    
endmodule