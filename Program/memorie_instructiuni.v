module memorie_instructiuni(
    input wire [7:0] address,
    output reg [15:0] instruction
);

    always @(address) begin
        case(address)
            8'd0:  instruction = 16'b0000_0001_0010_1010; 
            8'd1:  instruction = 16'b0001_0011_0100_1011; 
            8'd2:  instruction = 16'b0010_0101_0110_1100; 
            8'd3:  instruction = 16'b0011_0111_1000_1101; 
			8'd4:  instruction = 16'b0101_1001_1001_1001;
            8'd5:  instruction = 16'b0100_1001_1010_1110; 
            8'd6:  instruction = 16'b0110_1011_1010_1011; 
            default: instruction = 16'b1111_1111_1111_1111; 
        endcase
    end

endmodule