# 📦 Desafio de Modelagem de Banco de Dados para E-Commerce

## 📌 Descrição do Projeto
Este repositório contém o esquema conceitual de um banco de dados para um sistema de e-commerce. O modelo foi desenvolvido para atender aos principais requisitos de um marketplace, incluindo gestão de clientes, pedidos, produtos, fornecedores e pagamentos.

O modelo refinado incorpora as seguintes melhorias:
- **Cliente PJ e PF**: Um cliente pode ser Pessoa Física (PF) ou Pessoa Jurídica (PJ), mas não ambos.
- **Pagamento**: Cada cliente pode ter mais de uma forma de pagamento cadastrada.
- **Entrega**: O pedido inclui informações sobre status e código de rastreio para acompanhamento da entrega.

## 🏗️ Modelo Entidade-Relacionamento (ER)

O diagrama ER detalha as principais entidades do sistema e seus relacionamentos:
- **Cliente** (PF ou PJ)
- **Pedido** (associado a um cliente e contendo múltiplos produtos)
- **Pagamento** (várias formas de pagamento por cliente)
- **Entrega** (status e código de rastreio)
- **Produto** (associado a fornecedores e estoques)
- **Fornecedor** (fornece produtos ao marketplace)
- **Estoque** (controle de disponibilidade dos produtos)
- **Marketplace** (vendas de terceiros)

![Diagrama ER](./diagrama_er.png)

## 🔹 Modelo EER (Enhanced Entity-Relationship)

O diagrama EER reflete a especialização de clientes e outros aprimoramentos no modelo de dados:

![Diagrama EER](./diagrama_eer.png)

## 🚀 Como Usar
1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/nome-do-repositorio.git
   ```
2. Navegue até o diretório do projeto:
   ```bash
   cd nome-do-repositorio
   ```
3. Abra os arquivos do diagrama para análise e refinamento.

## 📌 Contribuição
Sinta-se à vontade para contribuir com melhorias no modelo, seja refinando o esquema ou sugerindo novos recursos.

## 📝 Licença
Este projeto está sob a licença MIT. Sinta-se livre para usá-lo e modificá-lo conforme necessário.


