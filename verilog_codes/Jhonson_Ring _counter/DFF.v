module DFF (
    output reg Q, 
    input D, clk, rst
);

always @(negedge clk ) Q<=D;
always @(negedge rst) Q<=1'b1;

endmodule