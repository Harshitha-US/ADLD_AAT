module ring_counter4 (
    input wire clk, reset,
    output reg [3:0] q
);
always @(posedge clk) begin
    if (reset)
        q <= 4'b0001;
    else
        q <= {q[2:0], q[3]};
end
endmodule
