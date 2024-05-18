module fulladder(
input a,
input b,
input c_in,
output s,
output c_out
);

wire t, c1, c2;

halfadder ha1(a, b, t, c1);
halfadder ha2(t, c_in, s, c2);

assign c_out = c1 | c2;

endmodule
