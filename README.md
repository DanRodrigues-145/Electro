# Projeto SQL – Banco de Dados Electro

## Sobre o Projeto
O projeto Electro consiste na criação de um banco de dados relacional para um sistema de e-commerce.  
Desenvolvido em SQL Server, inclui tabelas, relacionamentos, inserções, consultas, atualizações e exclusões.

## Estrutura do Banco de Dados

### Tabelas Criadas
- Cliente  
- Endereço  
- Produto  
- Pedido  
- ItemPedido  

### Principais Características
- IDs com `IDENTITY` (auto-incremento)
- Relacionamentos 1:N e N:N
- Normalização até a 3FN
- Campos `VARCHAR` para compatibilidade com SQL Server

## Consultas Implementadas
- Listagem de clientes
- Produtos acima de determinado valor
- Pedidos com informações do cliente
- Itens por pedido
- Produtos mais caros

## Operações CRUD
| Operação | Descrição |
|---------|---------|
| **CREATE** | Inserção de clientes, produtos, pedidos, endereços e itens |
| **READ**   | Consultas com filtros, JOINs e ordenações |
| **UPDATE** | Atualização de preços, status de pedidos e dados de clientes |
| **DELETE** | Exclusão de produtos, endereços e itens de pedidos |

## Tecnologias Utilizadas
- SQL Server
- T-SQL
- Git / GitHub

## Como Executar
1. Abra o SQL Server Management Studio
2. Execute o script do arquivo `/database.sql`
3. Verifique as tabelas e dados
4. Teste as consultas
