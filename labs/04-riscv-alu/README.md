# Escrevendo a ULA do RISC-V

O objetivo desta prática é escrever uma ULA e seu respectivo *test bench* para o processador RISC-V [baseada neste modelo](alu.v). Utilize o processador de referência e também suas referências como modelo. Insira a função `$monitor` em seus códigos, para obter valores reais de suas entradas/saídas como as seguintes:

```
PC=00000114 instr=fff28293 funct3=000 aluIn1=00000d93 aluIn2=ffffffff aluOut=00000d92
PC=00000114 instr=fe029ee3 funct3=001 aluIn1=00000d93 aluIn2=00000000 aluOut=00000d93
PC=00000114 instr=fe029ee3 funct3=001 aluIn1=00000d92 aluIn2=00000000 aluOut=00000d92
PC=00000110 instr=fe029ee3 funct3=001 aluIn1=00000d92 aluIn2=00000000 aluOut=00000d92
PC=00000110 instr=fff28293 funct3=000 aluIn1=00000d92 aluIn2=ffffffff aluOut=00000d91
PC=00000114 instr=fff28293 funct3=000 aluIn1=00000d92 aluIn2=ffffffff aluOut=00000d91
PC=00000114 instr=fe029ee3 funct3=001 aluIn1=00000d92 aluIn2=00000000 aluOut=00000d92
PC=00000114 instr=fe029ee3 funct3=001 aluIn1=00000d91 aluIn2=00000000 aluOut=00000d91
PC=00000110 instr=fe029ee3 funct3=001 aluIn1=00000d91 aluIn2=00000000 aluOut=00000d91
PC=00000110 instr=fff28293 funct3=000 aluIn1=00000d91 aluIn2=ffffffff aluOut=00000d90
PC=00000114 instr=fff28293 funct3=000 aluIn1=00000d91 aluIn2=ffffffff aluOut=00000d90
PC=00000114 instr=fe029ee3 funct3=001 aluIn1=00000d91 aluIn2=00000000 aluOut=00000d91
```

## Entrega

Faça commit do seu código no repositório do grupo contendo um script `run.sh` na raiz que gere um saída com todas as operações válidas da ULA. Inclua no espaço abaixo a saída gerada e comente os resultados. Como você não tem o processador completo ainda, sugiro usar os dados das simulações de outros processadores para gerar um arquivo de testes (e.g. `values.tv`).











## Referências

- [LigthRISCV ](https://github.com/menotti/lightriscv)