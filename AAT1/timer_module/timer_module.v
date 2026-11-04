module timer_module #(
    parameter PERIOD = 10
) (
    input wire clk, reset, enable,
    output reg pulse
);
localparam CW = (PERIOD <= 1) ? 1 : $clog2(PERIOD);
reg [CW-1:0] count;
always @(posedge clk) begin
    if (reset) begin
        count <= 0;
        pulse <= 0;
    end else if (enable) begin
        if (count == PERIOD-1) begin
            count <= 0;
            pulse <= 1;
        end else begin
            count <= count + 1'b1;
            pulse <= 0;
        end
    end else begin
        pulse <= 0;
    end
end
endmodule
