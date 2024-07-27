#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <string.h>

int main(int argc, char** argv){
    pid_t pid;        // PID
    char *args[2];    // cmd args
    char input[100];  //user input
    char *cmd;        //input trim arg[0]
    char *arg;        //input trim args

    while(1){
        printf("msh> ");
        fgets(input, 100, stdin);
        input[strlen(input)-1] = '\0'; /* trim '\n' */

        if(strlen(input) == 0) continue; //catch empty input
        cmd = strtok(input, " "); //trim arg[0]
        arg = strtok(NULL, " ");  //trim args
        
        if(strncmp(cmd, "dir", 100) == 0){
            pid = fork();
            switch(pid){
                case -1:
                    printf("Erro!\n");
                    exit(EXIT_FAILURE);
                case 0:
                    //filho
                    args[0] = "/usr/bin/ls";
                    args[1] = NULL;
                    execve(args[0], args, NULL);
                    break;
                default:
                    //pai
                    wait(NULL);
                    break;
            }
        } else if(strncmp(cmd, "pausa", 100) == 0){
            if(arg && atoi(arg)){
                sleep( atoi(arg) );
            } else {
                printf("O comando '%s' precisa receber um argumento inteiro.\n", cmd);
            }
        } else if(strncmp(cmd, "executa", 100) == 0){
            
            pid = fork();
            
            switch(pid){
                case -1:
                    printf("Erro!\n");
                    exit(EXIT_FAILURE);
                case 0:
                    //filho
                    args[0] = arg;
                    execve(args[0], args, NULL); //expect " /usr/bin/`file` " format w/o args
                    exit(EXIT_SUCCESS);
                    break;
                default:
                    //pai
                    wait(NULL);
                    break;
            }
        } else if(strncmp(cmd, "sair", 100) == 0){
            break;
        } else {
            //unknown cmd
            printf("'%s' não é um comando reconhecido neste terminal.\n", cmd);
        }
    }
    
    return 0;
}
