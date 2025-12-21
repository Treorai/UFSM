# Anotações e resumos

## **1 — A evolução da informação nas organizações**

### **1.1 Informatização gradual**

Organizações raramente informatizam todos os processos de uma vez. Cada setor adota sistemas isolados que atendem às suas próprias necessidades, como vendas, estoque, financeiro ou RH. Isso causa heterogeneidade tecnológica e duplicação de lógica entre sistemas.

### **1.2 Sistemas isolados e seus problemas**

Quando cada área cria sistemas independentes, as informações são armazenadas separadamente. Como consequência:

- O mesmo dado é cadastrado em vários sistemas.
- Os valores divergentes geram inconsistência.
- A operação depende de conciliar dados manualmente.
  Esse cenário inviabiliza análises integradas e dificulta o crescimento da organização.

### **1.3 Redundância de dados**

Redundância ocorre quando a mesma informação é armazenada mais de uma vez.
Existem dois tipos:

#### **Redundância não controlada**

Cada sistema salva uma cópia própria do dado. É comum quando sistemas não conversam entre si. Isso gera:

- inconsistências entre cópias;
- retrabalho;
- dificuldades na auditoria.

#### **Redundância controlada**

Usada com propósito, por exemplo em replicações de desempenho, indexação ou cópias para auditoria. Mantém controle da origem e sincronização.

### **1.4 Solução estrutural: Banco de Dados**

Em vez de sistemas isolados, passa-se a usar um **repositório central*- onde os dados são armazenados uma única vez e compartilhados. Isso garante integridade, evita inconsistências e facilita consulta e análise.

---

## **2 — SGBD**

### **2.1 O que é um SGBD**

Um Sistema Gerenciador de Banco de Dados é o software responsável por:

- armazenar dados;
- controlar acesso;
- garantir integridade;
- fornecer linguagem de consulta;
- assegurar concorrência e recuperação.

Ele funciona como intermediário entre sistemas e o armazenamento físico.

### **2.2 Benefícios essenciais**

1. **Independência dos dados**: mudanças no armazenamento físico não afetam sistemas.
2. **Acesso eficiente**: otimizações internas (índices, buffer, plano de execução).
3. **Segurança**: controle de usuários, permissões e auditoria.
4. **Integridade**: regras declarativas, chaves, restrições.
5. **Concorrência**: múltiplos usuários acessando sem corromper dados.
6. **Recuperação**: logs e mecanismos de rollback.

Sem um SGBD, cada aplicação precisaria reinventar essas capacidades, elevando custo e risco.

---

## **3 — Modelos de Dados: Conceitual, Lógico e Físico**

### **3.1 Modelo Conceitual**

Representa a **visão lógica e de negócio*- do domínio. Não depende de tecnologia.
Usa notações como **MER (Modelo Entidade-Relacionamento)**.
Serve para analisar requisitos e estruturar entidades e relacionamentos corretamente.

### **3.2 Modelo Lógico**

Tradução do modelo conceitual para uma forma compreensível por SGBDs.
No modelo relacional:

- entidades viram tabelas;
- atributos viram colunas;
- relacionamentos viram chaves estrangeiras ou tabelas associativas.

### **3.3 Modelo Físico**

Define como os dados serão armazenados internamente:

- Tipo de arquivo e páginas;
- Índices;
- Tipo de dado físico;
- Layout de memória.
  Impacta diretamente desempenho e escalabilidade.

### **3.4 Esquema**

É a representação formal de um modelo. Pode ser documento, diagrama ou código SQL.

---

## **4 — Entidade-Relacionamento: Fundamentos**

### **4.1 Entidades**

São objetos do mundo real sobre os quais se deseja guardar informações.
Exemplos: Cliente, Produto, Funcionário.
Cada entidade representa uma categoria; cada item real é uma ocorrência.

### **4.2 Atributos**

São propriedades das entidades.
Exemplo: Cliente possui nome, CPF, endereço.
Atributos podem ser:

- Simples (CPF)
- Compostos (endereço → rua, nº, cidade)
- Multivalorados (telefones)
- Derivados (idade, derivada de data nascimento)

### **4.3 Relacionamentos**

Representam associações: Cliente realiza Venda.
Possuem cardinalidade, direção, opcionalidade e, às vezes, atributos próprios (como preço na relação Produto–Venda).

### **4.4 Instâncias (ocorrências)**

Cada linha real armazenada representa uma instância.
Exemplo: uma venda feita em 10/01/2025 é uma ocorrência do relacionamento Venda.

---

## **5 — Cardinalidades**

### **5.1 Cardinalidade Máxima**

Define quantas ocorrências de uma entidade podem se associar à outra:

- **1:1*- — uma para uma
- **1:N*- — uma entidade se liga a várias da outra
- **N:N*- — várias se relacionam com várias

A cardinalidade máxima orienta transformação para tabelas.

### **5.2 Cardinalidade Mínima**

Define obrigatoriedade da participação:

- **0*- → participação opcional
- **1*- → participação obrigatória

Esse conceito evita erros como permitir que uma venda exista sem cliente, quando isso é proibido no domínio.

---

## **6 — Identificadores e Entidades Fracas**

### **6.1 Atributo Identificador**

É a chave que distingue cada ocorrência.
Exemplo: CPF identifica o Cliente.
Usado para garantir unicidade durante inserção e consulta.

### **6.2 Entidade Fraca**

Entidades que não possuem identificador próprio, dependendo de outra entidade para existir (Ex.: ItemVenda depende de Venda).
Possui relacionamento identificador, representado com linha grossa.
Esse conceito permite modelar composições do mundo real.

---

## **7 — Especialização e Generalização**

### **7.1 Definição**

Representa subclasses derivadas de uma entidade geral.
Exemplo: Funcionário especializa-se em Engenheiro, Secretário, Gerente.
Permite organizar diferenças sem repetir atributos comuns.

### **7.2 Tipos de especialização**

- **Total**: toda ocorrência pertence a uma subclasse.
- **Parcial**: apenas algumas pertencem.
- **Exclusiva**: pertence a uma e somente uma subclasse.
- **Compartilhada**: pode pertencer a mais de uma subclasse simultaneamente.

### **7.3 Herança**

A subclasse herda todos os atributos e relacionamentos da entidade-mãe.
Esse mecanismo reduz redundância na modelagem e facilita evolução.

---

## **8 — Entidade Associativa e Relacionamentos N:N**

### **8.1 Quando surge**

Usada quando um relacionamento N:N precisa:

- armazenar atributos próprios (ex.: quantidade de produto na venda), ou
- manter histórico ou múltiplas ocorrências.

### **8.2 Transformação**

Um relacionamento N:N deve sempre ser convertido em entidade associativa no modelo lógico.
Exemplo:
Produto ← N:N → Venda
transforma-se em
Produto — ItemVenda — Venda

---

## **9 — Qualidade do Modelo ER**

### **9.1 Modelo Correto**

Não viola semântica nem sintaxe do MER:

- Não ligar atributo a atributo.
- Não criar relacionamento entre relacionamentos.
- Não duplicar entidades com nomes distintos.

### **9.2 Modelo Completo**

Abrange todos os requisitos coletados.
Nenhuma regra do negócio pode ficar sem representação.

### **9.3 Modelo Sem Redundância**

Evita:

- atributos duplicados;
- relacionamentos redundantes;
- dados deriváveis.
  Reduz chance de inconsistência e melhora clareza.

---

## **10 — Temporalidade em Modelos de Dados**

### **10.1 Necessidade**

Sistemas que guardam histórico (salário, endereço, avaliações) precisam considerar tempo.
Um mesmo atributo pode ter valores distintos ao longo do tempo.

### **10.2 Atributos temporais**

Em vez de sobrescrever valor antigo, cria-se entidade temporal:
Exemplo: SalarioHistorico, com campos data_início e data_fim.

### **10.3 Efeito sobre cardinalidades**

Quando se adiciona temporalidade:

- 1:1 vira N:N
- 1:N vira N:N
  Isso ocorre porque ao longo do tempo podem existir várias ocorrências válidas.

---

## **11 — Decisões de Modelagem**

### **11.1 Atributo vs Entidade**

Usar atributo quando:

- o valor é simples e não tem existência independente.

Usar entidade quando:

- o valor tem relacionamentos próprios (ex.: cargo tem salário e carga horária).

### **11.2 Atributo ou Especialização**

Preferir especialização quando:

- subconjuntos têm comportamentos, atributos ou regras diferentes;
- subgrupos operam diferentemente no negócio.

### **11.3 Entidade ou Especialização**

Use entidade separada quando uma mesma entidade pode se relacionar com outra mais de uma vez.
Use especialização quando cada instância é única e fixa em sua subclasse.

---

## **12 — Notações ER**

### **12.1 Peter Chen**

Notação original do MER.
Relacionamentos são losangos, entidades retângulos.
Fácil para entender semântica, porém menos usada em ferramentas industriais.

### **12.2 Engenharia da Informação (“pé de galinha”)**

Usa linhas com símbolos (pé de galinha para N, traços para 1).
Mais compacta e adotada em ferramentas CASE e diagramas corporativos.

### **12.3 UML – Classes**

Utiliza conceitos orientados a objetos.
Classes correspondem a entidades, associações a relacionamentos e multiplicidade corresponde a cardinalidade.

---

## **13 — Processo de Modelagem Passo a Passo**

1. Coleta de requisitos com usuários.
2. Identificação de entidades relevantes.
3. Definição dos relacionamentos e cardinalidades.
4. Escolha dos atributos e identificadores.
5. Análise para identificar especializações.
6. Definição de entidades associativas.
7. Avaliação de temporalidade.
8. Ajustes para remover redundância.
9. Tradução para modelo relacional.
10. Criação do modelo físico com otimizações.
