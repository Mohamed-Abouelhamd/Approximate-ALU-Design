module rca_n
  #(parameter n=16)
  ( input [n-1:0] x,y,
   input c_in,
   output c_out,
   output [n-1:0] s
  );
  wire [n:0] c;
  assign c[0]=c_in;
  assign c_out=c[n];
  generate 
    genvar k;
    for (k=0;k<n;k=k+1)
      begin: block
fulladder FA(
          .a(x[k]),
          .b(y[k]),
          .c_in(c[k]),
          .s(s[k]),
          .c_out(c[k+1])
        );
      end
  endgenerate 
endmodule
