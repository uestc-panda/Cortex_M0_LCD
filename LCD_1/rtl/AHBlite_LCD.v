module AHBlite_LCD(
    input  wire           HCLK,
    input  wire           HRESETn,
    input  wire           HSEL,
    input  wire   [31:0]  HADDR,
    input  wire    [1:0]  HTRANS,
    input  wire    [2:0]  HSIZE,
    input  wire    [3:0]  HPROT,
    input  wire           HWRITE,
    input  wire   [31:0]  HWDATA,
    input  wire           HREADY,
    output wire           HREADYOUT,
    output wire   [31:0]  HRDATA,
    output wire           HRESP,

    output reg            LCD_rstn,
    output reg            LCD_en,
    output wire           ini_en,
    output wire           color_en,
    output reg    [31:0]  set_sc,
    output reg    [31:0]  set_ec,
    output reg    [31:0]  set_sp,
    output reg    [31:0]  set_ep
);

assign HRESP = 1'b0;
assign HREADYOUT = 1'b1;

wire write_en;
assign write_en = HSEL & HTRANS[1] & HWRITE & HREADY;

reg wr_en_reg;
reg [7:0] addr_reg;
always@(posedge HCLK or negedge HRESETn) begin
    if(~HRESETn) begin 
        wr_en_reg <= 1'b0;
        addr_reg <= 8'h0;
    end
    else if(write_en) begin
        wr_en_reg <= 1'b1;
        addr_reg <= HADDR[7:0];
    end
    else begin
        wr_en_reg <= 1'b0;
        addr_reg <= addr_reg;
    end
end

assign ini_en = (wr_en_reg == 1'b1 & addr_reg == 8'h18) ? HWDATA[0] : 1'b0;
assign color_en = (wr_en_reg == 1'b1 & addr_reg == 8'h1c) ? HWDATA[0] : 1'b0;

always @(posedge clk or negedge HRESETn) begin
    if(~HRESETn) LCD_rstn <= 0;
    else if(write_en_reg ) begin
        if(addr_reg[4])begin
            case (addr_reg[3:0])
                4'h0: LCD_rstn <= HWDATA[0];
                4'h4: LCD_en <= HWDATA[0]; 
                default:begin
                    LCD_rstn <= 1'b1;
                    LCD_en <= 1'b0;
                end 
            endcase
        end
        else if (addr_reg[5]) begin
            case (addr_reg[3:0])
                4'h0: set_sc <= HWDATA; 
                4'h4: set_ec <= HWDATA; 
                4'h8: set_sp <= HWDATA; 
                4'hc: set_ep <= HWDATA;  
                default: begin
                    set_sc <= 32'h0;
                    set_ec <= 32'h0;
                    set_sp <= 32'h0;
                    set_ep <= 32'h0;
                end
            endcase
        end
    end
end

endmodule