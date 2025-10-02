# Testando seu RISC-V monociclo na placa

O objetivo desta prática é testar diretamente no kit de FPGA [o processador que você desenvolveu na simulação](../../sim/05-riscv-mono/) desta semana.

Para isso, aproveite os arquivos fornecidos lá e implemente um esquema de [entrada/saída mapeada em memória]([mem_rdata](https://github.com/BrunoLevy/learn-fpga/tree/master/FemtoRV/TUTORIALS/FROM_BLINKER_TO_RISCV#step-17-memory-mapped-device---lets-do-much-more-than-a-blinky-)) como este (recomendado) ou conecte diretamente uma parte do processador (e.g. um registrador específico) à saída desejada na placa. 