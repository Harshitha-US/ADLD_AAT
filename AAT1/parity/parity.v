module parity4 (
    input wire [3:0] data,
    output wire parity,
    input wire parity_in,
    output wire error
);
assign parity = ^data;            // even-parity bit to append
assign error  = ^{data, parity_in}; // 1 means parity error
endmodule
