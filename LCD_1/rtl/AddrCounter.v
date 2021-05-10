module AddrCounter # (
    parameter ADDR_WIDTH = 17
)(
    input                       clk,
    input                       rstn,
    input                       cnt_en_i,
    output                      trans_stop_o,
    output [ADDR_WIDTH-1 : 0]   addr_o
);

reg [ADDR_WIDTH-1 : 0] cnt;
wire[ADDR_WIDTH-1 : 0] cnt_nxt = (cnt >= 17'd6518)? 17'd108 : cnt + 1'b1;

always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin 
        cnt <= 17'd108;
    end else begin
        if (cnt_en_i)    cnt <= cnt_nxt; 
        else             cnt <= cnt;
    end
end

assign addr_o = cnt;

assign trans_stop_o = addr_o == 17'd6518;


endmodule