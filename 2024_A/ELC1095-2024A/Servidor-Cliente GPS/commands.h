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
int tempDesligar=0, desligado=0, tempFlag =0;

pthread_mutex_t respostaMutex = PTHREAD_MUTEX_INITIALIZER; // Mutex para proteger o acesso à mensagem de resposta

void estadoAquecedor()
{
    if(writer!=-1)
    {
        pthread_mutex_lock(&globalMutex);

        char tempResposta[256]; // Variável temporária para armazenar a mensagem de resposta

        if ((temperatura <= tempDesligar && tempDesligar!=0) || desligado==1 )
        {
            strcpy(tempResposta, "\nEstado aquecedor: desligado!\n");

        }
        else
        {
            strcpy(tempResposta, "\nEstado aquecedor: aberta! \n");

            if (tempDesligar == 0)
            {
                strcat(tempResposta, "\nDeseja determinar uma temperatura para DESLIGAR o aquecedor? Digite -- desligar aquecedor em <temperatura desejada>--\n\n");
            }
        }

        pthread_mutex_lock(&respostaMutex); // Bloqueia o acesso de outras threads à variável mensagemResposta
        if(tempFlag==1 || desligado==1 || desligado==0)
        {
            tempFlag=0;
            strcat(mensagemResposta, tempResposta); // Concatena a mensagem temporária à mensagem de resposta global
        }

        else
        {
            snprintf(mensagemResposta,sizeof(mensagemResposta),"%s",tempResposta);
        }

        pthread_mutex_unlock(&respostaMutex); // Libera o acesso para outras threads

        pthread_mutex_unlock(&globalMutex);
        pthread_cond_signal(&condVar);
    }
}

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

void *temperaturaPeriodica (void *arg){
    struct periodic_info info;
    srand( (unsigned)time(NULL) );

    make_periodic (15000000, &info);
    while (1) {
        temp++;

        temperatura= rand() % 51 - 10;  // Gera um valor aleatório entre 0 e 50, depois subtrai 10
        wait_period (&info);
    }
    return NULL;
}

void temperaturaAtual(){
    srand( (unsigned)time(NULL) );
    tempFlag=1;
    double myDouble = nan("-nan");

    pthread_mutex_lock(&globalMutex);
    if(isnan(temperatura)) {
        writer = -1;
        snprintf(mensagemResposta, sizeof(mensagemResposta), "\nErro ao retornar resposta solicitada. Digite outro comando! \n");
    } else {
        snprintf(mensagemResposta,sizeof(mensagemResposta) - 1,"\nA temperatura atual é: %.2f °C\n", temperatura);
    }
    pthread_mutex_unlock(&globalMutex);
    pthread_cond_signal(&condVar);
}

void *umidadePeriodica(void *arg){
    struct periodic_info info1;
    srand( (unsigned)time(NULL) );

    make_periodic (15000000, &info1);
    while (1) {
        umid++;

        umidade= rand() % 101;
        wait_period (&info1);
    }
    return NULL;
}

void umidadeAtual(){

    pthread_mutex_lock(&globalMutex);
    if (umidade <= 0) {
        writer = -1;
        snprintf(mensagemResposta, sizeof(mensagemResposta), "\nErro ao retornar resposta solicitada. Digite outro comando! \n");

    } else {
        snprintf(mensagemResposta,sizeof(mensagemResposta) - 1,"\nA umidade atual é: %.2f%%\n\n", umidade);
    }
    pthread_mutex_unlock(&globalMutex);
    pthread_cond_signal(&condVar);

}

void desligarAquecedorEm (int temp)
{
    tempDesligar=temp;
    pthread_mutex_lock(&globalMutex);
    if(tempDesligar==0)
    {
        snprintf(mensagemResposta,sizeof(mensagemResposta),"\nTemperatura não definida! Defina usando  -- desligar aquecedor em <temperatura desejada> --\n");
    }
    else
    {
        snprintf(mensagemResposta,sizeof(mensagemResposta),"\nTemperatura definida para desligar aquecedor em: %d °C!\n",tempDesligar);
        desligado=1;
    }
    pthread_mutex_unlock(&globalMutex);
    pthread_cond_signal(&condVar);
}

void desligarAquecedor()
{
    desligado = 1;
    int contador=0;
    pthread_mutex_lock(&globalMutex);

    for(contador=0; contador<=10; contador++)
    {

        snprintf(mensagemResposta,sizeof(mensagemResposta)-1,"Desligando aquecedor...%d\n",contador);
        write(nodo[id_cliente].server_socket, mensagemResposta, MSG_DO_SERVIDOR);
        sleep(1);
    }
    pthread_cond_signal(&condVar);
    pthread_mutex_unlock(&globalMutex);

    estadoAquecedor();
}


void ligarAquecedor()
{
    desligado=0;
    int contador=0;
    pthread_mutex_lock(&globalMutex);
    for(contador=0; contador<=10; contador++)
    {

        snprintf(mensagemResposta,sizeof(mensagemResposta)-1,"Ligando aquecedor...%d\n",contador);
        write(nodo[id_cliente].server_socket, mensagemResposta, MSG_DO_SERVIDOR);
        sleep(1);
    }
    pthread_mutex_unlock(&globalMutex);
    pthread_cond_signal(&condVar);

    estadoAquecedor();
}

void estadoAtualAquecedor()
{
    pthread_mutex_lock(&globalMutex);
    if(desligado==1)
    {
        snprintf(mensagemResposta,sizeof(mensagemResposta),"Aquecedor desligado!\n");
    }
    else if(desligado==0)
    {
        snprintf(mensagemResposta,sizeof(mensagemResposta),"Aquecedor ligado!\n");
    }
    else
    {
        snprintf(mensagemResposta,sizeof(mensagemResposta),"Erro ao retornar mensagem!\n");
    }
    pthread_mutex_unlock(&globalMutex);
    pthread_cond_signal(&condVar);
}