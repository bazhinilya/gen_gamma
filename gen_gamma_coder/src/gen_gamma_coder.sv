module gen_gamma_coder #(
    parameter SIZE = 8
) (
    input  logic clk, rst_n, set0, set1,
    input  logic [SIZE - 1 : 0] id,  
    output logic [SIZE - 1 : 0] nk,
    output logic [SIZE : 0] md
);

logic [28 : 0] w;


register saving_input_data (
    .clk(clk), .rst_n(rst_n), .set(set0),
    .d(id),  
    .q(w[7 : 0])
);

ring_oscillator run_ring_oscillator (
    .f0(w[8]), .f1(w[9]), .f2(w[10]), .f3(w[11])
);

xor_extender extend_ring_oscillator_output (
    .r0(w[8]), .r1(w[9]), .r2(w[10]), .r3(w[11]),
    .q0(w[12]), .q1(w[13]), .q2(w[14]), .q3(w[15]), .q4(w[16]), .q5(w[17]), .q6(w[18]), .q7(w[19])
);

register saving_noise_key (
    .clk(clk), .rst_n(rst_n), .set(set0),
    .d(w[19 : 12]),  
    .q(nk)
);

adder sum_two_list (
    .a0(nk[0]), .a1(nk[1]), .a2(nk[2]), .a3(nk[3]), .a4(nk[4]), .a5(nk[5]), .a6(nk[6]), .a7(nk[7]),
    .b0(w[0]), .b1(w[1]), .b2(w[2]), .b3(w[3]), .b4(w[4]), .b5(w[5]), .b6(w[6]), .b7(w[7]),
    .q0(w[20]), .q1(w[21]), .q2(w[22]), .q3(w[23]), .q4(w[24]), .q5(w[25]), .q6(w[26]), .q7(w[27]), .q8(w[28])
);

register #(SIZE + 1) saving_mix_data (
    .clk(clk), .rst_n(rst_n), .set(set1),
    .d(w[28 : 20]),  
    .q(md)
);

endmodule