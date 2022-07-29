module SUB_BYTES(
    input clk,
    input [127:0] IN_DATA,
    output [127:0] SB_DATA
);

reg [127:0] SB_DATA;
wire [127:0] SB_DATA_W;

    FORWARD_SUBSTITUTION_BOX INST0(.clk(clk), .A(IN_DATA[127:120]), .C(SB_DATA_W[127:120]));
    FORWARD_SUBSTITUTION_BOX INST1(.clk(clk), .A(IN_DATA[119:112]), .C(SB_DATA_W[119:112]));
    FORWARD_SUBSTITUTION_BOX INST2(.clk(clk), .A(IN_DATA[111:104]), .C(SB_DATA_W[111:104]));
    FORWARD_SUBSTITUTION_BOX INST3(.clk(clk), .A(IN_DATA[103:96]), .C(SB_DATA_W[103:96]));
    
    FORWARD_SUBSTITUTION_BOX INST4(.clk(clk), .A(IN_DATA[95:88]), .C(SB_DATA_W[95:88]));
    FORWARD_SUBSTITUTION_BOX INST5(.clk(clk), .A(IN_DATA[87:80]), .C(SB_DATA_W[87:80]));
    FORWARD_SUBSTITUTION_BOX INST6(.clk(clk), .A(IN_DATA[79:72]), .C(SB_DATA_W[79:72]));
    FORWARD_SUBSTITUTION_BOX INST7(.clk(clk), .A(IN_DATA[71:64]), .C(SB_DATA_W[71:64]));

    FORWARD_SUBSTITUTION_BOX INST8(.clk(clk), .A(IN_DATA[63:56]), .C(SB_DATA_W[63:56]));
    FORWARD_SUBSTITUTION_BOX INST9(.clk(clk), .A(IN_DATA[55:48]), .C(SB_DATA_W[55:48]));
    FORWARD_SUBSTITUTION_BOX INST10(.clk(clk), .A(IN_DATA[47:40]), .C(SB_DATA_W[47:40]));
    FORWARD_SUBSTITUTION_BOX INST11(.clk(clk), .A(IN_DATA[39:32]), .C(SB_DATA_W[39:32]));
    
    FORWARD_SUBSTITUTION_BOX INST12(.clk(clk), .A(IN_DATA[31:24]), .C(SB_DATA_W[31:24]));
    FORWARD_SUBSTITUTION_BOX INST13(.clk(clk), .A(IN_DATA[23:16]), .C(SB_DATA_W[23:16]));
    FORWARD_SUBSTITUTION_BOX INST14(.clk(clk), .A(IN_DATA[15:8]), .C(SB_DATA_W[15:8]));
    FORWARD_SUBSTITUTION_BOX INST15(.clk(clk), .A(IN_DATA[7:0]), .C(SB_DATA_W[7:0]));
  
  always @(*) begin
        SB_DATA <= SB_DATA_W;
    end

endmodule