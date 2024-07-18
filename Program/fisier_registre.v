module fisier_registre(
    input wire clk,
    input wire write_enable,
    input wire [3:0] read_reg1,
    input wire [3:0] read_reg2,
    input wire [3:0] write_reg,
    input wire [7:0] write_data,
    output reg [7:0] read_data1,
    output reg [7:0] read_data2
);
    reg [7:0] registers [0:15];
    integer i;
    
    initial begin
		registers[0] = 8'd0;
		registers[1] = 8'd128;
		registers[2] = 8'd64;
		registers[3] = 8'd32;
		registers[4] = 8'd16;
		registers[5] = 8'd8;
		registers[6] = 8'd4;
		registers[7] = 8'd2;
		registers[8] = 8'd1;
		registers[9] = 8'd255;
		registers[10] = 8'd0;
		registers[11] = 8'd0;
		registers[12] = 8'd0;
		registers[13] = 8'd0;
		registers[14] = 8'd0;
		
	
	end
    
    always @(*) begin
        read_data1 = registers[read_reg1];
        read_data2 = registers[read_reg2];
    end
	 always @(posedge clk) begin
        if (write_enable) begin
            registers[write_reg] <= write_data;
        end
    end

endmodule