module ALU(SrcA, SrcB, control, zero, sign, res);
    input [31:0] SrcA, SrcB;
    input [2:0] control;
    output zero, sign;
    output [31:0] res; reg [31:0] res;

    always @(SrcA,SrcB, control) begin
        case (control)
            3'b000:  res = $signed(SrcA) + $signed(SrcB);
            3'b001:  res = $signed(SrcA) - $signed(SrcB);
            3'b010:  res = SrcA & SrcB;
            3'b011:  res = SrcA | SrcB;
	        3'b100:  res = SrcA ^ SrcB;
            3'b101:  res = ($signed(SrcA) < $signed(SrcB)) ? 'd1 : 'd0;
            3'b110:  res = SrcA < SrcB ? 'd1 : 'd0;
            default: res = {32'b0};
        endcase
    end

    assign zero = ~|res;
    assign sign = res[31];
endmodule