//test bench for d flip flop
//1. Declare module and ports
`timescale 1ns/1ns
`include "counter.v"

module counter_tb;
reg A,B,C,D,clk,rst;
wire A2,B2,C2,D2;
counter DUT(D2, C2, B2, A2, D, C, B, A, clk, rst); 

initial begin
    $dumpfile("counter_tb.vcd");
    $dumpvars(0,counter_tb);
    clk=1;
    forever #5 clk=~clk;
end


initial 
    begin 
        $dumpfile("counter_tb.vcd");
        $dumpvars(0,counter_tb);
        #2 rst=0;
        #1 rst=1;
        #1 rst=0;
        #10 A=0; B=0; C=0; D=1;
        repeat(60)begin
            #5.05 A=A2; B=B2; C=C2; D=D2;
        end            
        $finish;

    end 
endmodule