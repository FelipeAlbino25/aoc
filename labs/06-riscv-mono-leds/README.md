# Testando seu RISC-V monociclo na placa

O objetivo desta prática é testar diretamente no kit de FPGA [o processador que você desenvolveu na simulação](../../sim/05-riscv-mono/) desta semana.

Para isso, foi implementado um esquema de E/S mapeados em memória a seguir:

```verilog
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
    if (memwrite & isIO) begin // I/O write 
      if (addr[IO_LEDS_bit])
        LEDR <= writedata;
      if (addr[IO_HEX_bit])
        hex_digits <= writedata;
  end
``` 