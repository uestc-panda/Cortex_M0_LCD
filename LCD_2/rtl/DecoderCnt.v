// decoder for cnt 
module DecoderCnt(
    input        [3:0]      cnt_i,
    output   reg [63:0]     set_x_o,
    output   reg [63:0]     set_y_o
);


always @ (*) begin
    case (cnt_i)
        4'd0: begin
            set_x_o = 64'h00000000000000EF;
            set_y_o = 64'h000000000001003F;
        end
        4'd1: begin
            set_x_o = 64'h000000000000004F;
            set_y_o = 64'h000000000000004F;
        end   
        4'd2: begin
            set_x_o = 64'h000000500000009F;
            set_y_o = 64'h000000000000004F;
        end
        4'd3: begin
            set_x_o = 64'h000000A0000000EF;
            set_y_o = 64'h000000000000004F;
        end    
        4'd4: begin
            set_x_o = 64'h000000000000004F;
            set_y_o = 64'h000000500000009F;
        end    
        4'd5: begin
            set_x_o = 64'h000000500000009F;
            set_y_o = 64'h000000500000009F;
        end    
        4'd6: begin
            set_x_o = 64'h000000A0000000EF;
            set_y_o = 64'h000000500000009F;
        end    
        4'd7: begin
            set_x_o = 64'h000000000000004F;
            set_y_o = 64'h000000A0000000EF;
        end    
        4'd8: begin
            set_x_o = 64'h000000500000009F;
            set_y_o = 64'h000000A0000000EF;
        end    
        4'd9: begin
            set_x_o = 64'h000000A0000000EF;
            set_y_o = 64'h000000A0000000EF;
        end    
        4'd10: begin
            set_x_o = 64'h000000000000004F;
            set_y_o = 64'h000000F00001003F;
        end   
        4'd11: begin
            set_x_o = 64'h000000500000009F;
            set_y_o = 64'h000000F00001003F;
        end   
        4'd12: begin
            set_x_o = 64'h000000A0000000EF;
            set_y_o = 64'h000000F00001003F;
        end   
        default: begin
            set_x_o = 64'h00000000000000EF;
            set_y_o = 64'h000000000001003F;
        end
    endcase
end

endmodule