module gen_gamma_coder #(
    parameter SIZE = 8
) (
    input logic clk, res_n,
    input logic [SIZE - 1 : 0] inp_data, 
    output logic [SIZE : 0] out_data
);

logic [SIZE - 1 : 0] save_input_data;
logic [SIZE / 2 - 1 : 0] lst_rand;
logic [SIZE - 1 : 0] rand_data, save_rand_data;
logic [SIZE - 1 : 0] added_data;
logic carry;

register saving_input_data(.clk(clk), .res_n(res_n), .inp_data(inp_data), .out(save_input_data));

ring_oscillator #(3) get_rand_num_3(.out(lst_rand[0]));
ring_oscillator #(5) get_rand_num_5(.out(lst_rand[1]));
ring_oscillator #(7) get_rand_num_7(.out(lst_rand[2]));
ring_oscillator #(9) get_rand_num_9(.out(lst_rand[3]));

xor_extender get_rand_data(.lst_rand(lst_rand), .out(rand_data));
register saving_rand_data(.clk(clk), .res_n(res_n), .inp_data(rand_data), .out(save_rand_data));

adder coding_two_lst(.lst_fst(save_input_data), .lst_sec(save_rand_data), .out(added_data), .carry(carry));
register #(SIZE + 1) saving_coded_data(.clk(clk), .res_n(res_n), .inp_data( {carry, added_data} ), .out(out_data));

endmodule