module Controller(zero, sign, opcode, func3, func7, PCSrc, ResultSrc, MemWrite, Alu_func, ALUSrc, ImmSrc, RegWrite);
	input zero, sign;
	input [6:0] opcode;
	input [2:0] func3;
	input [6:0] func7;
	output [1:0] PCSrc, ResultSrc; reg [1:0] PCSrc, ResultSrc;
	output MemWrite, ALUSrc, RegWrite; reg MemWrite, ALUSrc, RegWrite;
	output [2:0] Alu_func, ImmSrc; reg [2:0] Alu_func, ImmSrc;

	always @(opcode, func3, func7) begin
		case(opcode)
			7'b0110011: begin
				ResultSrc <= 2'b00;
				RegWrite <= 1;
				ImmSrc <= 3'b000;
				ALUSrc <= 0;
				MemWrite <= 0;
				PCSrc <= 2'b10;
				if (func7 == 7'b0000000 & func3 == 3'b000) // add
					Alu_func = 3'b000;
				else if (func7 == 7'b0100000 & func3 == 3'b000) // sub
					Alu_func = 3'b001;
				else if (func7 == 7'b0000000 & func3 == 3'b111) // and
					Alu_func = 3'b010;
				else if (func7 == 7'b0000000 & func3 == 3'b110) // or
					Alu_func = 3'b011;
				else if (func7 == 7'b0000000 & func3 == 3'b010) // slt
					Alu_func = 3'b101;
				else if (func7 == 7'b0000000 & func3 == 3'b011) // sltu
					Alu_func = 3'b110;
			end
			7'b0000011: begin // lw
				RegWrite <= 1;
				ImmSrc <= 3'b000;
				ALUSrc <= 1;
				MemWrite <= 0;
				ResultSrc <= 2'b01;
				PCSrc <= 2'b10;
				if (func3 == 3'b010)
					Alu_func = 3'b000;
			end
			7'b0010011: begin
				RegWrite <= 1;
				ImmSrc <= 3'b000;
				ALUSrc <= 1;
				MemWrite <= 0;
				ResultSrc <= 2'b00;
				PCSrc <= 2'b10;
				case (func3)
					3'b000: Alu_func = 3'b000;
					3'b110: Alu_func = 3'b011;
					3'b100: Alu_func = 3'b100;
					3'b010: Alu_func = 3'b101;
					3'b011: Alu_func = 3'b110;
				endcase
			end
			7'b1100111: begin // jalr
				RegWrite <= 1;
				ImmSrc <= 3'b000;
				ALUSrc <= 1;
				MemWrite <= 0;
				ResultSrc <= 2'b11;
				PCSrc <= 2'b00;
				if (func3 == 3'b000) 
					Alu_func = 3'b000;
			end
			7'b0100011: begin // sw
				RegWrite <= 0;
				ImmSrc <= 3'b001;
				ALUSrc <= 1;
				MemWrite <= 1;
				ResultSrc <= 2'b00;
				PCSrc <= 2'b10;
				if (func3 == 3'b010)
					Alu_func = 3'b000;
			end
			7'b1101111: begin // jal
				RegWrite <= 1; 
				ImmSrc <= 3'b100;
				ALUSrc <= 0; 
				MemWrite <= 0; 
				ResultSrc <= 2'b11; 
				PCSrc <= 2'b01;
				Alu_func = 3'b000;
			end
			7'b1100011: begin
				RegWrite <= 0;
				ImmSrc <= 3'b010;
				ALUSrc <= 0;
				MemWrite <= 0;
				ResultSrc <= 2'b00;
				if (func3 == 3'b000) begin // beq
					Alu_func = 3'b001; 
					if(zero == 1) 
						PCSrc = 2'b01;
					else 
						PCSrc = 2'b10;
				end
				if (func3 == 3'b001) begin // bne
					Alu_func = 3'b001;
					if(zero == 1)
						PCSrc = 2'b10;
					else
						PCSrc = 2'b01;
				end
				if (func3 == 3'b100) begin // blt
					Alu_func = 3'b001;
					if(sign == 1)
						PCSrc = 2'b01;
					else
						PCSrc = 2'b10;
				end
				if (func3 == 3'b101) begin // bge
					Alu_func = 3'b001;
					if(sign == 0 | zero == 1)
						PCSrc = 2'b01;
					else
						PCSrc = 2'b10;
				end
			end
			7'b0110111: begin // lui
				RegWrite <= 1; 
				ImmSrc <= 3'b011; 
				ALUSrc <= 1; 
				MemWrite <= 0; 
				ResultSrc <= 2'b10; 
				PCSrc <= 2'b10;
				Alu_func = 3'b000;
			end
		endcase
	end
endmodule