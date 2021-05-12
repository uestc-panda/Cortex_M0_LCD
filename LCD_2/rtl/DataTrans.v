module DataTrans(
    input               clk,
    input               rstn,
    input               data_trans_i, //write en
    input               ini_en, 
    input               color_en, 
    input    [31:0]     set_sc,
    input    [31:0]     set_ec,
    input    [31:0]     set_sp,
    input    [31:0]     set_ep,
    output              addr_or_data_o,
    output  reg [15:0]  data_o,
    output              wr_n
);

localparam  ADDR_WIDTH = 17;

wire addr_en;
wire data_stop; 
wire mode;
WriteCtrl WriteCtrl(
     .clk               (clk)
    ,.rstn              (rstn)
    ,.data_trans_i      (data_trans_i)
    ,.data_stop_i       (data_stop)
    ,.ini_en            (ini_en)
    ,.color_en          (color_en)
    ,.addr_en_o         (addr_en)
    ,.wr_n              (wr_n)
    ,.mode              (mode)
);

/*****************************************/
//addr
/*****************************************/
wire Ini_cnt_en;
wire addr_cnt_en;
wire Initial_finish;
wire trans_stop;
wire [ADDR_WIDTH-1 : 0] addr_ini;
wire [ADDR_WIDTH-1 : 0] addr_color;
wire [ADDR_WIDTH-1 : 0] addr;

assign Ini_cnt_en = (mode == 1'b0) ? addr_en :1'b0;
assign addr_cnt_en = (mode == 1'b1) ? addr_en :1'b0;
assign data_stop = (mode == 1'b0) ? Initial_finish : trans_stop;
assign addr = (mode == 1'b0) ? addr_ini : addr_color;

AddrIni # (
     .ADDR_WIDTH  (ADDR_WIDTH)
)     AddrIni (
     .clk             (clk)
    ,.rstn            (rstn)
    ,.cnt_en_i        (Ini_cnt_en)
    ,.Initial_finish  (Initial_finish)
    ,.addr_o          (addr_ini)
);

AddrCounter # (
     .ADDR_WIDTH  (ADDR_WIDTH)
)     AddrCounter (
     .clk           (clk)
    ,.rstn          (rstn)
    ,.cnt_en_i      (addr_cnt_en)
    ,.trans_stop_o  (trans_stop)
    ,.addr_o        (addr_color)
);

/*****************************************/
//BROM
/*****************************************/
wire [15:0] b_data_o;
BlockROM16 # (
     .ADDR_WIDTH  (ADDR_WIDTH) 
    ,.DATA_WIDTH  (16)
)     BlockROM_Data (
     .clk         (clk)
    ,.addr_i      (addr)
    ,.data_o      (b_data_o)
);

always @(*) begin
    case (addr)
        17'd109: data_o = set_sc[31:16];
        17'd110: data_o = set_sc[15:0];
        17'd111: data_o = set_ec[31:16];
        17'd112: data_o = set_ec[15:0];
        17'd114: data_o = set_sp[31:16];
        17'd115: data_o = set_sp[15:0];
        17'd116: data_o = set_ep[31:16];
        17'd117: data_o = set_ep[15:0];
        default: data_o = b_data_o;
    endcase
end

BlockROM1 # (
     .ADDR_WIDTH  (ADDR_WIDTH)
    ,.DATA_WIDTH  (1)
)     BlockROM_Flag (
     .clk         (clk)
    ,.addr_i      (addr)
    ,.data_o      (addr_or_data_o)
);


endmodule