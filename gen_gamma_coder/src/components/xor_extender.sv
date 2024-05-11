module xor_extender (
    input  logic r0, r1, r2, r3,
    output logic q0, q1, q2, q3, q4, q5, q6, q7
);
    
assign q0 = r0 ^ r3;
assign q1 = r1 ^ r2;
assign q2 = r0 ^ r2;
assign q3 = r1 ^ r3;
assign q4 = r0 ^ r1;
assign q5 = r2 ^ r3;
assign q6 = r0 ^ r3;
assign q7 = r2 ^ r3;
        
endmodule