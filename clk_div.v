/*============================================
	         CLOCK DIVIDER
==============================================
Description:
 This module take 50Mhz clock input and divide
 it to produce 1Hz clock output.

Design Engineer:
 

Date:
Feb. 18, 2026
-----------------------------------------------
*/
module  clk_div(clk_out,clk_led,clk_in);
 //ports
 input clk_in;
 output reg clk_out = 1'b0;
 output reg clk_led = 1'b0;
 
 // 1s clock @50MHz
 parameter integer TICKS_500MS = 75_000_000; // no. of ticks per 1.5s
 reg [26:0] tick_cnt = 27'b0; // count 0..24_999_999
 
 always@(posedge clk_in) begin
    if(tick_cnt == TICKS_500MS-1) begin 
       clk_out <= ~clk_out;
       clk_led <= ~clk_led;
       tick_cnt <= 27'b0;
    end
    
    else tick_cnt <= tick_cnt + 27'b1;
 
 end


endmodule