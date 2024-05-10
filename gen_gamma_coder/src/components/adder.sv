module adder #(
    parameter SIZE = 8
) (
    input logic [SIZE - 1 : 0] lst_fst, lst_sec,
    output logic [SIZE - 1 : 0] out,
    output logic carry
);
    
assign { carry, out } = lst_fst + lst_sec;

endmodule