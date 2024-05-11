module ring_oscillator (
	output logic f0, f1, f2, f3
);

logic [2 : 0] out_inv_3;
logic [4 : 0] out_inv_5;
logic [6 : 0] out_inv_7;
logic [8 : 0] out_inv_9;

genvar i;
generate
	
	for (i = 0; i < 2; i = i + 1) begin : inv_3
		inverter #(.DELAY(5)) i0(.in(out_inv_3[i]), .out(out_inv_3[i + 1]));
	end
	inverter #(.DELAY(5)) i1(.in(out_inv_3[2]), .out(out_inv_3[0]));
	
	for (i = 0; i < 4; i = i + 1) begin : inv_5
		inverter #(.DELAY(5)) i2(.in(out_inv_5[i]), .out(out_inv_5[i + 1]));
	end
	inverter #(.DELAY(5)) i3(.in(out_inv_5[4]), .out(out_inv_5[0]));
	
	for (i = 0; i < 6; i = i + 1) begin : inv_7
		inverter #(.DELAY(5)) i4(.in(out_inv_7[i]), .out(out_inv_7[i + 1]));
	end
	inverter #(.DELAY(5)) i5(.in(out_inv_7[6]), .out(out_inv_7[0]));
	
	for (i = 0; i < 8; i = i + 1) begin : inv_9
		inverter #(.DELAY(5)) i6(.in(out_inv_9[i]), .out(out_inv_9[i + 1]));
	end
	inverter #(.DELAY(5)) i7(.in(out_inv_9[8]), .out(out_inv_9[0]));
	
endgenerate

assign f0 = out_inv_3[2];
assign f1 = out_inv_5[4];
assign f2 = out_inv_7[6];
assign f3 = out_inv_9[8];

endmodule 