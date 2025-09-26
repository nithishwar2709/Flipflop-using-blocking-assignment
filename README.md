# EXPERIMENT 3A: Simulation of All Flip-Flops using Blocking Statement

## AIM
To design and simulate basic flip-flops (SR, D, JK, and T) using **blocking statements** in Verilog HDL, and verify their functionality through simulation in Vivado 2023.1.

## APPARATUS REQUIRED
- Vivado 2023.1
- Computer with HDL Simulator

## DESCRIPTION
Flip-flops are the basic memory elements in sequential circuits.  
In this experiment, different types of flip-flops (SR, D, JK, T) are modeled using **behavioral modeling** with **blocking assignment (`=`)** inside the `always` block.  
Blocking assignments execute sequentially in the given order, which makes it easier to describe simple synchronous circuits.

## PROCEDURE
1. Open **Vivado 2023.1**.  
2. Create a **New RTL Project** (e.g., `FlipFlop_Simulation`).  
3. Add Verilog source files for each flip-flop (SR, D, JK, T).  
4. Add a testbench file to verify all flip-flops.  
5. Run **Behavioral Simulation**.  
6. Observe waveforms of inputs and outputs for each flip-flop.  
7. Verify that outputs match the truth table.  
8. Save results and capture simulation screenshots.

---

## VERILOG CODE

### SR Flip-Flop (Blocking)
```verilog
module srff_block(clk,S,R,Q);
    input clk,S,R;
    output reg Q;
    
    always @(posedge clk) 
        begin
            case ({S,R})
                2'b00: Q = Q;      
                2'b01: Q = 0;      
                2'b10: Q = 1;      
                2'b11: Q = 1'bx;   
                default: Q = Q;
            endcase
        end
endmodule

```
### SR Flip-Flop Test bench 
```verilog
module srff_block_tb;
  reg clk, S, R;
  wire Q;
  srff_block dut(.clk(clk),.S(S),.R(R),.Q(Q));
  initial begin
   clk = 0;
  forever #10 clk = ~clk; 
  end
  initial begin
    S = 0; R = 0;
    #100 S = 1; R = 0;   
    #100 S = 0; R = 0;   
    #100 S = 0; R = 1;   
    #100 S = 1; R = 1;  
    #100 S = 0; R = 0;
 end
endmodule
```
#### SIMULATION OUTPUT

<img width="1917" height="1199" alt="Screenshot 2025-09-16 220615" src="https://github.com/user-attachments/assets/699c9700-2bbf-41cb-9826-0ac3471a85d2" />


### JK Flip-Flop (Blocking)
```verilog
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
```
### JK Flip-Flop Test bench 
```verilog
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
```
#### SIMULATION OUTPUT

<img width="1917" height="1199" alt="Screenshot 2025-09-16 163127" src="https://github.com/user-attachments/assets/bcff7b01-4609-4564-88ab-ce69ff023b94" />

### D Flip-Flop (Blocking)
```verilog
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
```
### D Flip-Flop Test bench 
```verilog
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
```

#### SIMULATION OUTPUT
<img width="1919" height="1199" alt="Screenshot 2025-09-16 153446" src="https://github.com/user-attachments/assets/54123961-6b7b-40aa-aeb6-2e7dcd3d6cf4" />

### T Flip-Flop (Blocking)
```verilog
module tff_block(clk,rst,Tout,T);
    input clk,rst,T;
    output reg Tout;
    always@ (posedge clk)
     begin
     if(rst)
        Tout = 1'b0;
     else if(T)
        Tout = ~Tout;
     else
        Tout = Tout;
     end
endmodule
```
### T Flip-Flop Test bench 
```verilog
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
```

#### SIMULATION OUTPUT
<img width="1919" height="1199" alt="Screenshot 2025-09-16 213315" src="https://github.com/user-attachments/assets/c34f794a-e6c6-40c7-9bce-f66683df1dcd" />


### RESULT

All flip-flops (SR, D, JK, T) were successfully simulated using blocking statements in Verilog HDL.
The outputs matched the expected truth table values, demonstrating correct sequential behavior.
