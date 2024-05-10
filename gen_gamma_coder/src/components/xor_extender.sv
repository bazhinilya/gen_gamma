module xor_extender #(
    parameter SIZE = 4
) (
    input logic [SIZE - 1 : 0] lst_rand,
    output logic [SIZE * 2 - 1 : 0] out
);
    
assign out = { 
    lst_rand[0] ^ lst_rand[4],
    lst_rand[1] ^ lst_rand[3],
    lst_rand[2] ^ lst_rand[2],
    lst_rand[0] ^ lst_rand[4],
    lst_rand[1] ^ lst_rand[3],
    lst_rand[2] ^ lst_rand[2],
    lst_rand[0] ^ lst_rand[4],
    lst_rand[1] ^ lst_rand[3]
};
        
endmodule