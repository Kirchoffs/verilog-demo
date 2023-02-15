module counter(input reset_n, input clk, output [3:0] cnt, output cout);  
    reg [3:0] cnt_r;
  
    always@(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            cnt_r <= 4'b0000;
        end
        else if (cnt_r == 4'd9) begin
            cnt_r <= 4'b0000;
        end
        else begin                      
            cnt_r <= cnt_r + 1'b1 ;
        end
    end
  
    assign cout = (cnt_r == 4'd9);
    assign cnt  = cnt_r;
endmodule