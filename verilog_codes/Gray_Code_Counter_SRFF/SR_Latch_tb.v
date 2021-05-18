//test bench for d flip flop
//1. Declare module and ports
`timescale 1ns/1ns
`include "SR_Latch.v"

module SR_Latch_tb;
reg S,R, clk;
wire Q, Qb;

//2. Instantiate the module we want to test. We have instantiated the srff_behavior

SR_Latch DUT(.S(S), .R(R), .clk(clk), .Q(Q), .Qb(Qb)); // instantiation by port name.

//3. Monitor TB ports
//$monitor("simtime = %g, CLK = %b, S = %b, R = %b, Q = %b, QBAR = %b", $time, CLK, S, R, Q, QBAR);

//4. apply test vectors

initial 
    begin 
        $dumpfile("SR_Latch_tb.vcd");
        $dumpvars(0,SR_Latch_tb);
        clk=0;
        S= 1; R= 0;
        #100; S= 0; R= 1; 
        #100; S= 0; R= 0; 
        #100;  S= 1; R=1; 
        #100;
        $finish;
    end 
    always 
        #50 clk=~clk; 
    
endmodule