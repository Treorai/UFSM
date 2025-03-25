# Micro-Shell

Realização do Trabalho 1 da diciplina de Sistemas Operacionais.
UFSM 2020B REDE

## Proposta do Trabalho

O objetivo deste trabalho é implementar um micro shell para sistemas Linux chamado `msh`. O shell deve pedir comandos do usuário com o caracter:

```shell
msh>
```

O Micro Shell deve suportar apenas comandos. Os comandos a ser desenvolvimentos:

- **dir**: chama o comando listar (`/bin/ls`).
- **pausa**: tem como argumento um número que é o tempo segundos que deve esperar antes de continuar. Deve-se utilizar a função `sleep()`.
- **executa**: recebe como argumento o caminho *completo* do programa a ser executado. Os comandos serão simples, ou seja, eles não tem argumentos adicionais.
- **sair**: termina o programa com a função `exit()`.

## Saídas Esperadas

Veja abaixo alguns exemplos de comandos do Micro Shell e resultados esperados:

```shell
msh> dir
a.txt b.txt msh msh.c

msh> pausa 2
dormindo 2 segundos ...

msh> executa /usr/bin/date
qua jan  6 09:41:41 -03 2021

msh> executa /usr/bin/pwd
/home/watto/docs

msh> sair
```
