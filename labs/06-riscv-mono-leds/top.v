module top(
  input CLOCK_50, // 50 MHz clock
  input [3:0] KEY, // KEY[0] is reset
  output [9:0] LEDR,
  output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  
  logic memwrite;
  logic [31:0] pc, instr;
  logic [31:0] writedata, addr, readdata;
  integer counter;  
  always @(posedge CLOCK_50) 
      counter <= counter + 1;
  logic clk = counter[21]; // 50MHz / 2^22 = 11.9 Hz
  logic reset = ~KEY[0]; // active low
    
  // microprocessor
  riscvmono cpu(clk, reset, pc, instr, addr, writedata, memwrite, readdata);

  // instructions memory 
  mem #("fibo_code.hex") instr_mem(.clk(clk), .a(pc), .rd(instr));

  // data memory 
  mem #("fibo_data.hex") data_mem(clk, memwrite, addr, writedata, readdata);
endmodule