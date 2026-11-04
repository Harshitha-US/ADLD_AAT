module mealy_101 (
    input wire clk, reset, din,
    output reg detected
);
localparam S0=2'd0, S1=2'd1, S2=2'd2;
reg [1:0] state, next_state;
always @* begin
    next_state = state;
    detected = 1'b0;
    case (state)
        S0: if (din) next_state=S1; else next_state=S0;
        S1: if (din) next_state=S1; else next_state=S2;
        S2: if (din) begin next_state=S1; detected=1'b1; end
            else next_state=S0;
        default: next_state=S0;
    endcase
end
always @(posedge clk) begin
    if (reset) state <= S0;
    else       state <= next_state;
end
endmodule

module moore_101 (
    input wire clk, reset, din,
    output wire detected
);
localparam S0=2'd0, S1=2'd1, S2=2'd2, S3=2'd3;
reg [1:0] state, next_state;
assign detected = (state == S3);
always @* begin
    next_state = state;
    case (state)
        S0: if (din) next_state=S1; else next_state=S0;
        S1: if (din) next_state=S1; else next_state=S2;
        S2: if (din) next_state=S3; else next_state=S0;
        S3: if (din) next_state=S1; else next_state=S2;
        default: next_state=S0;
    endcase
end
always @(posedge clk) begin
    if (reset) state <= S0;
    else       state <= next_state;
end
endmodule
