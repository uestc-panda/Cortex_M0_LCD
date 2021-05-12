module LCD(
    input              clk,
    input              rstn,
    input              en,
    output             LCD_CS,
    output             LCD_RST,
    output             LCD_RS,
    output             LCD_WR,
    output             LCD_RD,
    output    [15:0]   LCD_DATA,
    output             LCD_BLK
);

wire addr_or_data_o;

assign LCD_RST = rstn;
assign lcd_RS = addr_or_data_o;// rs = 0 -> Command Addr
assign LCD_RD = 1'b1;
assign LCD_BLK = 1'b1;

localparam  ADDR_WIDTH = 17;

wire addr_en;
wire Initial_finish; 
WriteCtrl WriteCtrl(
     .clk               (clk)
    ,.rstn              (rstn)
    ,.en                (en)
    ,.data_stop         (Initial_finish)
    ,.addr_en           (addr_en)
    ,.LCD_CS            (LCD_CS)
    ,.LCD_WR            (LCD_WR)
);

/*****************************************/
//addr
/*****************************************/
AddrIni # (
     .ADDR_WIDTH  (ADDR_WIDTH)
)     AddrIni (
     .clk             (clk)
    ,.rstn            (rstn)
    ,.cnt_en_i        (addr_en)
    ,.Initial_finish  (Initial_finish)
    ,.addr_o          (addr)
);


/*****************************************/
//BROM
/*****************************************/
BlockROM16 # (
     .ADDR_WIDTH  (ADDR_WIDTH) 
    ,.DATA_WIDTH  (16)
)     BlockROM_Data (
     .clk         (clk)
    ,.addr_i      (addr)
    ,.data_o      (LCD_DATA)
);

BlockROM1 # (
     .ADDR_WIDTH  (ADDR_WIDTH)
    ,.DATA_WIDTH  (1)
)     BlockROM_Flag (
     .clk         (clk)
    ,.addr_i      (addr)
    ,.data_o      (addr_or_data_o)
);

endmodule
