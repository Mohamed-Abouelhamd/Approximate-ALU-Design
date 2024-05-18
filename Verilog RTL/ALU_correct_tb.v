`timescale 1ns/100ps
module ALU_correct_tb();
wire [16:0] y;
reg  [15:0] a,b;
reg [2:0]sel;
reg rst_n,clk;

ALU_correct m1(
				.y(y),
				.a(a),
				.b(b),
				.sel(sel),
				.rst_n(rst_n),
				.clk(clk)
);
localparam T=100;
always
	begin
		clk=1'b0;
		#(T/2);
		clk=1'b1;
		#(T/2);
	end
initial begin
	rst_n=1'b0;
	a= 16'd50;
	b= 16'd27;
	sel= 3'b011;
	# 50
	rst_n=1'b1;
	a= 16'd49;
	b= 16'd13;
	sel= 3'b011;
	#100
	a= 16'd30;
	b= 16'd111;
	sel= 3'b010;
	#100
	a= 16'd89;
	b= 16'd11;
	sel= 3'b100;
	#100
	a= 16'd38;
	b= 16'd9;
	sel= 3'b101;
	#100
	a= 16'd62;
	b= 16'd3;
	sel= 3'b110;
	#100
	a= 16'd42;
	b= 16'd10;
	sel= 3'b111;
	#100
	a= 16'd50;
	b= 16'd14;
	sel= 3'b000;
	#200
	a= 16'd13;
	b= 16'd7;
	sel= 3'b001;
	#300
	$stop;
end
endmodule 