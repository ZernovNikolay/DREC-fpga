module clk_div #(parameter DIV = 24) (
    input clk,

    output clk_out
);

reg [DIV:0]cnt = 0;
	
assign clk_out = cnt[DIV];

always @(posedge clk) begin
    cnt <= cnt + 1;
end

endmodule