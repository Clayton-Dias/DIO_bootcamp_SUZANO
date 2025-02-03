# Sistema de Gerenciamento de Oficina Mecânica

Este repositório contém o script SQL para a criação de um banco de dados para gerenciamento de uma oficina mecânica. O banco de dados permite o controle de clientes, veículos, serviços, ordens de serviço, mecânicos e peças utilizadas nos reparos.

## Diagrama Entidade-Relacionamento (DER)

O DER do banco de dados é representado pelas seguintes tabelas e seus relacionamentos:

- **Cliente:**
  - `idCliente` (INT, PRIMARY KEY, AUTO_INCREMENT)
  - `nome` (VARCHAR(45))
  - `contato` (VARCHAR(45))
  - `Identificacao` (VARCHAR(45))

- **Veiculo:**
  - `idVeiculo` (INT, PRIMARY KEY, AUTO_INCREMENT)
  - `marca` (VARCHAR(45))
  - `cor` (VARCHAR(45))
  - `ano` (VARCHAR(45))
  - `modelo` (VARCHAR(45))
  - `Cliente_idCliente` (INT, FOREIGN KEY referencing Cliente)

- **Servico:**
  - `idServico` (INT, PRIMARY KEY, AUTO_INCREMENT)
  - `Nome` (VARCHAR(45))
  - `Descricao` (VARCHAR(45))

- **OrdemDeServico:**
  - `idOrdemDeServico` (INT, PRIMARY KEY, AUTO_INCREMENT)
  - `dataDeEmissao` (DATE)
  - `valor` (FLOAT)
  - `status` (VARCHAR(45))
  - `dataDeConclusao` (DATE)
  - `Veiculo_idVeiculo` (INT, FOREIGN KEY referencing Veiculo)

- **TabelaDeServico:**
  - `OrdemDeServico_idOrdemDeServico` (INT, FOREIGN KEY referencing OrdemDeServico)
  - `Servico_idServico` (INT, FOREIGN KEY referencing Servico)
  - `Valor` (FLOAT)
  - **PRIMARY KEY** (OrdemDeServico_idOrdemDeServico, Servico_idServico)

- **Mecanico:**
  - `idMecanico` (INT, PRIMARY KEY, AUTO_INCREMENT)
  - `Nome` (VARCHAR(45))
  - `Endereco` (VARCHAR(45))
  - `Especialidade` (VARCHAR(45))

- **MecanicoDesignado:**
  - `Mecanico_idMecanico` (INT, FOREIGN KEY referencing Mecanico)
  - `OrdemDeServico_idOrdemDeServico` (INT, FOREIGN KEY referencing OrdemDeServico)
  - **PRIMARY KEY** (Mecanico_idMecanico, OrdemDeServico_idOrdemDeServico)

- **Peca:**
  - `idPeça` (INT, PRIMARY KEY, AUTO_INCREMENT)
  - `Nome` (VARCHAR(45))
  - `valor` (FLOAT)
  - `Descricao` (VARCHAR(45))

- **PecaPorOrdemDeServico:**
  - `OrdemDeServico_idOrdemDeServico` (INT, FOREIGN KEY referencing OrdemDeServico)
  - `Peca_idPeça` (INT, FOREIGN KEY referencing Peca)
  - `Quantidade` (INT)
  - **PRIMARY KEY** (OrdemDeServico_idOrdemDeServico, Peca_idPeça)

## Como usar

1.  **Crie o banco de dados:** Utilize um cliente MySQL (como MySQL Workbench, DBeaver ou linha de comando `mysql`) para criar um novo banco de dados.

2.  **Execute o script SQL:** Utilize o arquivo `script_criacao_tabelas.sql` para criar as tabelas e relacionamentos no banco de dados.

3.  **Execute os inserts:** Utilize o arquivo `inserts_dados_iniciais.sql` para popular o banco com dados de exemplos

## Scripts SQL

O repositório contém os seguintes arquivos SQL:

-   `script_criacao_tabelas.sql`: Este arquivo contém os comandos `CREATE TABLE` para criar todas as tabelas do banco de dados.
-   `inserts_dados_iniciais.sql`: Este arquivo contém os comandos `INSERT` para popular o banco de dados com dados de exemplo.
-   `queries.sql`: Este arquivo contém exemplos de queries SQL para consulta e manipulação de dados.

## Exemplos de Queries

Abaixo alguns exemplos de queries que podem ser usados para analisar os dados.

-   **Recuperar todos os clientes:**

    ```sql
    SELECT * FROM Cliente;
    ```

-   **Listar todos os veículos de um cliente específico:**

    ```sql
    SELECT * FROM Veiculo WHERE Cliente_idCliente = 1;
    ```

-   **Listar as ordens de serviço com informações dos veículos e clientes:**

    ```sql
    SELECT
      os.idOrdemDeServico, os.dataDeEmissao, os.status, v.marca, v.modelo, c.nome AS nomeCliente
    FROM OrdemDeServico os
    JOIN Veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo
    JOIN Cliente c ON v.Cliente_idCliente = c.idCliente;
    ```

-   **Listar mecânicos e ordens de serviços que realizaram:**

     ```sql
       SELECT
    m.Nome AS Mecanico, COUNT(md.OrdemDeServico_idOrdemDeServico) AS NumeroDeOrdens
    FROM Mecanico m
    LEFT JOIN MecanicoDesignado md ON m.idMecanico = md.Mecanico_idMecanico
    GROUP BY m.Nome
    ORDER BY NumeroDeOrdens DESC;
    ```

-   **Listar as peças usadas em uma ordem de serviço específica:**
    ```sql
    SELECT
      p.Nome AS Peca, pos.Quantidade
    FROM Peca p
    JOIN PecaPorOrdemDeServico pos ON p.idPeça = pos.Peca_idPeça
    WHERE pos.OrdemDeServico_idOrdemDeServico = 1;
    ```

## Contribuição

Contribuições são bem-vindas! Se você encontrar algum problema ou quiser adicionar funcionalidades, sinta-se à vontade para abrir um pull request ou criar uma issue.

## Licença

Este projeto está sob licença MIT.