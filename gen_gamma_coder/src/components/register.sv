`timescale 1ns/1ps

module register #(
    parameter SIZE = 8
) (
    input  logic clk, rst_n, set,
    input  logic [SIZE - 1 : 0] d,  
    output logic [SIZE - 1 : 0] q
);

always_ff @( posedge clk or negedge rst_n ) begin
    if (!rst_n) 
        q <= '0;
    else if (set) 
        q <= d;
    else 
        q <= q;
end

endmodule