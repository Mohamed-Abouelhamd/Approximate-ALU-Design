module LOA(
output [15:0] sum,
output c_out,
input [15:0] a,b
);

wire MSB_cin;

assign sum[0]= a[0] | b[0];
assign sum[1]= a[1] | b[1];

assign MSBs_cin= a[1]&b[1];

rca_n #(.n(14)) MSB_adder (
                           .x(a[15:2]), 
                           .y(b[15:2]),
									.c_in(MSBs_cin),
									.s(sum[15:2]),
									.c_out(c_out));

endmodule 