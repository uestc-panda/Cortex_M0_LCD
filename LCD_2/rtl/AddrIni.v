module AddrIni # (
    parameter ADDR_WIDTH = 17
)(
    input                       clk,
    input                       rstn,
    input                       cnt_en_i,
    output                      Initial_finish,
    output [ADDR_WIDTH-1 : 0]   addr_o
);

reg [ADDR_WIDTH-1 : 0] cnt;
wire[ADDR_WIDTH-1 : 0] cnt_nxt = cnt + 1'b1;

always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin 
        cnt <= {ADDR_WIDTH{1'b0}};
    end else begin
        if (cnt_en_i)    cnt <= cnt_nxt; 
        else             cnt <= cnt;
    end
end

assign addr_o = ( cnt <= 17'd105 ) ? cnt : (cnt < 17'd76906 ? 17'd106 : cnt - 17'd76800 );

assign Initial_finish = addr_o == 17'd107;

endmodule