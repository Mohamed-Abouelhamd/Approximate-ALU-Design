module mul_2x2_apprx(
output [2:0] P,
input [1:0] A,B
);

assign P[0]= A[0] & B[0]; 
assign P[1]= (A[0] & B[1]) | (A[1] & B[0]);
assign P[2]= A[1] & B[1];

endmodule 