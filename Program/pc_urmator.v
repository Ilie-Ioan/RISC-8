module pc_urmator(
    input wire [7:0] pc,
    input wire [7:0] immediate,
    input wire jump,
    input wire branch,
    input wire alu_zero,
    output reg [7:0] next_pc
);

    always @(*) begin
        if (jump)
            next_pc = immediate;
        else if (branch && alu_zero)
            next_pc = pc + immediate;
        else
            next_pc = pc + 1;
    end

endmodule