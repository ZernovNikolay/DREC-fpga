module D_flip_flop(	input wire data, input wire enable,
			output wire q, output wire n_q);

	wire in_w;
	D_latch master(.data(data), .enable(!enable), .q(in_w), .n_q());
	D_latch slave(.data(in_w), .enable(enable), .q(q), .n_q(n_q));
endmodule
