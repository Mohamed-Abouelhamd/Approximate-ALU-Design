module ALU_correct(
output reg [16:0] y,
input  [15:0] a,b,
input [2:0]sel,
input rst_n,clk
);
wire [16:0]y_int;
reg [16:0]y_buf;
reg [15:0]a_int,b_int;
reg [15:0]a_buf,b_buf;
reg [2:0]sel_int;
reg [2:0] sel_buf;

localparam S0=4'b0000,
			  S1=4'b0001,
			  S2=4'b0010,
			  S3=4'b0011,
			  S4=4'b0100,
			  S5=4'b0101,
			  S6=4'b0110,
			  S7=4'b0111,
			  S8=4'b1000,
			  S9=4'b1001,
			  S10=4'b1010;
reg [3:0] state_next,state_reg;

wire er_al,er_ah,er_bl,er_bh;

assign er_al= a_buf[0] & a_buf[1];
assign er_ah= a_buf[2] & a_buf[3];
assign er_bl= b_buf[0] & b_buf[1];
assign er_bh= b_buf[2] & b_buf[3];
assign er_add0= a_buf[0]&b_buf[0];
assign er_add1= a_buf[1]&b_buf[1];

approximate_ALU alu(
					 .y(y_int),
					 .a(a_int),
					 .b(b_int),
					 .sel(sel_int)
					 );
always@(posedge clk,negedge rst_n)
	begin
		if(~rst_n)begin
			state_reg<=S0;
			a_buf<=0;
			b_buf<=0;
			sel_buf<=0;
			y_buf<=0;
			end
		else begin
			state_reg<=state_next;
			a_buf<=a;
			b_buf<=b;
			y_buf<=y_int;
			sel_buf<=sel;
			end
	end

always@*
	begin
		case(state_reg)
			S0: begin 
					a_int=a_buf;
					b_int=b_buf;
					sel_int=sel_buf;
					y=y_buf;
					if(sel_buf==3'b000)begin
						case({er_add0,er_add1})
							2'b00: state_next=S0;
							2'b01: state_next=S1;
							2'b10: state_next=S2;
							2'b11: state_next=S4;
						endcase 
						end
					else if(sel_buf==3'b001)
						case({er_ah,er_al,er_bh,er_bl})
							4'b0101: state_next=S5;
							4'b0110,4'b1001: state_next=S6;
							4'b0111,4'b1101: state_next=S7;
							4'b1010: state_next=S8;
							4'b1011,4'b1110: state_next=S9;
							4'b1111: state_next=S10;
							default: state_next=S0;
						endcase
					else
					state_next=S0;
			end
			S1: begin 
				a_int=y_buf;
				b_int=16'd2;
				sel_int=3'b100;
				y=0;
				state_next=S0;
			end
			S2: begin 
				a_int=y_buf;
				b_int=16'd2;
				sel_int=3'b000;
				y=0;
				state_next=S3;
			end
			S3: begin 
				a_int=y_buf;
				b_int=16'd3;
				sel_int=3'b100;
				y=0;
				state_next=S0;
			end
			S4: begin 
				a_int=y_buf;
				b_int=16'd1;
				sel_int=3'b100;
				y=0;
				state_next=S0;
			end
			S5: begin 
				a_int=y_buf;
				b_int=16'd2;
				sel_int=3'b000;
				y=0;
				state_next=S0;
			end
			S6: begin 
				a_int=y_buf;
				b_int=16'd8;
				sel_int=3'b000;
				y=0;
				state_next=S0;
			end 
			S7: begin 
				a_int=y_buf;
				b_int=16'd10;
				sel_int=3'b000;
				y=0;
				state_next=S0;
			end 
			S8: begin 
				a_int=y_buf;
				b_int=16'd32;
				sel_int=3'b000;
				y=0;
				state_next=S0;
			end
			S9: begin 
				a_int=y_buf;
				b_int=16'd40;
				sel_int=3'b000;
				y=0;
				state_next=S0;
			end
		   S10: begin 
				a_int=y_buf;
				b_int=16'd50;
				sel_int=3'b000;
				y=0;
				state_next=S0;
			end 	
			default: state_next=3'bxxx;
		endcase
	end
				 
endmodule 