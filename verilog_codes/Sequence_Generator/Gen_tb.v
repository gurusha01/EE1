`timescale 1ns/1ns
`include "Gen.v"

module Gen_tb;
reg S2, S1, S0, X_i,clk,rst;
wire Q2, Q1, Q0, Y;
Gen DUT(Q2, Q1, Q0, Y, S2, S1, S0, X_i, clk, rst); 

initial begin
    $dumpfile("Gen_tb.vcd");
    $dumpvars(0, Gen_tb);
    clk=0;
    forever #5 clk=~clk;
end


initial 
    begin 
        $dumpfile("Gen_tb.vcd");
        $dumpvars(0,Gen_tb);
        #2 rst=0;
        #1 rst=1;
        #1 rst=0;
        #10 S2=0; S1=0; S0=0; X_i=1;
        repeat(2)begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end   
        X_i=0;
        repeat(2)begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end 
        X_i=1;
        repeat(2)begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end 
        X_i=0;
        repeat(6)begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end 
        X_i=1;
        repeat(20)begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end 
        X_i=0;
        repeat(10) begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end

        repeat(2)begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end   
        X_i=0;
        repeat(2)begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end 
        X_i=1;
        repeat(2)begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end 
        X_i=0;
        repeat(6)begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end 
        X_i=1;
        repeat(20)begin
            #5.05 S2=Q2; S1=Q1; S0=Q0;
        end 
        
        $finish;

    end 
endmodule