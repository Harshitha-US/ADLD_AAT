`timescale 1ns/1ps
module tb_divide_by_n;
reg clk=0, reset=1;
wire clk_out;
always #5 clk=~clk;
divide_by_n #(.N(3)) dut(.clk(clk),.reset(reset),.clk_out(clk_out));
initial begin
    #12; reset=0;
    repeat (24) begin @(posedge clk); #1; $display("time=%0t clk_out=%b",$time,clk_out); end
    $finish;
end
endmodule
