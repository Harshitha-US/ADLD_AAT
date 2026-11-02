`timescale 1ns/1ps
module tb_divide_by_n;
parameter N = 5;
reg clk = 0, rst = 1;
wire clk_out;

divide_by_n #(.N(N)) dut (.clk(clk), .rst(rst), .clk_out(clk_out));

always #5 clk = ~clk;

initial begin
    $shm_open("div_n.shm");
    $shm_probe("AS");
    #12  rst = 0;
    #100 rst = 1;
    #10  rst = 0;
    #100 $finish;
end
endmodule