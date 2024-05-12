`timescale 1ns/1ps

module xor_extender (
    input  logic en,
    output logic [7 : 0] q
);
    
logic [3 : 0] w;

ring_oscillator run_ring_oscillator (
    .en(en), .f0(w[0]), .f1(w[1]), .f2(w[2]), .f3(w[3])
);

assign q = {
    w[0] ^ w[3],
    w[1] ^ w[2],
    w[0] ^ w[2],
    w[1] ^ w[3],
    w[0] ^ w[1],
    w[2] ^ w[3],
    w[0] ^ w[3],
    w[2] ^ w[3]
};
        
endmodule