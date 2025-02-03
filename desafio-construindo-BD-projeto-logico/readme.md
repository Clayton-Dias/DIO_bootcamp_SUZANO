
# Projeto: Sistema de Gestão de Vendas e Produtos

## Objetivo

O principal objetivo deste projeto foi criar um sistema de gerenciamento de vendas e produtos, utilizando um banco de dados relacional. O projeto visa simular uma estrutura básica para uma loja, permitindo o controle de clientes, pedidos, produtos, fornecedores, vendedores externos e estoque. Este projeto foi concebido como um exercício prático para demonstrar e aprimorar habilidades em modelagem de dados, criação de bancos de dados, manipulação de dados via SQL e realização de consultas complexas.

## Modelo de Dados

O projeto é baseado em um modelo de dados relacional, representado por um diagrama entidade-relacionamento (DER). As principais entidades e seus atributos são:

*   **Cliente:** `(idCliente, Pnome, InicialDoNomeDoMeio, Sobrenome, CPF, Endereco, DataDeNascimento, Email, Telefone)`
*   **Pedido:** `(idPedido, StatusDoPedido, Descricao, Frete, Cliente_idCliente, Valor)`
*   **Produto:** `(idProduto, Categoria, Descricao, Valor)`
*   **RelacaoProdutoPedido:** `(Pedido_idPedido, Produto_idProduto, Quantidade, Status)`
*   **Fornecedor:** `(idFornecedor, RazaoSocial, CNPJ, Contato, Endereco)`
*   **ProdutoFornecido:** `(Produto_idProduto, Fornecedor_idFornecedor, Quantidade)`
*   **VendedorExterno:** `(idVendedorExterno, Nome, Identificacao, Local, Contato)`
*   **ProdutoVendidoPorTerceiro:** `(Produto_idProduto, VendedorExterno_idVendedorExterno, Quantidade)`
*   **Estoque:** `(idEstoque, Local, Quantidade)`
*   **ProdutoEmEstoque:** `(Produto_idProduto, Estoque_idEstoque)`

Os relacionamentos foram definidos com cardinalidades apropriadas para representar a interação entre as entidades (ex: um cliente pode fazer vários pedidos; um produto pode ter vários fornecedores; etc.).

## Funcionalidades Implementadas

1.  **Criação do Banco de Dados:**
    *   Implementação das tabelas com suas colunas, tipos de dados, chaves primárias e estrangeiras, usando SQL.
2.  **População do Banco de Dados:**
    *   Inserção de dados fictícios em cada tabela para simular um cenário real de vendas.
3.  **Consultas SQL:**
    *   Criação de diversas consultas para extrair e manipular dados, utilizando todas as cláusulas SQL:
        *   `SELECT`: para recuperar dados.
        *   `WHERE`: para filtrar dados.
        *   `GROUP BY`: para agrupar dados e realizar agregações.
        *   `HAVING`: para filtrar grupos.
        *   `ORDER BY`: para ordenar resultados.
        *   `JOIN`: para combinar dados de diferentes tabelas.
        *   Geração de atributos derivados para agregar valor a informações existentes.
4.  **Demonstração de Consultas Complexas:**
    *   Desenvolvimento de queries que combinam todas as cláusulas SQL, demonstrando a capacidade de extrair informações detalhadas e relevantes, como:
        *   Clientes com alto valor médio de compra.
        *   Categorias de produtos mais vendidas.
        *   Fornecedores que mais fornecem produtos.
        *   Vendedores com melhor desempenho.

## O que Foi Aprendido

*   **Modelagem de Dados:** Como traduzir um problema de negócio em um modelo de dados eficiente e adequado.
*   **SQL Completo:** A prática do uso das principais cláusulas SQL (`SELECT`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, `JOIN`), tanto separadamente quanto em conjunto.
*   **Junções de Tabelas:** Como utilizar `JOIN`s para combinar dados de diferentes tabelas para gerar uma visão mais completa do negócio.
*   **Funções de Agregação:** A importância de usar funções de agregação (`AVG`, `COUNT`, `SUM`, `MIN`, `MAX`) para analisar dados e gerar insights.
*   **Filtragem de Dados:** Como utilizar `WHERE` e `HAVING` para filtrar dados em diferentes estágios da consulta.
*   **Manipulação de Dados:** Como usar expressões para gerar atributos derivados, como campos concatenados, cálculos de datas, etc.
*   **Organização:** Organizar dados por ordem alfabética, datas ou qualquer critério definido pelo usuário com `ORDER BY`.
*  **Banco de Dados Relacional:** Como construir e usar um banco de dados relacional para gerenciar e extrair informações valiosas de um sistema de vendas e produtos.

## Conclusão

Este projeto proporcionou uma experiência prática valiosa na criação de um banco de dados relacional e no uso avançado de SQL. Ele abrangeu todo o ciclo de vida do desenvolvimento de um banco de dados, desde a modelagem até a manipulação e extração de dados, através de consultas complexas. Através deste projeto, foi possível consolidar a teoria na prática e obter uma compreensão mais profunda de como o SQL é essencial para trabalhar com dados em sistemas de informação.
