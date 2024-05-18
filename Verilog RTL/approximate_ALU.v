module approximate_ALU(
output reg [16:0]y,
input [15:0]a,b,
input [2:0]sel
);
wire [7:0]mul_out;
wire [15:0]loa_out;
wire c_out;
mul_4x4_apprx m1(
			.P(mul_out),
			.A(a[3:0]),
			.B(b[3:0])
);

LOA m2(
			.sum(loa_out),
			.c_out(c_out),
			.a(a),
			.b(b)
);

always@*
	begin
		case(sel)
			3'b000: y={c_out,loa_out};
			3'b001: y={9'b0_0000_0000,mul_out};
			3'b010: y={1'b0,a & b};
			3'b011: y={1'b0,a | b};
			3'b100: y={1'b0,a ^ b};
			3'b101: y={1'b0, ~a};
			3'b110: y={1'b0,a << b[3:0]};
			3'b111: y={1'b0,a >> b[3:0]};
		endcase
	end

endmodule 