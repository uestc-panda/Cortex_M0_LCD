module CounterKeyboard(
    input           clk,
    input           rstn,
    input           key_pluse_i,
    output   [3:0]  cnt_keyboard_o
);

reg [3:0] cnt_keyboard_reg;
wire [3:0] cnt_keyboard_nxt = cnt_keyboard_reg + 1'b1;

always @ (posedge clk or negedge rstn) begin
    if (~rstn) cnt_keyboard_reg <= 4'b0;
    else if (key_pluse_i) cnt_keyboard_reg <= cnt_keyboard_nxt;
end

assign cnt_keyboard_o = cnt_keyboard_reg;

endmodule