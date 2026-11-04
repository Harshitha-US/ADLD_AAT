`timescale 1ns/1ps
module tb_counters;
reg clk=0, reset=1;
wire [3:0] qs, qa;
always #5 clk=~clk;
sync_counter4 s0(.clk(clk),.reset(reset),.q(qs));
async_counter4 a0(.clk(clk),.reset(reset),.q(qa));
initial begin
    #12; reset=0;
    repeat (18) begin
        @(posedge clk); #2;
        $display("time=%0t sync=%b async=%b",$time,qs,qa);
    end
    $finish;
end
endmodule
