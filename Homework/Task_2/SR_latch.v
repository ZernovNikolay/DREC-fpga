module SR_latch(input wire reset, input wire set, 
		output wire q, output wire neg_q);

	assign q = ~(reset|neg_q);
	assign neg_q = ~(set|q);

endmodule
