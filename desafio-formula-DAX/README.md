# Desafio de projeto:  Financial Sample (Star Schema)

## 📌 Descrição do Projeto
Este projeto tem como objetivo transformar a tabela única "Financial Sample" em um **modelo dimensional** baseado na **arquitetura estrela (Star Schema)**. Essa estrutura melhora a performance das consultas e facilita análises eficientes no **Power BI**.

## 📊 Processo de Construção do Diagrama
### 1️⃣ **Criação das Tabelas Dimensão**
As tabelas dimensão foram extraídas da tabela original para facilitar a segmentação dos dados:
- **D_Produtos** → Informações gerais dos produtos, como nome e métricas agregadas.
- **D_Produtos_Detalhes** → Inclui detalhes sobre preços, unidades vendidas e faixa de desconto.
- **D_Descontos** → Armazena os descontos aplicados a cada produto.
- **D_Calendário** → Criada via DAX, permitindo análises temporais.

### 2️⃣ **Criação da Tabela Fato**
A tabela **F_Vendas** centraliza as informações principais, armazenando dados como vendas, lucro, descontos e segmentação de mercado. Essa estrutura melhora a eficiência das análises ao conectar-se às tabelas dimensão.

## 🛠️ Funcionalidades Implementadas
- **Segmentação e análise por produto, país, vendedor e desconto**.
- **Cálculo de métricas agregadas** como média de vendas, lucro e unidades vendidas.
- **Criação de um calendário dinâmico** para facilitar comparações temporais.

## 📌 Principais Funções DAX Utilizadas
### **Criação do Calendário Dinâmico**
```DAX
D_Calendário = ADDCOLUMNS(
    CALENDAR(DATE(2020,1,1), DATE(2025,12,31)),
    "Ano", YEAR([Date]),
    "Mês", FORMAT([Date], "MMM"),
    "Trimestre", FORMAT([Date], "Q")
)
```
Essa função gera uma tabela de datas que facilita análises por ano, mês e trimestre.


## 📂 Estrutura do Repositório
- `Financial_Sample.pbix` → Arquivo do Power BI contendo o modelo criado.
- `schema.png` → Imagem do modelo dimensional (Star Schema).


## 🚀 Conclusão
Esse projeto aprimora a eficiência das análises financeiras ao transformar um conjunto de dados plano em um modelo dimensional otimizado. O uso de **DAX** e boas práticas de modelagem melhora a performance e a flexibilidade das consultas no **Power BI**.