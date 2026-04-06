/*====================================
				SEQUENCE 101
======================================
DESCRIPTION:
	THIS MOORE FSM DETECTS THE
	NON-OVERLAPPING SEQUENCE 1-1,
	ASSUMING THE INPUT STREAM ARRIVES
	LSB-FIRST.
	
DESIGN ENGINEER:
	FELIXANDER B. DOLOSO
	SETH ANDREI V. GEDALANGA

DATE:
	MARCH 31, 2026


------------------------------------*/
module seq_101(out, clk_led, state, clk_150, rst_n, in);
	//ports
	input 				in;
	input 				rst_n;
	input 				clk_150;
	output reg			out;
	output reg	[1:0]	state;
	output 	 			clk_led;
	
	
	//state
	parameter [1:0]S0 = 2'b00;
	parameter [1:0]S1 = 2'b01;
	parameter [1:0]S2 = 2'b10;
	parameter [1:0]S3 = 2'b11;
	reg [1:0]pre; //present state
	reg [1:0]nxt; //next state
	wire clk;
	
	//1Hz Clock
		clk_div #(.TICKS_500MS(75_000_000)) div(
			.clk_out(clk),
			.clk_led(clk_led),
			.clk_in(clk_150)
		); 
	//this convert the 50MHz clock to 1Hz Clock
 

	//input block
	always @(in,pre) begin
		case(pre)
			S0:nxt = in? S1:S0;
			S1:nxt = in? S1:S2;
			S2:nxt = in? S3:S0;
			S3:nxt = in? S1:S0;
			default:nxt = S0;
		endcase //end of case
	end //end of always @(in,pre)
	
	//sequential block
	always @(posedge clk, negedge rst_n) begin
		if(!rst_n) pre = S0;
		else pre = nxt;
	end //end of always@(posedge clk, negedge rst_n)
	//output block
	always@(pre)begin
		case (pre)
			S0:begin	
					out = 0;
					state = S0;
				end //end of S0
			S1:begin	
					out = 0;
					state = S1;
				end //end of S1
			S2:begin	
					out = 0;
					state = S2;
				end //end of S2
			S3:begin	
					out = 1;
					state = S3;
				end //end of S3
			default:begin	
					out = 0;
					state = S0;
				end //end of default
		endcase //end of case
	 end //end of always@(pre)
endmodule