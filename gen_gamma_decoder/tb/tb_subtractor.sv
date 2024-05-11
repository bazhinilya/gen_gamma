`include "../src/components/subtractor.sv"
`timescale 1ps/1ps

module tb_subtractor;

localparam SIZE = 8;
logic [SIZE : 0] lst_fst;
logic [SIZE - 1 : 0] lst_sec;
logic [SIZE - 1 : 0] out;
logic carry;

subtractor tb(.lst_fst(lst_fst), .lst_sec(lst_sec), .out(out), .carry(carry));

initial begin
    lst_fst = 9'd32;
    lst_sec = 8'd32;
end

initial begin
    $dumpfile("tb_subtractor.vcd");
    $monitor("time = %t, lst_fst = %d, lst_sec = %d, out = %d, carry = %b", $time, lst_fst, lst_sec, out, carry);
    #10 $finish(2);
end

endmodule