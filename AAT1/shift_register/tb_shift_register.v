`timescale 1ns/1ps
module tb_shift_register4;
reg clk=0, reset=1, serial_in=0;
wire [3:0] q;
wire serial_out;
always #5 clk=~clk;
shift_register4 dut(.clk(clk),.reset(reset),.serial_in(serial_in),.q(q),.serial_out(serial_out));
initial begin
    #12; reset=0;
    serial_in=1; @(posedge clk); #1; $display("q=%b out=%b",q,serial_out);
    serial_in=0; @(posedge clk); #1; $display("q=%b out=%b",q,serial_out);
    serial_in=1; @(posedge clk); #1; $display("q=%b out=%b",q,serial_out);
    serial_in=1; @(posedge clk); #1; $display("q=%b out=%b",q,serial_out);
    serial_in=0; @(posedge clk); #1; $display("q=%b out=%b",q,serial_out);
    $finish;
end
endmodule
