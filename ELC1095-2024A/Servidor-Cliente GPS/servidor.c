//servidor

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <pthread.h>
#include <errno.h>

#include "commands.h"

//sincronizar threads no escopo do servidor.c
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

int processandoComando = 0;
char buffer_msg_cliente[MSG_DO_CLIENTE];

void *processarComando(void *arg){
	processandoComando = 1;
	pthread_mutex_lock(&mutex);
        if (strcasecmp(buffer_msg_cliente, "ajuda") == 0) {
            strcpy(mensagemResposta, "\nComandos: horas, data, coordenadas,\n");
            if (write(nodo[id_cliente].server_socket, mensagemResposta, MSG_DO_SERVIDOR) == -1){
                printf("Erro ao retornar mensagem de ajuda\n");
                snprintf(mensagemResposta, sizeof(mensagemResposta) -1, "Erro ao retornar resposta solicitada. Digite outro comando!\n ");
            }
            
        }
        else if (strcasecmp(buffer_msg_cliente, "horas" ) == 0){
            processandoComando=1;
            horas();
            if (write(nodo[id_cliente].server_socket, mensagemResposta, MSG_DO_SERVIDOR) == -1 || writer==-1){
                printf("Erro ao retornar mensagem de horas\n");
                writer =0;
            }
        }
        else if (strcasecmp(buffer_msg_cliente, "data") == 0){
            processandoComando=1;
            data();
            if (write(nodo[id_cliente].server_socket, mensagemResposta, MSG_DO_SERVIDOR) == -1 || writer==-1){
                printf("Erro ao retornar mensagem da data\n");
                writer =0;
            }
        }
        else if (strcasecmp(buffer_msg_cliente, "coordenadas") == 0){
            processandoComando=1;
            coordenadasGPS();
            if (write(nodo[id_cliente].server_socket, mensagemResposta, MSG_DO_SERVIDOR) == -1 || writer==-1){
                printf("Erro ao retornar mensagem de coordenadas\n");
                writer =0;
            }
        }
		
        else
        {
            printf("Erro - comando desconhecido\n");
            snprintf(mensagemResposta, sizeof(mensagemResposta) -1, "O servidor não reconheceu a sua mensagem como um comando,"
                     "digite \"ajuda\" para ver quais comandos são válidos\n");
            if (write(nodo[id_cliente].server_socket, mensagemResposta, MSG_DO_SERVIDOR) == -1 || writer==-1)
            {
                fprintf(stderr, "Erro ao enviar a mensagem de aviso\n");
            }
        }

        processandoComando = 0;
        pthread_cond_signal(&condVar);
        pthread_mutex_unlock(&mutex);
}




void *cliente(void *arg){
	pthread_t processar;
    struct periodic_info information;
    id_cliente= (long)arg;
    int idClientes, codRet,codRet2;
    char buffer[MSG_DO_CLIENTE]; 
	//++msgcliente
//criação do tokenizer que permitira mais de um comando concatenados gerando um unico
    while (1)
    {
        char* token;
        char *saveptr;
        token=NULL;
        bzero(buffer, sizeof(buffer)); // zerar o conteúdo do buffer
        codRet = read(nodo[id_cliente].server_socket, buffer, MSG_DO_CLIENTE);


        if (codRet == -1){
            fprintf(stderr, "Erro lendo mensagem do cliente\n");
            close(nodo[id_cliente].server_socket);
            nodo[id_cliente].server_socket = -1;
            pthread_exit(NULL);
        }
        else if (codRet == 0){
            printf("Cliente %ld desconectou\n",id_cliente);
            close(nodo[id_cliente].server_socket);
            nodo[id_cliente].server_socket= -1;
            pthread_exit(NULL);
        }

        sscanf(buffer, "%[^\n]", buffer_msg_cliente);  // wait command
        printf("Recebeu do cliente: %s - tamanho do buffer: %lu\n \n", buffer_msg_cliente, strlen(buffer_msg_cliente));

        char buffer_copy[MSG_DO_CLIENTE];
        strcpy(buffer_copy, buffer_msg_cliente);

        token = strtok(buffer_copy, " ");

        if(processandoComando==1) {
            // MUTEX LOCK - CONDVAR
            pthread_mutex_lock(&mutex);

            while (processandoComando == 1) {
                snprintf(mensagemResposta, sizeof(mensagemResposta), "Servidor ocupado. Adicionado à lista de espera da variavel de condicao\n");
                pthread_cond_wait(&condVar, &mutex);
                printf("Retomando execução do comando efetuado pelo cliente\n");
            }
            processandoComando=0;
            pthread_mutex_unlock(&mutex);
        }
		codRet2 = pthread_create(&processar, NULL, processarComando,NULL);
		if (codRet2 != 0){
			fprintf(stderr, "Erro ao criar a segunda thread: %d\n", codRet2);
		}
		codRet2 = pthread_join(processar, NULL);
		if (codRet2 != 0){
			fprintf(stderr, "Erro ao aguardar a finalização da segunda thread: %d\n", codRet2);
		}
	}
		
}




int main(int argc, char *argv[])
{
    sigset_t alarm_sig; //variável é usada para armazenar um conjunto de sinais.
    int i;
    sigemptyset (&alarm_sig); //inicializa o conjunto de sinais alarm_sig, removendo todos os sinais do conjunto.
    for (i = SIGRTMIN; i <= SIGRTMAX; i++)
    {
        sigaddset (&alarm_sig, i);//adiciona cada sinal ao conjunto alarm_sig
    }
    sigprocmask (SIG_BLOCK, &alarm_sig, NULL);
    //bloqueia todos os sinais contidos no conjunto alarm_sig.
    //sinais adicionados ao conjunto alarm_sig não serão entregues ao processo enquanto estiverem bloqueados.

    pthread_t t_gps; //thread que coleta info do GPS
    int codRetGps;


    struct sockaddr_in server_addr, client_addr;
    socklen_t cliCompr; //indica o tamanho em bytes da estrutura de endereço do cliente passada como argumento para a função

    int serverSocket, portNum, codRet, flagErroDuranteLockGeral = 0;
    pthread_t thread;
    long idCliente =0;



    if (argc != 2) {
        printf("Erro: Porta não definida. Uso: %%s porta\n");
    } else {
        portNum=atoi(argv[1]); //numero da porta utilizada na comunicação do servidor e cliente
        serverSocket = socket(AF_INET, SOCK_STREAM, 0);
        if (serverSocket == -1) {
            printf("Erro abrindo o socket\n");
            return -1;
        } else {
            bzero((char *) &server_addr, sizeof(server_addr));
            server_addr.sin_family = AF_INET; // Define a família de endereços como IPv4
            server_addr.sin_addr.s_addr = INADDR_ANY; //indica que o servidor aceita conexoes de maquinas com qualquer endereco de ip
            server_addr.sin_port = htons(portNum);  // Define o número da porta como o valor passado na linha de comando

            // verificação para lidar com possíveis erros durante a associação do socket
            if (bind(serverSocket, (struct sockaddr *) &server_addr, sizeof(server_addr)) == -1)  //associar um endereço IP e número de porta a um socket.
            {
                printf("Essa porta esta sendo usada, escolha outra!\n");
                return -1;
            }
            else
            {
                //listen() serve para colocar o socket em um estado de escuta, permitindo que ele aceite conexões de clientes.
                if (listen(serverSocket, TOTAL_CLIENTES) == -1)
                {
                    printf("Erro executando listen\n");
                    return -1;
                }
            }
        }
    }
    codRetGps=pthread_create (&t_gps, NULL,gps, NULL);
    //if return != zero then ocorreu erro
    if (codRetGps){
        fprintf(stderr, "Erro ao criar a thread para o GPS\n");
        pthread_mutex_unlock(&mutex);
        return -1;
    }
    else{
        variavelGPS=1; //ativa o GPS
    }

    printf("Esperando por conexões\n");
    // Inicializa o descritor de socket de cada um dos clientes

    for (idCliente = 0; idCliente < TOTAL_CLIENTES; idCliente++){
        nodo[idCliente].server_socket = -1;
    }
    while (1){
        for (idCliente = 0; idCliente < TOTAL_CLIENTES; idCliente++)
        {
            if (nodo[idCliente].server_socket== -1){
                //elemento disponível pra ser associado a uma nova conexao de cliente.
                break;
            }
        }
        nodo[idCliente].server_socket = accept(serverSocket, (struct sockaddr *) &client_addr, &cliCompr); // para aceitar uma conexão de cliente em um socket de servidor.
        //uma vez que um elemento com server_socket = -1 foi encontrado, ele entra no accept para realizar a conexão com o socket
        //e o mutex é bloqueado pra garantir exclusão mútua durante o acesso compartilhado aos recursos do servidor

        // MUTEX LOCK - GERAL
        pthread_mutex_lock(&mutex);
        if (nodo[idCliente].server_socket == -1)
        {
            fprintf(stderr, "Erro no accept com o cliente\n");
            pthread_mutex_unlock(&mutex);
            return -1;
        }
        else
        {
            printf("Cliente %ld conectado e número de descritor de socket %d\n",id_cliente, nodo[idCliente].server_socket);
        }
        //Se o número de clientes conectados for menor que 1, uma nova thread é criada para lidar com esse cliente. Caso contrário, uma mensagem de conexão recusada é enviada para o cliente e o socket é fechado.
        //ou seja, se idCliente for menor que 1, então significa que há posição disponível para um novo cliente no vetor nodo, que recebe o valor do total de clientes que podem acessar o servidor
        if (idCliente < TOTAL_CLIENTES)
        {
            codRet = pthread_create(&thread, NULL, cliente, (void *)idCliente);

            if (codRet)
            {
                fprintf(stderr, "Erro ao criar a thread: %d\n", codRet);
                return -1;

            }
        }
        else
        {
            printf("Socket %d terá que ser desfeito pois já há o máximo de conexões ativas no momento\n", nodo[idCliente].server_socket);
            pthread_mutex_unlock(&mutex);
            char mensagemConexaoRecusada[MSG_DO_SERVIDOR] = "Conexao recusada, apenas UM cliente por vez!\n";

            if (write(nodo[idCliente].server_socket, mensagemConexaoRecusada, MSG_DO_SERVIDOR) == -1)  //é usada para escrever dados em um descritor de socket
            {
                printf("Erro ao enviar a mensagem de aviso de que a conexão foi recusada\n");
                return -1;
            }
            if (close(nodo[idCliente].server_socket) == -1)  // a conexão com esse cliente é encerrada e o descritor de socket é liberado
            {
                perror("Houve erro ao fechar o socket\n");
                return -1;
            }
            else{
                printf("Socket %d foi desfeito com sucesso\n", nodo[idCliente].server_socket);
                break;
            }
            break;
        }
        // MUTEX UNLOCK - GERAL
        pthread_mutex_unlock(&mutex);
    }



    return 0;
}




