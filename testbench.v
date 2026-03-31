//testbench for sequel 101
module testbench;
//tb signals
	reg			in;
	reg			rst_n;
	reg			clk;
	wire			out;
	wire	[1:0] state;


	//instantiate seq_101
	seq_101 dut(
	.out(out),
	.state(state),
	.clk(clk), 
	.rst_n(rst_n), 
	.in(in));

	//apply stimuli
	initial clk = 1'b0;

	always #1 clk = ~clk;

	initial begin
		in = 0; rst_n = 0; #4; //starts at S0
		in = 1; rst_n = 1; #2; //transistions to S1
		in = 1; rst_n = 1; #2; //stays at S1
		in = 0; rst_n = 1; #2; //transistions to S2
		in = 1; rst_n = 1; #2; //transistions to S3
		in = 1; rst_n = 1; #2; //transistions to S1
		in = 0; rst_n = 1; #2; //transistions to S2
		in = 0; rst_n = 1; #2; //transistions to S0
	end //end of initial

endmodule