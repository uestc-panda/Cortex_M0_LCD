`timescale 1ps/1ps

module Cortex_M0_tst ();

reg clk;
reg RSTn;
reg [15:0] key_pluse;

CortexM0_SoC CortexM0_SoC(
     .clk(clk)
    ,.RSTn(RSTn)
    ,.key_pluse(key_pluse)
);

initial begin
    clk = 1'b0;
    RSTn = 1'b0;
    key_pluse = 16'h0000;
    #100
    RSTn = 1'b1;
    #100
    key_pluse = 16'h8000;
    #2
    key_pluse = 16'h0000;
    #700000
    key_pluse = 16'h4000;
    #2
    key_pluse = 16'h0000;
    #100000
    key_pluse = 16'h0002;    
    #2
    key_pluse = 16'h0000;
end


always #1 clk = ~clk;

endmodule