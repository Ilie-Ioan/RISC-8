`timescale 1ns / 1ps

module risc_processor_tb();

    
    reg clk;
    reg reset;
    
    
    wire [7:0] pc_out;
    wire [15:0] instruction_out;
    wire [7:0] alu_result_out;
    wire [7:0] reg_data1_out;
    wire [7:0] reg_data2_out;
    wire [3:0] alu_ctrl_out;
    wire reg_write_out;
    wire [7:0] next_pc_out;

    
    risc_processor uut (
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out),
        .instruction_out(instruction_out),
        .alu_result_out(alu_result_out),
        .reg_data1_out(reg_data1_out),
        .reg_data2_out(reg_data2_out),
        .alu_ctrl_out(alu_ctrl_out),
        .reg_write_out(reg_write_out),
        .next_pc_out(next_pc_out)
    );

    
    always #5 clk = ~clk;

    
    initial begin
        
        clk = 0;
        reset = 1;
        
        
        #10 reset = 0;
        
        
        #1;
        
        
        display_state();
        
        
        repeat (7) begin 
            @(posedge clk);
            #1; 
            display_state();
        end
        
        $display("\n Simulare completa. \n");
        $finish;
    end

    task display_state;
        begin
            $display("\n----------------------------------------------------");
            $display("Time=%0t ns, PC=%02h", $time, pc_out);
            $display("Instructiune curenta: %h", instruction_out);
            decode_instruction(instruction_out);
            $display("Valoare din registrul   %h: Zecimal=%0d, Binar=%b", instruction_out[11:8] ,reg_data1_out, reg_data1_out);
            $display("Valoarea din registrul  %h : Zecimal=%0d, Binar=%b", instruction_out[7:4] ,reg_data2_out, reg_data2_out);
			$display("Valoarea din registrul  %h : Zecimal=%0d, Binar=%b", instruction_out[3:0],alu_result_out, alu_result_out);
            $display("Control ALU=%h, Scriere Registru=%b, PC Următor=%02h", alu_ctrl_out, reg_write_out, next_pc_out);
            $display("----------------------------------------------------");
        end
    endtask

    task decode_instruction;
        input [15:0] instr;
        begin
            case(instr[15:12])
                4'b0000: $display("Operatie: ADD");
                4'b0001: $display("Operatie: SUB");
                4'b0010: $display("Operatie: AND");
                4'b0011: $display("Operatie: OR");
                4'b0100: $display("Operatie: XOR");
				4'b0101: $display("Operatie: NOT");
                4'b0110: $display("Operatie: SHR");
                4'b1111: $display("Operatie: Necunoscută");
                default: $display("Operație: Necunoscută");
            endcase
        end
    endtask

endmodule