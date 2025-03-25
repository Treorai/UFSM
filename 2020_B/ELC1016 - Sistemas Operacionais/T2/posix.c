#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <string.h>

float* lista = NULL; //array lista
int lista_size = 0;  //tamanho da lista
float media, min, max;

void* getMedia(void *arg){
	float sum = 0;

	for(int i=0; i<lista_size; i++){
		sum += lista[i];
	}

	media = sum/(float)lista_size; //media assign
	pthread_exit(0); //return
}

void* getMax(void *arg){
	max = lista[0];

	for(int i=1; i<lista_size; i++){
		if(max<lista[i]) max = lista[i];
	}
	pthread_exit(0); //return
}

void* getMin(void *arg){
	min = lista[0];

	for(int i=1; i<lista_size; i++){
		if(min>lista[i]) min = lista[i];
	}
	pthread_exit(0); //return
}

//alocador da lista
void alocador(float size){
	if(!lista){
		lista = malloc(size);
	}
}

int main(int argc, char **argv){
	float lista_cell;
	printf("Entre com o tamanho desejado para a lista (1 a 100): ");
	scanf("%d", &lista_size); //inteiro apenas
	if(lista_size>100 || lista_size<=0) return printf("Entre com um numero inteiro positivo entre 1 e 100!\n"); //max 100 inputs
	
	alocador(sizeof(float)*lista_size);
	
	for(int i=0; i<lista_size; i++){
		printf("Digite o valor da posição '%d' da lista: ", i);
		scanf("%f", &lista_cell); //floats
		*(lista+i) = lista_cell; //build lista
	}

	//thread media
	pthread_t t0id;
	pthread_create(&t0id, NULL, getMedia, NULL);

	//thread min
	pthread_t t1id;
	pthread_create(&t1id, NULL, getMin, NULL);

	//thread max
	pthread_t t2id;
	pthread_create(&t2id, NULL, getMax, NULL);

	//wait threads
	pthread_join(t0id, NULL);
	pthread_join(t1id, NULL);
	pthread_join(t2id, NULL);

	//output
	printf("\n**SAIDAS**\nA media eh : %.2f\nO minimo eh : %.2f\nO maximo eh : %.2f\n", media, min, max);
	
	free(lista); //free memory
	return 0;
}
