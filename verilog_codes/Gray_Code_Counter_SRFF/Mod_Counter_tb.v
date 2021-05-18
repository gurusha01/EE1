//test bench for d flip flop
//1. Declare module and ports
`timescale 1ns/1ns
`include "Mod_Counter.v"

module Mod_Counter_tb;
reg A,B,C,D,clk,p,c;
wire A2,B2,C2,D2;

//2. Instantiate the module we want to test. We have instantiated the srff_behavior
Mod_Counter DUT(.A(A), .B(B), .C(C), .D(D), .clk(clk),.p(p), .c(c), .A2(A2), .B2(B2), .C2(C2), .D2(D2)); // instantiation by port name.

//3. Monitor TB ports
//$monitor("simtime = %g, CLK = %b, S = %b, R = %b, Q = %b, QBAR = %b", $time, CLK, S, R, Q, QBAR);

//4. apply test vectors

initial 
    begin 
        $dumpfile("Mod_Counter_tb.vcd");
        $dumpvars(0,Mod_Counter_tb);
        clk=0; p=0; c=1;
        A=0; B=0; C=0; D=0;
        #1; p=0;c=0;
        repeat(100)begin
            A=A2; B=B2; C=C2; D=D2; #5.05;
        end
            
        $finish;
    end 
    always 
        #5 clk=~clk; 
    
endmodule