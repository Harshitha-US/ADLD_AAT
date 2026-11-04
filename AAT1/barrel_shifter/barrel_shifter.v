module barrel_shifter4 (
    input wire [3:0] data,
    input wire [1:0] shamt,
    input wire dir,
    output reg [3:0] y
);
always @* begin
    if (dir == 1'b0)
        y = data << shamt;
    else
        y = data >> shamt;
end
endmodule
