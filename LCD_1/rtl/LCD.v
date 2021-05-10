module LCD(
    input              clk,
    input              rstn,
    input              lcd_rstn,
    input              en,
    input              ini_en,
    input              color_en,
    input     [31:0]   set_sc,
    input     [31:0]   set_ec,
    input     [31:0]   set_sp,
    input     [31:0]   set_ep,
    output             LCD_CS,
    output             LCD_RST,
    output             LCD_RS,
    output             LCD_WR,
    output             LCD_RD,
    output    [15:0]   LCD_DATA,
    output             LCD_BLK
);

assign LCD_RST = lcd_rstn;
assign LCD_RD = 1'b1;
assign LCD_BLK = 1'b1;

wire data_start;
wire addr_or_data;
wire wr_n;

LCDCtrl     LCDCtrl(
     .clk                      (clk)
    ,.rstn                     (rstn)
    ,.en_i                     (en)
    ,.addr_or_data_i           (addr_or_data)
    ,.wr_n                     (wr_n)
    ,.data_trans_o             (data_trans)
    ,.lcd_cs                   (LCD_CS)
    ,.lcd_wr                   (LCD_WR)
    ,.lcd_rs                   (LCD_RS)
);

DataTrans     DataTrans(
     .clk                      (clk)
    ,.rstn                     (rstn)
    ,.data_trans_i             (data_trans)
    ,.ini_en                   (ini_en)
    ,.color_en                 (color_en)
    ,.set_sc                   (set_sc)
    ,.set_ec                   (set_ec)
    ,.set_sp                   (set_sp)
    ,.set_ep                   (set_ep)
    ,.addr_or_data_o           (addr_or_data)
    ,.data_o                   (LCD_DATA)
    ,.wr_n                     (wr_n)
);

endmodule
