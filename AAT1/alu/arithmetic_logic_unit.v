module alu4 (
    input  wire [3:0] A, B,
    input  wire [2:0] sel,
    output reg  [3:0] Y,
    output reg        C
);
always @* begin
    Y = 4'b0000;
    C = 1'b0;
    case (sel)
        3'b000: Y = A & B;
        3'b001: Y = A | B;
        3'b010: Y = A ^ B;
        3'b011: {C, Y} = {1'b0, A} + {1'b0, B};
        3'b100: begin Y = A - B; C = (A < B); end
        3'b101: Y = A;
        3'b110: Y = B;
        default: begin Y = 4'b0000; C = 1'b0; end
    endcase
end
endmodule
