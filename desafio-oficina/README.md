# Desafio Educacional - Construção de Esquema Conceitual para Banco de Dados

## Descrição do Desafio

O objetivo deste desafio é construir um esquema conceitual para um sistema de controle e gerenciamento de ordens de serviço em uma oficina mecânica. A partir de uma narrativa fornecida, o desafio consiste em identificar as entidades, relacionamentos e atributos que compõem o modelo do banco de dados, utilizando a compreensão do contexto e possíveis inferências.

Esse desafio faz parte do Bootcamp de Análise de Dados com Power BI da Suzano, na plataforma Digital Innovation One (DIO), e visa aprimorar as habilidades em modelagem de dados, fundamentais para a criação de um banco de dados eficiente e eficaz.

## Contexto da Oficina Mecânica

Na narrativa fornecida, a oficina mecânica realiza os seguintes processos:

- **Clientes** levam veículos para reparos ou revisões periódicas.
- Cada **veículo** é designado a uma **equipe de mecânicos** que irá diagnosticar e executar os serviços necessários.
- **Ordens de Serviço (OS)** são criadas com informações como data de emissão, valor total, status e a data de conclusão dos trabalhos.
- Os serviços a serem executados são definidos pela equipe de mecânicos, que utiliza uma tabela de referência de **mão de obra** para calcular o valor de cada serviço.
- O **cliente** deve autorizar a execução dos serviços e a substituição de peças.
- A equipe de mecânicos avalia e executa os serviços de forma individual ou em conjunto, dependendo da especialidade de cada mecânico.

## Entidades Identificadas

1. **Cliente**  
   - Atributos: Código, Nome, Endereço.
   
2. **Veículo**  
   - Atributos: Código, Modelo, Placa, Ano de Fabricação.
   
3. **Ordem de Serviço (OS)**  
   - Atributos: Número, Data de Emissão, Valor Total, Status, Data de Conclusão.
   - Relacionamentos:
     - Relacionado a um **Cliente**.
     - Relacionado a um **Veículo**.
     - Relacionado a uma **Equipe de Mecânicos**.

4. **Mecânico**  
   - Atributos: Código, Nome, Endereço, Especialidade.
   
5. **Equipe de Mecânicos**  
   - Atributos: Nome da Equipe, Código da Equipe.
   - Relacionamentos:
     - Composta por um ou mais **Mecânicos**.
   
6. **Serviço**  
   - Atributos: Descrição, Custo de Mão de Obra.
   - Relacionamentos:
     - Relacionado a uma **OS**.
     - Relacionado a uma **Tabela de Preços** (para custo de serviços e peças).
   
7. **Peça**  
   - Atributos: Código, Nome, Custo.
   - Relacionamentos:
     - Relacionado a uma **OS**.

8. **Tabela de Preços**  
   - Atributos: Descrição, Custo de Mão de Obra, Custo de Peças.

## Relacionamentos Entre Entidades

- **Cliente - Ordem de Serviço**: Um cliente pode ter várias ordens de serviço.
- **Veículo - Ordem de Serviço**: Cada veículo tem uma ordem de serviço associada.
- **Ordem de Serviço - Mecânico/Equipe de Mecânicos**: A ordem de serviço é designada a uma equipe de mecânicos, que executa os serviços.
- **Serviço - Ordem de Serviço**: A ordem de serviço é composta por múltiplos serviços, cada um com um valor específico.
- **Peça - Ordem de Serviço**: A OS pode conter várias peças, cada uma com um valor.
- **Mecânico - Ordem de Serviço**: Cada mecânico pode realizar serviços dentro de uma OS, dependendo de sua especialidade.

## Instruções para Execução

Este esquema conceitual foi modelado considerando as especificações fornecidas na narrativa. Para que este projeto se torne uma implementação em um banco de dados real, recomenda-se seguir as melhores práticas de modelagem de dados, realizando as seguintes etapas:

1. **Definição de Entidades e Atributos**: A primeira fase foi a identificação das principais entidades e seus atributos.
2. **Identificação de Relacionamentos**: A seguir, foram definidos os relacionamentos entre as entidades.
3. **Construção de Diagrama ER**: O próximo passo seria a construção de um diagrama entidade-relacionamento (ER), que facilita a visualização do modelo conceitual.
4. **Verificação e Ajustes**: Qualquer incoerência ou falta de informações deve ser ajustada conforme o desenvolvimento do projeto.

## Conclusão

Este modelo conceitual foi desenvolvido com base nas informações fornecidas na narrativa do desafio. Algumas inferências foram feitas para preencher lacunas de informações e oferecer um modelo completo para o sistema de gerenciamento de ordens de serviço da oficina mecânica.

Para verificação, caso haja necessidade de ajustes ou correções, consulte o README e revise os detalhes das entidades e relacionamentos modelados.



