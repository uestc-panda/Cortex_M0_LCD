module LCDCtrl(
    input           clk,
    input           rstn,
    input           en_i,
    input           addr_or_data_i,
    input           wr_n,
    output  reg     data_trans_o,
    output  reg     lcd_cs,
    output  reg     lcd_wr,
    output          lcd_rs
);

assign lcd_rs = addr_or_data_i; // rs = 0 -> Command Addr

localparam NULL    = 2'b01;
localparam VALID   = 2'b10;

reg [2:0] state, nxt_state;

always @ (*) begin
    if (state[0]) 
        nxt_state = en_i ? VALID : NULL;
    else
        nxt_state = (~en_i) ? NULL : VALID;
end

always @ (posedge clk or negedge rstn) begin
    if (~rstn) state <= NULL;
    else state <= nxt_state;
end

always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
        lcd_wr <= 1'b1;
        lcd_cs <= 1'b1;
        data_trans_o <= 1'b0;
    end
    else begin
        if (state[0]) begin
            lcd_wr <= 1'b1;
            lcd_cs <= 1'b1;
            data_trans_o <= 1'b0;
        end
        else begin
            lcd_wr <= wr_n;
            lcd_cs <= 1'b0;
            data_trans_o <= 1'b1;
        end
    end
end

endmodule