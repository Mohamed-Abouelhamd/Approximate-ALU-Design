module mul_4x4_apprx(
output [7:0] P,
input [3:0] A,B
);
wire [2:0] p0,p1,p2,p3;
wire c1,c2,c3,c4,c5,c6;
wire s1,s2,s3,s4,s5,s6;

mul_2x2_apprx m0(
				.A(A[1:0]),
				.B(B[1:0]),
				.P(p0)
);
mul_2x2_apprx m1(
				.A(A[3:2]),
				.B(B[1:0]),
				.P(p1)
);
mul_2x2_apprx m2(
				.A(A[1:0]),
				.B(B[3:2]),
				.P(p2)
);
mul_2x2_apprx m3(
				.A(A[3:2]),
				.B(B[3:2]),
				.P(p3)
);

assign P[0]=p0[0];
assign P[1]=p0[1];

fulladder fa1(p0[2],p1[0],p2[0],s1,c1);
assign P[2]=s1;

fulladder fa2(c1,p1[1],p2[1],s2,c2);
assign P[3]=s2;

fulladder fa3(p1[2],p2[2],p3[0],s3,c3);
halfadder ha1(c2, s3, s4, c4);
assign P[4]=s4;

fulladder fa4(c3,c4,p3[1],s5,c5);
assign P[5]=s5;

halfadder ha2(p3[2], c5, s6, c6);
assign P[6]=s6;
assign P[7]=c6;

endmodule 
