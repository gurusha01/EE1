module DFF (
    output reg Q, 
    input D, clk, rst
);

always @(posedge clk ) Q<=D;
always @(negedge rst) Q<=1'b0;

endmodule