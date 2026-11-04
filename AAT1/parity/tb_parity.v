`timescale 1ns/1ps
module tb_parity4;
reg [3:0] data;
reg parity_in;
wire parity, error;
parity4 dut(.data(data), .parity(parity), .parity_in(parity_in), .error(error));
initial begin
    data=4'b1011; #10;
    parity_in=parity; #10;
    $display("data=%b generated parity=%b received parity=%b error=%b",data,parity,parity_in,error);
    parity_in=~parity; #10;
    $display("Injected parity error: error=%b",error);
    data=4'b0000; #10; parity_in=1'b0; #10;
    $display("data=%b parity=%b error=%b",data,parity,error);
    $finish;
end
endmodule
