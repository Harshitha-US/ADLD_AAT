`timescale 1ns/1ps
module tb_timer_module;
reg clk=0, reset=1, enable=0;
wire pulse;
always #5 clk=~clk;
timer_module #(.PERIOD(4)) dut(.clk(clk),.reset(reset),.enable(enable),.pulse(pulse));
initial begin
    #12; reset=0; enable=1;
    repeat (12) begin
        @(posedge clk); #1; $display("time=%0t pulse=%b",$time,pulse);
    end
    $finish;
end
endmodule
