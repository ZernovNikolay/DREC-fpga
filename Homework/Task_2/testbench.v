`timescale 1ns / 10ps

module flip_flop_tb();

realtime period = 10;
reg     clk;
integer j;

reg     D;
wire    Q;
wire    Qn;


always #(period/2) clk <= ~clk;

D_flip_flop flip_flop_inst(D, clk, Q, Qn);

initial begin
    
    $dumpfile("flip_flop_tb.vcd");
    $dumpvars(0, flip_flop_tb);

    clk = 1'b0;

    for (j = 0; j < 30; j = j + 1)
    begin
        D = $random;
        #(25);
    end

    $finish;
end


endmodule
