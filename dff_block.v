module dff_block(clk,rst,d,dout);
    input clk,rst,d;
    output reg dout;
    always@ (posedge clk)
    begin
        if(rst)
            dout = 1'b0;
        else
            dout = d;
     end
endmodule
