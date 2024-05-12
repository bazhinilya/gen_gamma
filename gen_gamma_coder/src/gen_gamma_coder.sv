`timescale 1ns/1ps

module gen_gamma_coder #(
    parameter SIZE = 8
) (
    input  logic clk, rst_n, set0, set1, en,
    input  logic [SIZE - 1 : 0] id,  
    output logic [SIZE - 1 : 0] nk,
    output logic [SIZE : 0]     md
);

logic [24 : 0] w;


register saving_input_data (
    .clk(clk), .rst_n(rst_n), .set(set0),
    .d(id),  
    .q(w[7 : 0])
);

xor_extender extend_ring_oscillator_output (
    .en(en),
    .q(w[15 : 8])
);

register saving_noise_key (
    .clk(clk), .rst_n(rst_n), .set(set0),
    .d(w[15 : 8]),  
    .q(nk)
);

adder sum_two_list (
    .a0(nk[0]), .a1(nk[1]), .a2(nk[2]), .a3(nk[3]), .a4(nk[4]), .a5(nk[5]), .a6(nk[6]), .a7(nk[7]),
    .b0(w[0]),  .b1(w[1]),  .b2(w[2]),  .b3(w[3]),  .b4(w[4]),  .b5(w[5]),  .b6(w[6]),  .b7(w[7]),
    .q0(w[16]), .q1(w[17]), .q2(w[18]), .q3(w[19]), .q4(w[20]), .q5(w[21]), .q6(w[22]), .q7(w[23]), .q8(w[24])
);

register #(SIZE + 1) saving_mix_data (
    .clk(clk), .rst_n(rst_n), .set(set1),
    .d(w[24 : 16]),  
    .q(md)
);

endmodule