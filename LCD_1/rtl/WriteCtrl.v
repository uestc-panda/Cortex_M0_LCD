module WriteCtrl(
    input               clk,
    input               rstn,
    input               data_trans_i,
    input               data_stop_i,
    input               ini_en,
    input               color_en,
    output     reg      addr_en_o,
    output     reg      wr_n,
    output     reg      mode //0->ini 1->color
);

localparam  IDLE  = 8'b00000001;
localparam  INI   = 8'b00000010;
localparam  COLOR = 8'b00000100;
localparam  WAIT  = 8'b00001000;
localparam  WR_L  = 8'b00010000;
localparam  WR_H  = 8'b00100000;
localparam  ADDR  = 8'b01000000;

reg [10:0] cur_state, nxt_state;

always @ (*) begin
    if (cur_state[0])
        nxt_state = data_trans_i ? ( ini_en ? INI : (color_en ? COLOR : IDLE)) : IDLE;
    else if (cur_state[1]) 
        nxt_state = data_trans_i ? WAIT : IDLE;
    else if (cur_state[2]) 
        nxt_state = data_trans_i ? WAIT : IDLE;
    else if (cur_state[3]) 
        nxt_state = data_trans_i ? WR_L : IDLE;
    else if (cur_state[4])
        nxt_state = data_trans_i ? WR_H : IDLE;
    else if (cur_state[5])
        nxt_state = data_trans_i ? ADDR : IDLE;
    else if (cur_state[6])
        nxt_state = data_trans_i ? ( data_stop_i ? IDLE : WAIT )  : IDLE;   
    else nxt_state = IDLE;
end

always @ (posedge clk or negedge rstn) begin
    if (~rstn) cur_state <= IDLE;
    else cur_state <= nxt_state;
end

always @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        wr_n <= 1'b1;
        addr_en_o <= 1'b0;
        mode <= 1'b0;
    end else begin
        case (nxt_state)
            IDLE: begin 
                wr_n <= 1'b1;
                addr_en_o <= 1'b0;
            end
            INI : mode <= 1'b0;
            COLOR: mode <= 1'b1;
            WAIT: begin 
                wr_n <= 1'b1;
                addr_en_o <= 1'b0;
            end
            WR_L: begin 
                wr_n <= 1'b0;
                addr_en_o <= 1'b0;
            end
            WR_H: begin 
                wr_n <= 1'b1;
                addr_en_o <= 1'b0;
            end
            ADDR: begin 
                wr_n <= 1'b1;
                addr_en_o <= 1'b1; 
            end
            default: begin 
                wr_n <= 1'b1;
                addr_en_o <= 1'b0;
            end
        endcase
    end
end

endmodule 