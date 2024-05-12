`timescale 1ns/1ps

module ring_oscillator #(
    parameter DELAY = 5
) (
	input logic en,
	output logic f0, f1, f2, f3
);

logic [2 : 0] out_inv_3;
logic [4 : 0] out_inv_5;
logic [6 : 0] out_inv_7;
logic [8 : 0] out_inv_9;

genvar i;
generate
	
	for (i = 0; i < 2; i = i + 1) begin : inv_3
		inverter i0(.in(out_inv_3[i]), .out(out_inv_3[i + 1]));
	end
	nand #(DELAY + 5) (out_inv_3[0], out_inv_3[2], en);
	
	for (i = 0; i < 4; i = i + 1) begin : inv_5
		inverter i2(.in(out_inv_5[i]), .out(out_inv_5[i + 1]));
	end
	nand #(DELAY + 5) (out_inv_5[0], out_inv_5[4], en);
	
	for (i = 0; i < 6; i = i + 1) begin : inv_7
		inverter i4(.in(out_inv_7[i]), .out(out_inv_7[i + 1]));
	end
	nand #(DELAY + 5) (out_inv_7[0], out_inv_7[6], en);
	
	for (i = 0; i < 8; i = i + 1) begin : inv_9
		inverter #(.DELAY(DELAY)) i6(.in(out_inv_9[i]), .out(out_inv_9[i + 1]));
	end
	nand #(DELAY + 5) (out_inv_9[0], out_inv_9[8], en);
	
endgenerate

assign f0 = out_inv_3[2];
assign f1 = out_inv_5[4];
assign f2 = out_inv_7[6];
assign f3 = out_inv_9[8];

endmodule 