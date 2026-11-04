module shift_register4 (
    input wire clk, reset, serial_in,
    output reg [3:0] q,
    output wire serial_out
);
assign serial_out = q[0];
always @(posedge clk) begin
    if (reset) q <= 4'b0000;
    else       q <= {serial_in, q[3:1]};
end
endmodule
