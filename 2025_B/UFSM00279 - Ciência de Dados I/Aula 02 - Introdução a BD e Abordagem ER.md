# Aula 02 - 08/08/2025

## Introdução a BD e Abordagem ER

> Aspectos gerais e introdutórios sobre bancos de dados e sistemas gerenciadores de bancos de dados. Além disso, entraremos nos primeiros conceitos da modelagem conceitual de bancos de dados relacionais.

```sql
-- Criar tabela
CREATE TABLE TipoDeProduto (
    CodTipoProd INT PRIMARY KEY,
    CodTipoProd VARCHAR(255),
);

-- Inserir dados
INSERT INTO usuarios (id, nome, idade) VALUES (1, 'João', 30);

-- Consultar dados
SELECT * FROM usuarios WHERE idade > 25;
```
