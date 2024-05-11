module gen_gamma_decoder #(
    parameter SIZE = 8
) (
    input  logic clk, rst_n, set0, set1,
    input  logic [SIZE : 0]     md,
    input  logic [SIZE - 1 : 0] nk,
    output logic [SIZE - 1 : 0] od  
);

logic [24 : 0] w;


register #(SIZE + 1) saving_mix_data (
    .clk(clk), .rst_n(rst_n), .set(set0),
    .d(md),  
    .q(w[8 : 0])
);

register saving_noise_key (
    .clk(clk), .rst_n(rst_n), .set(set0),
    .d(nk),  
    .q(w[16 : 9])
);

subtractor difference_two_list (
    .a0(w[0]),  .a1(w[1]),  .a2(w[2]),  .a3(w[3]),  .a4(w[4]),  .a5(w[5]),  .a6(w[6]),  .a7(w[7]), .a8(w[8]),
    .b0(w[9]),  .b1(w[10]), .b2(w[11]), .b3(w[12]), .b4(w[13]), .b5(w[14]), .b6(w[15]), .b7(w[16]),
    .q0(w[17]), .q1(w[18]), .q2(w[19]), .q3(w[20]), .q4(w[21]), .q5(w[22]), .q6(w[23]), .q7(w[24])
);

register saving_original_data (
    .clk(clk), .rst_n(rst_n), .set(set1),
    .d(w[24 : 17]),  
    .q(od)
);

endmodule