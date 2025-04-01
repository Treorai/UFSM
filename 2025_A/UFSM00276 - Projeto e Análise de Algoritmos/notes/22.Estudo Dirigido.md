# Estudo sobre Invariantes de Laço e Provas de Corretude

## Corretude de algoritmos por invariantes

A estratégia típica para mostrar a corretude de um algoritmo iterativo através de invariantes segue os seguintes passos:
- Mostre que o invariante **vale** no início da *primeira iteração* (trivial, em geral)
- Suponha que o invariante **vale** no início de uma *iteração qualquer*
- Prove que ele **vale** no início da *próxima iteração*
- Conclua que se o algoritmo **pára** e o invariante **vale** no início da *última iteração*, então o algoritmo é **correto**

