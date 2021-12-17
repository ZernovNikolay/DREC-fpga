module slave_spi(

	input mosi,
	output miso,
	input clk,
	input ss,
	output [7:0]data_to_seg
);

reg [7:0]shift_register;
reg [3:0]read_f = 0;
reg [7:0]read;
reg [1:0]flag = 0;

always @(negedge clk) begin
	flag[0] = 1'b0;
	
end 
always @(posedge clk) begin
	flag[0] = 1'b1;
end


always @(flag[0] == 1'b0) begin
	if (~ss) begin
		if (~read_f[3]) begin
			shift_register <= {shift_register[6:0], mosi};
			read_f <= read_f + 1; 
		end else begin
			read_f <= 0;
			read <= shift_register;
		end
	end
end

assign miso = shift_register[7];

assign data_to_seg = read;

endmodule