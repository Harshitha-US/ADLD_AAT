`timescale 1ns/1ps
module tb_shift_register_univ;
reg clk = 0, rst = 1, lsb_in = 0, msb_in = 0;
reg [1:0] s = 2'b00;
reg [3:0] d = 4'h0;
wire [3:0] q;

shift_register_univ dut (.clk(clk), .rst(rst), .s(s), .d(d),
                         .lsb_in(lsb_in), .msb_in(msb_in), .q(q));

always #5 clk = ~clk;

initial begin
    $shm_open("shift_reg.shm");
    $shm_probe("AS");
    $monitor("t=%0t rst=%b s=%b d=%h lsb=%b msb=%b q=%h",
              $time, rst, s, d, lsb_in, msb_in, q);

    #10 rst = 0; d = 4'hB; s = 2'b11;
    #10 s = 2'b00;
    #10 s = 2'b01; msb_in = 1;
    #10 msb_in = 0;
    #10 s = 2'b10; lsb_in = 1;
    #10 lsb_in = 0;
    #40 $finish;
end
endmodule