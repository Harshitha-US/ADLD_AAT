`timescale 1ns/1ps
module lfsr4_tb;
    reg clk = 0, rst = 1;
    wire [3:0] q;
    wire rnd;

    lfsr4 dut (.clk(clk), .rst(rst), .q(q), .rnd(rnd));

    always #5 clk = ~clk;

    initial begin
        $monitor("t=%0t q=%b (%d) rnd=%b", $time, q, q, rnd);
        #12 rst = 0;
        #200 $finish;                        // more than 15 clocks: sequence repeats
    end
endmodule
