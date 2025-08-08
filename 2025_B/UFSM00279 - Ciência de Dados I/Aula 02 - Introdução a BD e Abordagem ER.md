# Aula 02 - 08/08/2025

## Links

- [ER Conferences](https://conceptualmodeling.org/ER_Conferences.html)
- [Brazilian Symposium on Databases](https://sbbd.org.br/)
- [Ferramenta de modelagem conceitual (BRModelo)](https://www.sis4.com/)

## Introdução a BD e Abordagem ER

> Aspectos gerais e introdutórios sobre bancos de dados e sistemas gerenciadores de bancos de dados. Além disso, entraremos nos primeiros conceitos da modelagem conceitual de bancos de dados relacionais.

```sql
-- Criar tabela
CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    idade INT,
);

-- Inserir dados
INSERT INTO usuarios (id, nome, idade) VALUES (1, 'João', 30);

-- Consultar dados
SELECT * FROM usuarios WHERE idade > 25;
```
