# Exercícios

## Aula 8 - Slide 56

Conferência(<ins>Código</ins>, Nome)  
Anais(<ins>CodConf</ins>, ISSN)  
Comissão(<ins>CodConf</ins>, Endereço)  
**Organização(<ins>CodConf</ins>, DataInstalacao)**  
 _CodConf referencia Conferencia  
**Publicação(<ins>CodConf</ins>, DataPublicacao)**  
 _CodConf referencia Conferencia

❌

> Usar fusão de tabelas. 1 tabela com todos atributos por causa dos relacionamentos 1-1

## Aula 9 - Slide 37

Funcionário(<ins>Cod</ins>, Nome, Endereço, Salario, Data-adm, AG_cidade, AG_numero)  
Cliente(Nome, cpf, rg, cidade-res, AG_cidade, AG_numero)  
Conta(Tipo, Numero, Saldo, Aniversario, Limite)  
Transacao(<ins>Cod</ins>, Data, Valor)  



## Aula 10 - Slide 38

Cliente(<ins>ClienteID</ins>, Nome)  
Telefone(<ins>CodT</ins>, <ins>ClientID</ins>, Numero)  
Compras(<ins>CodC</ins>, <ins>ClientID</ins>, Item, Preço)  














