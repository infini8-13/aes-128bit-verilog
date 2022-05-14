`timescale 1ns / 1ps

module rounds(clk,rc,data,keyin,keyout,rndout);
input clk;
input [3:0]rc;
input [127:0]data;
input [127:0]keyin;
output [127:0]keyout;
output [127:0]rndout;

wire [127:0] keyout_0,keyout_1,sb,sr,mcl,xor_op;
reg [127:0] mod_add;
integer i;

//***M-Aes128 round operations***
//subbytes
//xor - key_generation t0
//shiftrow
//modaddition - key_generation t1  
//mixcolumn
//addroundkey-rndout-key_generation t2

Key_Generation t0(rc,keyin,keyout_0);
Key_Generation t1(rc,keyout_0,keyout_1);
Key_Generation t2(rc,keyout_1,keyout);

subbytes t3(data,sb);
assign xor_op = sb^keyout_0;
shiftrow t4(xor_op,sr);
always @(posedge clk) begin
    for(i=0; i<4; i=i+1) begin
      mod_add[32*i+:32] = (keyout_1[32*i+:32] + sr[32*i+:32])% 32;
    end
end
//assign mod_add[127:96] = (keyout_1[127:96] + sr[127:96])% 256;
mixcolumn t5(mod_add,mcl);
assign rndout= keyout^mcl;

endmodule

