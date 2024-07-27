# Posix
Realização do Trabalho 2 da diciplina de Sistemas Operacionais.
UFSM 2020B REDE

## Proposta do Trabalho
O objetivo deste trabalho é implementar um programa multithread que imprime informações estatísticas sobre uma lista de números. O programa deve ler da entrada padrão uma lista de números (máx. 100) e em seguida criar 3 threads concorrentes.

Cada uma das 3 threads tem uma função bem definida, em qualquer ordem:
- Uma thread deve calcular a média dos números
- Uma thread deve encontrar o valor máximo 
- Uma thread deve encontrar o valor mínimo

Por exemplo, digamos que os números de entrada são: `23 13 24 9 91 78`. A saída deve ser:
```
A media e: 39.6
O minimo e: 9
O maximo e: 91
```

Use variáveis globais para guardar a lista de números, e representar os valores de média, mínimo e máximo. Os passos que o programa deve seguir são:
- Antes de criar as threads, o programa deve ler a lista de valores digitados pelo usuário da entrada padrão (`stdin` em C ou `std::cin` em C++).
- Somente após ler os valores as threads podem ser criadas. 
- Quando as threads terminarem de calcular os valores, a thread principal pode imprimir os valores calculados.
