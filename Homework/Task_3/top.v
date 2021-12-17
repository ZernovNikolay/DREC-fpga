module top(
    input CLK,

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G
);


wire [3:0]numbers;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~numbers;

wire [6:0]segments;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} = segments;

reg [21:0]clk_nmb_reg = 0;
reg [12:0]clk_seg_reg = 0;

always @(posedge CLK) begin
	clk_nmb_reg <= clk_nmb_reg + 1;
end

assign clk_nmb = clk_nmb_reg[21];

always @(posedge CLK) begin
	clk_seg_reg <= clk_seg_reg + 1;
end

assign clk_seg = clk_seg_reg[12];

master_spi master_spi(.clk(clk_nmb), .mosi(mosi), .miso(miso), .clk_spi(clk_spi));

wire [7:0]data_to_seg;
slave_spi slave_spi(.mosi(mosi), .miso(miso), .clk(clk_spi), .data_to_seg(data_to_seg));
wire [15:0]d = {8'h00, data_to_seg};

hex_display hex_display(.clk(clk_seg), .data(d), .numbers(numbers), .segments(segments));

endmodule