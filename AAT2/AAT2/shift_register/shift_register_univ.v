module shift_register_univ (
    input  wire       clk, rst,
    input  wire [1:0] s,
    input  wire [3:0] d,
    input  wire       lsb_in,
    input  wire       msb_in,
    output reg  [3:0] q
);
always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;
    else begin
        case (s)
            2'b00: q <= q;                  // hold
            2'b01: q <= {msb_in, q[3:1]};   // shift right
            2'b10: q <= {q[2:0], lsb_in};   // shift left
            2'b11: q <= d;                  // parallel load
        endcase
    end
end
endmodule