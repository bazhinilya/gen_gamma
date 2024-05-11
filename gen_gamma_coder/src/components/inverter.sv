module inverter #(
	parameter DELAY = 5
) (
	input logic in,
	output logic out
);

assign #DELAY out = ~in;

endmodule 