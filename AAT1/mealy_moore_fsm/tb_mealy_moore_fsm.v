`timescale 1ns/1ps
module tb_fsm_101;
reg clk=0, reset=1, din=0;
wire mealy_detected, moore_detected;
always #5 clk=~clk;
mealy_101 m0(.clk(clk),.reset(reset),.din(din),.detected(mealy_detected));
moore_101 r0(.clk(clk),.reset(reset),.din(din),.detected(moore_detected));
task send_bit(input reg b);
begin
    @(negedge clk); din=b;
    @(posedge clk); #1;
    $display("din=%b mealy=%b moore=%b",din,mealy_detected,moore_detected);
end
endtask
initial begin
    #12; reset=0;
    send_bit(1); send_bit(0); send_bit(1);
    send_bit(1); send_bit(0); send_bit(1);
    $finish;
end
endmodule
