module unitate_de_control(
    input wire [3:0] opcode,
    output reg [3:0] alu_ctrl,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg branch,
    output reg jump
);

    always @(*) begin
        case(opcode)
            4'b0000: begin 
                alu_ctrl = 4'b0000;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
                jump = 1'b0;
            end
            4'b0001: begin 
                alu_ctrl = 4'b0001;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
                jump = 1'b0;
            end
            4'b0010: begin 
                alu_ctrl = 4'b0010;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
                jump = 1'b0;
            end
            4'b0011: begin 
                alu_ctrl = 4'b0011;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
                jump = 1'b0;
            end
            4'b0100: begin 
                alu_ctrl = 4'b0100;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
                jump = 1'b0;
            end
            4'b0101: begin 
                alu_ctrl = 4'b0101;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
                jump = 1'b0;
            end
            4'b0110: begin 
                alu_ctrl = 4'b0110;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
                jump = 1'b0;
            end
            4'b0111: begin 
                alu_ctrl = 4'b0111;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
                jump = 1'b0;
            end
    
            default: begin
                alu_ctrl = 4'b1111;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
                jump = 1'b0;
            end
        endcase
    end

endmodule