`include "../src/gen_gamma_decoder.sv"
`include "../src/components/register.sv"
`include "../src/components/subtractor.sv"
`timescale 1ps/1ps

module tb_gen_gamma_decoder;

logic clk, res_n;
logic [7 : 0] inp_data;
logic [8 : 0] out_data;

gen_gamma_coder #(8) tb(.clk(clk), .res_n(res_n), .inp_data(inp_data), .out_data(out_data));

initial begin
    clk = 0;
    res_n = 1;
    inp_data = $random;
end

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD / 2) clk = ~clk;
always #(CLK_PERIOD * 4) res_n = ~res_n;

initial begin
    $dumpfile("tb_gen_gamma_decoder.vcd");
    $monitor("time = %t; clk = %b, res_n = %b, inp_data = %d, out_data = %d", $time, clk, res_n, inp_data, out_data);
    #100 $finish(2);
end

endmodule