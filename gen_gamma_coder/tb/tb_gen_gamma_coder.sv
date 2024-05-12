`include "../src/gen_gamma_coder.sv"
`include "../src/components/register.sv"
`include "../src/components/adder.sv"
`include "../src/components/ring_oscillator.sv"
`include "../src/components/xor_extender.sv"
`include "../src/components/full_sum.sv"
`include "../src/components/inverter.sv"
`timescale 1ns/1ps

module tb_gen_gamma_coder;

localparam SIZE = 8;
logic clk, rst_n, set0, set1, en;
logic [SIZE - 1 : 0] id;  
logic [SIZE - 1 : 0] nk;
logic [SIZE : 0]     md;


gen_gamma_coder #(SIZE) tb (
    .clk(clk), .rst_n(rst_n), .set0(set0), .set1(set1), .en(en),
    .id(id),  
    .nk(nk),
    .md(md)
);


initial begin
    clk = 0;
    rst_n = 0;
    en = 0;
    id = $random;
    set0 = 0;
    set1 = 0;
#10  rst_n = 1;
#30 en = 1;
    set0 = 1;
#10 set1 = 1;
#40 set0 = 0;
    set1 = 0;
    rst_n = 1;
#10  rst_n = 0;
    set0 = 1;
    set1 = 1;
#40 set0 = 0;
    set1 = 0;
end

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD / 2) clk = ~clk;

initial begin
    $dumpfile("tb_gen_gamma_coder.vcd");
    $dumpvars(0, tb_gen_gamma_coder);
    $monitor("time = %t; clk = %b, rst_n = %b, id = %d, md = %d, nk = %d", $time, clk, rst_n, id, md, nk);
    #500 $finish(2);
end

endmodule