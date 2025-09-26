module jkff_block_tb;
    reg clk_t,rst_t,J_t,K_t;
    wire Q_t;
    
    jkff_block dut(.clk(clk_t),.rst(rst_t),.J(J_t),.K(K_t),.Q(Q_t));
    
    initial
      begin
        clk_t = 1'b0;
        rst_t = 1'b1;
      #20
        rst_t = 1'b0;
        J_t = 1'b0;
        K_t = 1'b0;
      #20
        J_t = 1'b0;
        K_t = 1'b1;
      #20
        J_t = 1'b1;
        K_t = 1'b0;
      #20
        J_t = 1'b1;
        K_t = 1'b1;
     end
     
     always 
        #10 clk_t = ~clk_t;  
endmodule
