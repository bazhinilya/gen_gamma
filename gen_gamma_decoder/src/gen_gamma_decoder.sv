module gen_gamma_decoder #(
    parameter SIZE = 8
) (
    input logic clk, res_n,
    input logic [SIZE : 0] mix_data,
    input logic [SIZE - 1 : 0] noise_key; 
    output logic [SIZE : 0] out_data
);

logic [SIZE : 0] save_mix_data;
logic [SIZE - 1 : 0] save_noise_key;
logic [SIZE - 1 : 0] orig_data;
logic [SIZE - 1 : 0] save_orig_data;


register #(SIZE) saving_mix_data(.clk(clk), .res_n(res_n), .inp_data(mix_data), .out(save_mix_data));
register saving_noise_key(.clk(clk), .res_n(res_n), .inp_data(noise_key), .out(save_noise_key));

subtractor decoding_two_lst(.lst_fst(save_mix_data), .lst_sec(save_noise_key), .out(orig_data));

register saving_orig_data(.clk(clk), .res_n(res_n), .inp_data(orig_data), .out(save_orig_data));

endmodule