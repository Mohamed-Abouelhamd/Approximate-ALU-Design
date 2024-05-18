module mul_4x4_exact(
output [7:0]product,
input [3:0]inp1,
input [3:0]inp2
);
assign product[0]=(inp1[0]&inp2[0]);
  
wire x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17;
  
halfadder HA1((inp1[1]&inp2[0]),(inp1[0]&inp2[1]),product[1],x1);
fulladder FA1(inp1[1]&inp2[1],(inp1[0]&inp2[2]),x1,x2,x3);
fulladder FA2((inp1[1]&inp2[2]),(inp1[0]&inp2[3]),x3,x4,x5);
halfadder HA2((inp1[1]&inp2[3]),x5,x6,x7);

halfadder HA3(x2,(inp1[2]&inp2[0]),product[2],x15);
fulladder FA5(x4,(inp1[2]&inp2[1]),x15,x14,x16);
fulladder FA4(x6,(inp1[2]&inp2[2]),x16,x13,x17);
fulladder FA3(x7,(inp1[2]&inp2[3]),x17,x9,x8);
  
halfadder HA4(x14,(inp1[3]&inp2[0]),product[3],x12);
fulladder FA8(x13,(inp1[3]&inp2[1]),x12,product[4],x11);
fulladder FA7(x9,(inp1[3]&inp2[2]),x11,product[5],x10);
fulladder FA6(x8,(inp1[3]&inp2[3]),x10,product[6],product[7]);

endmodule 
