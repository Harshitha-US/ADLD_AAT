`timescale 1ns/1ps
module tb_johnson_counter4;
reg clk=0, reset=1;
wire [3:0] q;
always #5 clk=~clk;
johnson_counter4 dut(.clk(clk),.reset(reset),.q(q));
initial begin
    #12; reset=0;
    repeat (10) begin @(posedge clk); #1; $display("time=%0t q=%b",$time,q); end
    $finish;
end
endmodule
