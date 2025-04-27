# Questões Moodle

## Lista

1. Cite a definição de um Protocolo de Comunicação;
2. Cite 3 responsabilidades da camada de Apresentação;
3. Cite as vantagens e desvantagens de cada uma das topologias físicas vistas em aula.
4. Quais vantagens foram trazidas com a introdução do Endereçamento sem Classes?
5. Qual a máscara da sua rede local na notação CIDR?
6. Por que o NAT não é uma solução bem aceita pelo IETF?
7. Observando as características vistas em aula dos protocolos IPv4 e IPv6, indique qual dos dois sofre um menor atraso ao ser processado pelos dispositivos de rede e justifique sua resposta.
8. Comente a afirmação de que o protocolo IP é do tipo Best Effort e comente por que o ICMP resolve esta "limitação.
9. Considerando que roteamento Vetor Distância ainda apresenta problemas de instabilidade mesmo quando utilizadas as técnicas de "Split Horizon", "Definição de Infinito"e "Poison Reverse", descreva uma possível mudança que poderia ser feita de forma a evitar tal problema.
10. Cite pelo menos 2 problemas ou limitações do roteamento de estado de enlace.
11. Com o comando netstat, liste 5 aplicações e os respectivos números de porta rodando em algum computador que esteja conectado à Internet.
12. Quais campos o protocolo TCP possuem em seu cabeçalho que o UDP não tem?
13. O que é o pseudocabeçalho usado pelos protocolo TCP/UDP para calcular o checksum?
14. Por que o TCP utiliza um número de sequência inicial aleatório? 
15. Qual a principal vantagem do mecanismo Selective Repeat com relação ao Go-Back-N?
16. Qual o conceito de piggybacking?
17. Cite 2 outras implementações do TCP além da Reno e explique suas principais diferenças.

## 8. Comunicação entre Processos

Com o comando netstat, liste 5 aplicações e os respectivos números de porta rodando em algum computador que esteja conectado à Internet:

| | Aplicação | Portas |
|:-|:-|:-|
|1| svchost.exe | 49709 |
|2| chorme.exe | 50467<br>50517<br>50562-50568<br>50570-50572<br>50575 |
|3| Spotify.exe | 50032<br>50043<br>50058<br>50418 |
|4| Discord.exe | 49824 |
|5| RiotClientServices.exe | 49804<br>49807 |

## 9. UDP/TCP

1. Quais campos o protocolo TCP possuem em seu cabeçalho que o UDP não tem?

    > Cabeçalho UDP:
    >
    > - Porta de origem
    > - Porta de destino
    > - Comprimento
    > - Checksum
    >
    > Cabeçalho TCP:
    >
    > - Porta de origem
    > - Porta de destino
    > - Comprimento
    > - Checksum
    > - **Número de sequência**
    > - **Número de confirmação**
    > - **Flags de controle**
    > - **Tamanho da janela**
    > - **Urgente**
    > - **Opções**
    > - **(6 bits reservados)**

2. O que é o pseudocabeçalho usado pelos protocolo TCP/UDP para calcular o checksum?

    > É uma estrutura hipotética (não é transmitida na rede) usada para calcular o checksum, de modo a evitar que pacotes sejam entregues ao protocolo errado. Possui campos de origem, destino, protocolo e comprimento.

3. Por que o TCP utiliza um número de sequência inicial aleatório?

    > Por segurança, para evitar que um atacante possa descobrir o número de sequência inicial de um cliente e usar isso para "sequestrar" a conexão; e para evitar conflitos com conexções antigas.
