module risc_processor(
    input wire clk,
    input wire reset,
    
    output wire [7:0] pc_out,
    output wire [15:0] instruction_out,
    output wire [7:0] alu_result_out,
    output wire [7:0] reg_data1_out,
    output wire [7:0] reg_data2_out,
    output wire [3:0] alu_ctrl_out,
    output wire reg_write_out,
    output wire [7:0] next_pc_out
);

    wire [15:0] instruction;
    wire [7:0] pc, next_pc;
    wire [7:0] alu_result;
    wire [7:0] reg_data1, reg_data2;
    wire [3:0] alu_ctrl;
    wire reg_write, mem_read, mem_write, branch, jump;
    wire [7:0] immediate;
    
   
    wire [3:0] opcode, rs, rt, rd;

    assign pc_out = pc;
    assign instruction_out = instruction;
    assign alu_result_out = alu_result;
    assign reg_data1_out = reg_data1;
    assign reg_data2_out = reg_data2;
    assign alu_ctrl_out = alu_ctrl;
    assign reg_write_out = reg_write;
    assign next_pc_out = next_pc;

    contor_program cp_unit (
        .clk(clk),
        .reset(reset),
        .next_pc(next_pc),
        .pc(pc)
    );

    memorie_instructiuni mem_instr (
        .address(pc),
        .instruction(instruction)
    );

    decodificator_instructiuni decoder (
        .instruction(instruction),
        .opcode(opcode),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .immediate(immediate)
    );

    unitate_de_control uc (
        .opcode(opcode),
        .alu_ctrl(alu_ctrl),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch(branch),
        .jump(jump)
    );

    alu alu_unit (
        .a(reg_data1),
        .b(reg_data2),
        .alu_ctrl(alu_ctrl),
        .result(alu_result)
    );

    fisier_registre reg_file (
        .clk(clk),
        .write_enable(reg_write),
        .read_reg1(rs),
        .read_reg2(rt),
        .write_reg(rd),
        .write_data(alu_result),
        .read_data1(reg_data1),
        .read_data2(reg_data2)
    );

    pc_urmator next_pc_unit (
        .pc(pc),
        .immediate(immediate),
        .jump(jump),
        .branch(branch),
        .alu_zero(alu_result == 8'b0),
        .next_pc(next_pc)
    );

endmodule