`timescale 1ns / 1ps

module rounndlast(clk,rc,rin,keylastin,fout);
input clk;
input [3:0]rc;
input [127:0]rin;
input [127:0]keylastin;
output [127:0]fout;

wire [127:0] sb,sr,keyout,keyout_0;
reg [127:0] mod_add;
integer i;

Key_Generation t0(rc,keylastin,keyout_0);
Key_Generation t1(rc,keyout_0,keyout);

subbytes t2(rin,sb);
always @(posedge clk) begin
    for(i=0; i<4; i=i+1) begin
      mod_add[32*i+:32] = (keyout_0[32*i+:32] + sb[32*i+:32])% 32;
    end
end
  
shiftrow t3(mod_add,sr);
//assign mod_add[127:96] = (keyout_0[127:96] + sb[127:96])% 256;
assign fout= keyout^sr;
  
endmodule

