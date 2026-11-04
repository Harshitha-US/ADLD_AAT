module comparator4 (
    input wire [3:0] A, B,
    output wire gt, eq, lt
);
assign gt = (A > B);
assign eq = (A == B);
assign lt = (A < B);
endmodule
