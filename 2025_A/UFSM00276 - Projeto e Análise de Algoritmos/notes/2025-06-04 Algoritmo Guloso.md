# 04/06/2025

## Implementar o Alg. Guloso para os problemas:

### Problema do troco

```c
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char *argv[]) {
  if (argc != 2) {
    printf("Por favor, forneça um valor para o troco.\n");
    return 1;
  }
  
  int troco = atoi(argv[1]); // Converte o argumento para inteiro
  int incremento = 0;
  int m50=0, m25=0, m10=0, m5=0, m1=0;
  
  while(incremento < troco){
    if(troco-incremento >= 50){
      m50 ++;
      incremento += 50;
    } else if(troco-incremento >= 25){
      m25 ++;
      incremento += 25;
    } else if(troco-incremento >= 10){
      m10 ++;
      incremento += 10;
    } else if(troco-incremento >= 5){
      m5 ++;
      incremento += 5;
    } else if(troco-incremento >= 1){
      m1 ++;
      incremento += 1;
    }
  }
  printf("m50 = %i\nm25 = %i\nm10= %i\nm5 = %i\nm1 = %i\n", m50, m25, m10, m5, m1);

	return troco;
}
```

### Problema da mochila fracionária

```c
#include <stdio.h>
#include <stdlib.h>

// Estrutura de item
typedef struct {
    int valor;
    int peso;
    float razao;
} Item;

// Compara a razão valor/peso
int compara(const void *a, const void *b) {
    Item *itemA = (Item *)a;
    Item *itemB = (Item *)b;
    if (itemA->razao < itemB->razao) return 1;
    if (itemA->razao > itemB->razao) return -1;
    return 0;
}

float mochilaFracionaria(Item itens[], int n, int capacidade) {
    // Ordena os itens pela razão valor/peso em ordem decrescente
    for (int i = 0; i < n; i++) {
        itens[i].razao = (float)itens[i].valor / itens[i].peso;
    }
    
    qsort(itens, n, sizeof(Item), compara);

    float valorTotal = 0;
    int pesoAtual = 0;

    // Preenche a mochila
    for (int i = 0; i < n; i++) {
        if (pesoAtual + itens[i].peso <= capacidade) {
            // Coloca o item completo
            valorTotal += itens[i].valor;
            pesoAtual += itens[i].peso;
        } else {
            // Coloca apenas a fração do item que cabe
            int pesoRestante = capacidade - pesoAtual;
            valorTotal += itens[i].valor * ((float)pesoRestante / itens[i].peso);
            break;
        }
    }

    return valorTotal;
}

int main() {
    Item itens[] = {
        {60, 10, 0},
        {100, 20, 0},
        {120, 30, 0}
    };

    int n = sizeof(itens) / sizeof(itens[0]);
    int capacidade = 50;

    float valorMaximo = mochilaFracionaria(itens, n, capacidade);
    printf("Valor máximo na mochila: %.2f\n", valorMaximo);

    return 0;
}
```
