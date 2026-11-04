module lfsr4(
    input clk, rst,
    output reg [3:0] q,
    output rnd
);
    always @(posedge clk or posedge rst) begin
        if (rst) q <= 4'b0001;               // non-zero seed
        else     q <= {q[2:0], q[3] ^ q[2]};
    end
    assign rnd = q[3];                       // serial random bit stream
endmodule
