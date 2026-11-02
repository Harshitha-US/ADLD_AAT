module divide_by_n #(
    parameter N = 5
) (
    input  wire clk, rst,
    output reg  clk_out
);
localparam CW = (N <= 1) ? 1 : $clog2(N);
reg [CW-1:0] count;

always @(posedge clk) begin
    if (rst) begin
        count   <= 0;
        clk_out <= 0;
    end else if (count == N-1) begin
        count   <= 0;
        clk_out <= ~clk_out;
    end else begin
        count   <= count + 1'b1;
    end
end
endmodule