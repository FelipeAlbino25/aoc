module top(
  input CLOCK_50, // 50 MHz clock
  input [3:0] KEY, // KEY[0] is reset
  output reg [9:0] LEDR,
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
  rom instr_mem(.clk(clk), .a(pc), .rd(instr));

  // data memory 
  ram data_mem(clk, memwrite & isRAM, addr, writedata, readdata);

  // memory-mapped i/o
  wire isIO  = addr[8]; // 0x0000_0100
  wire isRAM = !isIO;
  localparam IO_LEDS_bit = 2; // 0x0000_0104
  localparam IO_HEX_bit  = 3; // 0x0000_0108
  reg [23:0] hex_digits; // memory-mapped I/O register for HEX
  dec9segs hex0(hex_digits[ 3: 0], HEX0);
  dec9segs hex1(hex_digits[ 7: 4], HEX1);
  dec9segs hex2(hex_digits[11: 8], HEX2);
  dec9segs hex3(hex_digits[15:12], HEX3);
  dec9segs hex4(hex_digits[19:16], HEX4);
  dec9segs hex5(hex_digits[23:20], HEX5);
  always @(posedge clk)
    if (memwrite & isIO) begin // memory-mapped I/O
      if (addr[IO_LEDS_bit])
        LEDR <= writedata;
      if (addr[IO_HEX_bit])
        hex_digits <= writedata;
  end
endmodule