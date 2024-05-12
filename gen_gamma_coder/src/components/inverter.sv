`timescale 1ns/1ps

module inverter #(
	parameter DELAY = 10
) (
	input  logic in,
	output logic out
);

assign #2 out = ~in;

endmodule 