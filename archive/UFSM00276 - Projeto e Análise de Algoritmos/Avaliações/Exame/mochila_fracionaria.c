#include <stdio.h>
#include <stdlib.h>

// Estrutura para representar um item com peso e valor
typedef struct {
    int peso;
    int valor;
} Item;

// Função para comparar dois itens com base no valor por unidade de peso (valor/peso)
int comparar(const void* a, const void* b) {
    Item* itemA = (Item*)a;
    Item* itemB = (Item*)b;

    double razaoA = (double)itemA->valor / itemA->peso;
    double razaoB = (double)itemB->valor / itemB->peso;

    // Ordem decrescente
    if (razaoA < razaoB) return 1;
    else if (razaoA > razaoB) return -1;
    else return 0;
}

// Função principal do algoritmo da mochila fracionária
double mochilaFracionaria(Item itens[], int n, int capacidade) {
    // Ordena os itens pela razão valor/peso em ordem decrescente
    qsort(itens, n, sizeof(Item), comparar);

    double valorTotal = 0.0;
    int i;

    for (i = 0; i < n && capacidade > 0; i++) {
        if (itens[i].peso <= capacidade) {
            // Pega o item inteiro
            capacidade -= itens[i].peso;
            valorTotal += itens[i].valor;
        } else {
            // Pega apenas a fração que cabe
            valorTotal += (double)itens[i].valor * capacidade / itens[i].peso;
            capacidade = 0;
        }
    }

    return valorTotal;
}

int main() {
    Item itens[] = {
        {10, 60},
        {20, 100},
        {30, 120}
    };
    int n = sizeof(itens) / sizeof(itens[0]);
    int capacidade = 50;

    double resultado = mochilaFracionaria(itens, n, capacidade);
    printf("Valor máximo que cabe na mochila: %.2f\n", resultado);

    return 0;
}
