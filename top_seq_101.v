// top level design for sequence 101
module top_seq_101(out,clk_led,state,in,clk_in,rst_n);
 // ports
 input        in;
 input	     clk_in;
 input        rst_n;
 output       out;
 output       clk_led;
 output [1:0] state;
 // nets
 wire clk_w;
 
 // clock divider instance
 clk_div #(.period(3)) clk_div_inst(
 .clk_out  (clk_w),
 .clk_led  (clk_led),
 .clk_in   (clk_in)
 );
 
 // seq_101 instance
 seq_101 seq_101_inst(
 .out      (out),
 .state    (state),
 .in       (in),
 .clk      (clk_w),
 .rst_n    (rst_n)
 );
 
 endmodule 