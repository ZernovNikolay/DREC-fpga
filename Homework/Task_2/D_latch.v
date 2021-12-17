module D_latch(	input wire data, input wire enable,
		output wire q, output wire n_q);
	wire r;
	wire s;
	assign r = (~data)&enable;
	assign s = data&enable;
	SR_latch my(r, s, q, n_q);
endmodule
