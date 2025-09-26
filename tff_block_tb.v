module tff_block_tb;
    reg clk_t,rst_t,T_t;
    wire Tout_t;
    
    tff_block dut(.clk(clk_t),.rst(rst_t),.T(T_t),.Tout(Tout_t));
    
    initial
     begin
        clk_t = 1'b0;
        rst_t = 1'b1;
     #20
        rst_t = 1'b0;
        T_t = 1'b0;
     #20
        T_t = 1'b1;
     end
     
     always 
        #10 clk_t = ~clk_t;
endmodule
