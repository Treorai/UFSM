# Trabalho Final

> Identificar os principais “microsserviços” ou componentes da aplicação (ex: “Serviço de
Autenticação”, “Serviço de Catálogo”, “Serviço de Carrinho”).

> Para cada componente, escolher a tecnologia de banco de dados (SQL, Redis, MongoDB,
Neo4J, Firebase) que melhor se adequa à necessidade.

> Justificar por que essa tecnologia foi escolhida, e por que as outras foram descartadas
para aquele componente específico. (espera-se uma discussão aprofunda).

> Apresentar um modelo de dados simplificado para, no mínimo, três componentes-chave
(ex: o Diagrama ER para o SQL, um exemplo de documento JSON para o MongoDB, e a
estrutura de nós/arestas para o Neo4J).

## Grupo 3: Gabriel T, Eduardo S, João R, Wagner C.

## Tema 6: "AcademiaOnline" (Plataforma de E-Learning)

### Funcionalidades:

- Gerenciamento de alunos e instrutores
- Catálogo de cursos (com módulos, vídeos e artigos)
- Aompanhamento de progresso do aluno (quais aulas concluiu)
- Fórum de discussão (perguntas e respostas aninhadas por tópico).

### PARTE: Gerenciamento de alunos e instrutores

---

## Tecnologia de Banco de dados:

$$**~ SQL ~**$$

### Discussão

#### 1. Natureza dos dados

O gerenciamento de usuários (alunos e instrutores) envolve informações altamente estruturadas:

* dados pessoais (nome, e-mail, CPF, matrícula, etc.);
* vínculos formais entre entidades (um instrutor pode ministrar vários cursos; um aluno pode se matricular em vários cursos);
* regras de integridade (unicidade de e-mail, integridade referencial, chaves estrangeiras);
* necessidade de transações (cadastro, atualização, remoção).

Esse tipo de estrutura é naturalmente relacional e demanda consistência forte.
Por isso, **SQL** é a escolha mais adequada.

---

### **2. Motivos específicos para escolher SQL**

#### **a) Consistência forte é obrigatória**

Cadastros de alunos/instrutores não podem apresentar inconsistências ou duplicações. Bancos relacionais garantem ACID e integridade referencial automática.

#### **b) Estrutura fixa e bem definida**

Os tipos de dados e relações entre tabelas são estáveis ao longo do tempo.
SQL lida melhor com esquemas rígidos, facilitando auditoria e validação.

#### **c) Necessidade de JOINs frequentes**

Consultas como:

* “listar alunos de um instrutor”
* “ver todos os cursos associados a um instrutor”
* “checar matrículas do aluno”
  são operações nativas do modelo relacional.

#### **d) Regras de negócio complexas**

Constraints, triggers, unique indexes e foreign keys são essenciais no gerenciamento de usuários.

---

### **3. Por que NÃO escolher as outras tecnologias**

#### **MongoDB (Documentos)**

* É útil para dados flexíveis e sem esquema rígido.
* O cadastro de pessoas é altamente estruturado.
* Relacionamentos N:N (alunos ↔ cursos; instrutores ↔ cursos) ficam mais difíceis e menos eficientes.

#### **Redis (Chave–Valor, memória RAM)**

* Excelente para cache ou sessões.
* Ruim para dados persistentes complexos.
* Não oferece integridade referencial nem transações robustas.

#### **Neo4J (Grafo)**

* Poderia armazenar relacionamentos como grafo, mas isso traria complexidade desnecessária.
* O gerenciamento de usuários não demanda exploração profunda de grafos (como recomendação ou redes sociais).

#### **Firebase (Realtime DB / Firestore)**

* Voltado para apps móveis e dados sem esquema rígido.
* Não é ideal para cadastros relacionais fortes.
* A falta de JOINs pode criar duplicação de dados e inconsistências.

---

## **Modelo de Dados – SQL**

Usuario (**IdUsuário**, login, senha, email, tipoUsuario, nome, cpf, dataNascimento, genero, telefone, endereco, dataCadastro, dataAtualizado)

Aluno (**IdAluno**, objetivo, dataMatricula)
    IdAluno referencia Usuario

Instrutor (**IdInstrutor**, registroProfissional, especialidade)
    IdInstrutor referencia Usuário

Endereço (**IdEndereco**, IdUsuario, cep, logradouro, numero, complemento, bairro, cidade, estado)
    IdUsuario referencia Usuario

Plano (**IdPlano**, tituloPlano, precoMensal, descricao)

Assinatura (**IdAssinatura**, IdAluno, IdPlano, ativo, dataInicio, dataFim)
    IdAluno referencia Aluno
    IdPlano referencia Plano

## Diagrama de relações

### Tabela Usuario

| Campo          | Tipo                              | Restrições       |
| -------------- | --------------------------------- | ---------------- |
| IdUsuario      | SERIAL                            | PK               |
| login          | VARCHAR(60)                       | NOT NULL, UNIQUE |
| senha          | VARCHAR(255)                      | NOT NULL         |
| email          | VARCHAR(120)                      | NOT NULL, UNIQUE |
| tipoUsuario    | ENUM('aluno','instrutor','admin') | NOT NULL         |
| nome           | VARCHAR(120)                      | NOT NULL         |
| cpf            | VARCHAR(14)                       | UNIQUE           |
| dataNascimento | DATE                              | NULL             |
| genero         | ENUM('M','F','O','N')             | NULL             |
| telefone       | VARCHAR(20)                       | NULL             |
| endereco       | VARCHAR(255)                      | NULL             |
| dataCadastro   | TIMESTAMP                         | DEFAULT now()    |
| dataAtualizado | TIMESTAMP                         | DEFAULT now()    |

---

### Tabela Aluno

| Campo         | Tipo         | Restrições                 |
| ------------- | ------------ | -------------------------- |
| IdAluno       | INT          | PK, FK → Usuario.IdUsuario |
| objetivo      | VARCHAR(255) | NULL                       |
| dataMatricula | DATE         | NOT NULL                   |

### Tabela Instrutor

| Campo                | Tipo         | Restrições                 |
| -------------------- | ------------ | -------------------------- |
| IdInstrutor          | INT          | PK, FK → Usuario.IdUsuario |
| registroProfissional | VARCHAR(60)  | UNIQUE, NULL               |
| especialidade        | VARCHAR(120) | NOT NULL                   |


### Tabela Endereço

| Campo       | Tipo         | Restrições             |
| ----------- | ------------ | ---------------------- |
| IdEndereco  | SERIAL       | PK                     |
| IdUsuario   | INT          | FK → Usuario.IdUsuario |
| cep         | VARCHAR(10)  | NULL                   |
| logradouro  | VARCHAR(150) | NULL                   |
| numero      | VARCHAR(20)  | NULL                   |
| complemento | VARCHAR(80)  | NULL                   |
| bairro      | VARCHAR(120) | NULL                   |
| cidade      | VARCHAR(120) | NULL                   |
| estado      | VARCHAR(60)  | NULL                   |

### Tabela Plano

| Campo       | Tipo          | Restrições |
| ----------- | ------------- | ---------- |
| IdPlano     | SERIAL        | PK         |
| tituloPlano | VARCHAR(100)  | NOT NULL   |
| precoMensal | NUMERIC(10,2) | NOT NULL   |
| descricao   | TEXT          | NULL       |

### Tabela Assinatura

| Campo        | Tipo    | Restrições         |
| ------------ | ------- | ------------------ |
| IdAssinatura | SERIAL  | PK                 |
| IdAluno      | INT     | FK → Aluno.IdAluno |
| IdPlano      | INT     | FK → Plano.IdPlano |
| ativo        | BOOLEAN | DEFAULT TRUE       |
| dataInicio   | DATE    | NOT NULL           |
| dataFim      | DATE    | NULL               |


<!-- 
A seguir um modelo simplificado adequado ao domínio:

```
                  +----------------------+
                  |      USERS           |
                  +----------------------+
                  | id (PK)              |
                  | name                 |
                  | email (UNIQUE)       |
                  | password_hash        |
                  | type (ENUM: student, |
                  |        instructor)   |
                  | created_at           |
                  +----------------------+
                              |
          +----------------------------------------+
          |                                        |
   (Somente quando type = student)         (Somente quando type = instructor)
          |                                        |
+-----------------------+                 +---------------------------+
|      STUDENTS         |                 |       INSTRUCTORS        |
+-----------------------+                 +---------------------------+
| user_id (PK, FK->USERS.id) |            | user_id (PK, FK->USERS.id) |
| birth_date                |             | expertise_area             |
| registration_number       |             | rating (float)             |
+---------------------------+             +----------------------------+

```

### Observações:

* A tabela **USERS** centraliza credenciais e informações básicas.
* A especialização é feita via **tabelas STUDENTS e INSTRUCTORS**, ligadas por FK ao usuário.
* O campo **type** permite distinguir o papel principal, mas detalhes específicos ficam nas tabelas especializadas.

---

### **Representação SQL resumida**

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    type VARCHAR(20) CHECK (type IN ('student', 'instructor')),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE students (
    user_id INT PRIMARY KEY REFERENCES users(id),
    birth_date DATE,
    registration_number VARCHAR(20) UNIQUE
);

CREATE TABLE instructors (
    user_id INT PRIMARY KEY REFERENCES users(id),
    expertise_area VARCHAR(120),
    rating NUMERIC(3,2)
);
```

 -->