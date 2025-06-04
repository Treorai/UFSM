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
