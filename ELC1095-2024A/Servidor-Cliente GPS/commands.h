#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <signal.h>
#include <unistd.h>
#include <math.h>

#include "GPS.h"
long id_cliente;
//Estrutura utilizada para armazenar informações relacionadas a um socket de servidor.
struct nodo{
    int server_socket;
};

// socket do servidor

struct nodo nodo[1]; // List<struct nodo> size 1,
pthread_mutex_t globalMutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t condVar = PTHREAD_COND_INITIALIZER;


pthread_mutex_t respostaMutex = PTHREAD_MUTEX_INITIALIZER; // Mutex para proteger o acesso à mensagem de resposta


void horas(){
    pthread_mutex_lock(&globalMutex);

    if (gpsHoras != 0 && gpsMins != 0  && gpsSegs != 0) {
        snprintf(mensagemResposta, sizeof(mensagemResposta)-2, "\nA hora atual é %02d:%02d:%02d\n\n", gpsHoras,gpsMins,gpsSegs);
    } else {
        writer = -1;
        snprintf(mensagemResposta, sizeof(mensagemResposta), "\nErro ao retornar resposta solicitada. Digite outro comando! \n");
    }

    pthread_mutex_unlock(&globalMutex);
    pthread_cond_signal(&condVar);


}

void data(){
    pthread_mutex_lock(&globalMutex);

    if(gpsDia !=0 && gpsMes !=0 && gpsAno !=0 ) {
        snprintf(mensagemResposta, sizeof(mensagemResposta), "\nO dia de hoje é %02d/%02d/%02d\n\n", gpsDia,gpsMes,gpsAno);
    } else {
        writer =-1;
        snprintf(mensagemResposta, sizeof(mensagemResposta), "\nErro ao retornar resposta solicitada. Digite outro comando!\n ");
printf("%s", mensagemResposta);
printf( "\nO dia de hoje é %02d/%02d/%02d\n", gpsDia,gpsMes,gpsAno);
    }

    pthread_mutex_unlock(&globalMutex);
    pthread_cond_signal(&condVar);
}


void coordenadasGPS(){
    pthread_mutex_lock(&globalMutex);

    if(t_lat!=0.0 && t_long !=0.0) {
        snprintf(mensagemResposta,sizeof(mensagemResposta) - 1, "\nAs coordenadas sao: %.6f de latitude e %.6f de longitude\n", t_lat,t_long);
    } else {
        writer =-1;
        snprintf(mensagemResposta, sizeof(mensagemResposta), "\nErro ao retornar resposta solicitada. Digite outro comando!\n ");
    }

    pthread_mutex_unlock(&globalMutex);
    pthread_cond_signal(&condVar);

}


