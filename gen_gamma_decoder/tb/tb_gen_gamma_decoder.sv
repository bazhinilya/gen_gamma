`include "../src/gen_gamma_decoder.sv"
`include "../src/components/register.sv"
`include "../src/components/subtractor.sv"
`include "../src/components/full_sum.sv"
`timescale 1ns/1ps

module tb_gen_gamma_decoder;

localparam SIZE = 8;
logic clk, rst_n, set0, set1;
logic [SIZE : 0]     md;
logic [SIZE - 1 : 0] nk;
logic [SIZE - 1 : 0] od;  


gen_gamma_decoder #(SIZE) tb (
    .clk(clk), .rst_n(rst_n), .set0(set0), .set1(set1),
    .md(md),
    .nk(nk),
    .od(od)  
);

initial begin
    clk = 0;
    rst_n = 0;
    md = $random;
    nk = $random;
    set0 = 0;
    set1 = 0;
#10 rst_n = 1;
#30 set0 = 1;
#10 set1 = 1; 
#50 rst_n = 0;
end

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD / 2) clk = ~clk;

initial begin
    $dumpfile("tb_gen_gamma_decoder.vcd");
    $dumpvars(0, tb_gen_gamma_decoder);
    $monitor("time = %t; clk = %b, rst_n = %b, md = %d, nk = %d, od = %d", $time, clk, rst_n, md, nk, od);
    #500 $finish(2);
end

endmodule