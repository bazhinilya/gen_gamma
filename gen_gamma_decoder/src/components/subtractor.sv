`timescale 1ns/1ps

module subtractor (
    input  logic a0, a1, a2, a3, a4, a5, a6, a7, a8,
    input  logic b0, b1, b2, b3, b4, b5, b6, b7,
    output logic q0, q1, q2, q3, q4, q5, q6, q7
);

logic CARRY_IN;
logic g0, g1, g2, g3, g4, g5, g6, g7, g8;
logic p0, p1, p2, p3, p4, p5, p6, p7, p8;

logic q8;

assign CARRY_IN = 1;

assign c1 = g0 + 
            p0 * CARRY_IN;
assign c2 = g1 + 
            p1 * g0 + 
            p1 * p0 * CARRY_IN;
assign c3 = g2 + 
            p2 * g1 + 
            p2 * p1 * g0 + 
            p2 * p1 * p0 * CARRY_IN;
assign c4 = g3 + 
            p3 * g2 + 
            p3 * p2 * g1 + 
            p3 * p2 * p1 * g0 + 
            p3 * p2 * p1 * p0 * CARRY_IN;
assign c5 = g4 + 
            p4 * g3 + 
            p4 * p3 * g2 + 
            p4 * p3 * p2 * g1 + 
            p4 * p3 * p2 * p1 * g0 + 
            p4 * p3 * p2 * p1 * p0 * CARRY_IN;
assign c6 = g5 + 
            p5 * g4 + 
            p5 * p4 * g3 + 
            p5 * p4 * p3 * g2 + 
            p5 * p4 * p3 * p2 * g1 + 
            p5 * p4 * p3 * p2 * p1 * g0 + 
            p5 * p4 * p3 * p2 * p1 * p0 * CARRY_IN;
assign c7 = g6 + 
            p6 * g5 + 
            p6 * p5 * g4 + 
            p6 * p5 * p4 * g3 + 
            p6 * p5 * p4 * p3 * g2 + 
            p6 * p5 * p4 * p3 * p2 * g1 + 
            p6 * p5 * p4 * p3 * p2 * p1 * g0 + 
            p6 * p5 * p4 * p3 * p2 * p1 * p0 * CARRY_IN;
assign c8 = g7 + 
            p7 * g6 + 
            p7 * p6 * g5 + 
            p7 * p6 * p5 * g4 + 
            p7 * p6 * p5 * p4 * g3 + 
            p7 * p6 * p5 * p4 * p3 * g2 + 
            p7 * p6 * p5 * p4 * p3 * p2 * g1 + 
            p7 * p6 * p5 * p4 * p3 * p2 * p1 * g0 + 
            p7 * p6 * p5 * p4 * p3 * p2 * p1 * p0 * CARRY_IN;

full_sum dif0(.a(a0), .b(~b0), .p0(CARRY_IN), .q(q0), .g(g0), .p(p0));
full_sum dif1(.a(a1), .b(~b1), .p0(c1),       .q(q1), .g(g1), .p(p1));
full_sum dif2(.a(a2), .b(~b2), .p0(c2),       .q(q2), .g(g2), .p(p2));
full_sum dif3(.a(a3), .b(~b3), .p0(c3),       .q(q3), .g(g3), .p(p3));
full_sum dif4(.a(a4), .b(~b4), .p0(c4),       .q(q4), .g(g4), .p(p4));
full_sum dif5(.a(a5), .b(~b5), .p0(c5),       .q(q5), .g(g5), .p(p5));
full_sum dif6(.a(a6), .b(~b6), .p0(c6),       .q(q6), .g(g6), .p(p6));
full_sum dif7(.a(a7), .b(~b7), .p0(c7),       .q(q7), .g(g7), .p(p7));
full_sum dif8(.a(a8), .b(1),  .p0(c8),       .q(q8), .g(g8), .p(p8));

endmodule