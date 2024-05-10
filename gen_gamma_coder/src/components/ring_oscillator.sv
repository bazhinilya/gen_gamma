module ring_oscillator #(
    parameter SIZE = 3
) (
    output logic out
);
    
logic [SIZE-1:0] w;

genvar i;
generate
    for (i = 0; i < SIZE - 1; i++)
        not(w[i + 1], w[i]);
    not(w[0], w[SIZE - 1]);
endgenerate

assign out = w[2];

endmodule