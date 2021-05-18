
`include "DFF.v"
module DFF_tb;
wire Q;
reg D,clk,rst;

DFF dut(Q,D,clk,rst);
initial #200 $finish;

initial begin
    $dumpfile("DFF_tb.vcd");
    $dumpvars(0,DFF_tb);
    clk=1;
    forever #5 clk=~clk;
end

initial fork
    #2 rst=0;
    #3 rst=1;
    #4 rst=0;
    #10 D=0;
    #20 D=1;
    #40 D=0;
    #52 D=1;
    #68 D=0;
    #89 D=1;
    #114 D=0;
    
join 
    
endmodule