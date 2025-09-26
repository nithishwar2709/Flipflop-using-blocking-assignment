module dff_block_tb;
    reg clk_t,rst_t,d_t;
    wire dout_t;
    dff_block dut(.clk(clk_t),.rst(rst_t),.d(d_t),.dout(dout_t));
    initial
      begin
        clk_t = 1'b0;
        rst_t = 1'b1;
     #20
        rst_t = 1'b0;
        d_t   = 1'b0;
     #20
        d_t = 1'b1;
     end
     always 
        #10 clk_t = ~clk_t;
endmodule
