`timescale 1ns/1ns
`include "andf.v"

module and_tb ;

reg A,B;
wire C;
andf uut (A,B,C);
initial begin
    $dumpfile("and_tb.vcd");
    $dumpvars(0,and_tb);

    A=0;B=0;
    #20;
    A=1;B=0;
    #20;
    A=0;B=1;
    #20;
    A=1;B=1;

    $display("test complete");
end
    
endmodule