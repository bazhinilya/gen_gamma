module register #(
    parameter SIZE = 8
) (
    input logic clk, res_n,
    input logic [SIZE - 1 : 0]inp_data,
    output logic [SIZE - 1 : 0]out
);

always_ff @( posedge clk or negedge res_n ) begin
    if (!res_n) out <= '0;
    else out = inp_data;
end

endmodule