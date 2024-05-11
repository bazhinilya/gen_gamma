module full_sum (
    input logic a, b, p0,
    output logic q,
    output logic g, p
);

assign q = (a ^ b) ^ p0;
assign g = a * b;
assign p = a + b;

endmodule