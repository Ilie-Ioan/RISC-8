module contor_program(
    input wire clk,
    input wire reset,
    input wire [7:0] next_pc,
    output reg [7:0] pc
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 8'h00;
        else
            pc <= next_pc;
    end
endmodule