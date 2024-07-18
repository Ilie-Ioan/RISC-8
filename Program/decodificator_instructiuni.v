module decodificator_instructiuni(
    input wire [15:0] instruction,
    output reg [3:0] opcode,
    output reg [3:0] rs,
    output reg [3:0] rt,
    output reg [3:0] rd,
    output reg [7:0] immediate
);

    always @(*) begin
        opcode = instruction[15:12];
        rs = instruction[11:8];
        rt = instruction[7:4];
        rd = instruction[3:0];
        immediate = instruction[7:0];
    end

endmodule