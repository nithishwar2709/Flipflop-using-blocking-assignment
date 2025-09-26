module jkff_block(clk,rst,J,K,Q);
    input clk,rst,J,K;
    output reg Q;
    always@(posedge clk)
      begin
        case({J,K})
            2'b00 : Q = Q;
            2'b01 : Q = 0;
            2'b10 : Q = 1;
            2'b11 : Q = ~Q;
            default : Q = Q;
         endcase
     end
endmodule
