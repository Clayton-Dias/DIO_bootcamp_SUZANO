create database oficina;

use oficina;

-- Tabela: Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único do cliente, auto-incrementado
    nome VARCHAR(45), -- Nome do cliente
    contato VARCHAR(45), -- Informações de contato do cliente
    Identificacao VARCHAR(45) --  Identificação do cliente (pode ser RG, CPF etc)
);

-- Tabela: Veiculo
CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único do veículo, auto-incrementado
    marca VARCHAR(45), -- Marca do veículo
    cor VARCHAR(45), -- Cor do veículo
    ano VARCHAR(45), -- Ano do veículo
    modelo VARCHAR(45), -- Modelo do veículo
    Cliente_idCliente INT, -- Chave estrangeira referenciando o ID do cliente proprietário do veículo
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente) -- Define a relação entre as tabelas Cliente e Veiculo
);

-- Tabela: Servico
CREATE TABLE Servico (
    idServico INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único do serviço, auto-incrementado
    Nome VARCHAR(45), -- Nome do serviço
    Descricao VARCHAR(45) -- Descrição do serviço
);

-- Tabela: OrdemDeServico
CREATE TABLE OrdemDeServico (
    idOrdemDeServico INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único da ordem de serviço, auto-incrementado
    dataDeEmissao DATE, -- Data de emissão da ordem de serviço
    valor FLOAT, -- Valor total da ordem de serviço
    status VARCHAR(45), -- Status da ordem de serviço (ex: 'Aberta', 'Concluída')
    dataDeConclusao DATE, -- Data de conclusão da ordem de serviço
    Veiculo_idVeiculo INT, -- Chave estrangeira referenciando o ID do veículo associado à ordem de serviço
    FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo) -- Define a relação entre as tabelas Veiculo e OrdemDeServico
);

-- Tabela: TabelaDeServico
CREATE TABLE TabelaDeServico (
  OrdemDeServico_idOrdemDeServico INT, -- Chave estrangeira referenciando o ID da ordem de serviço
  Servico_idServico INT, -- Chave estrangeira referenciando o ID do serviço
  Valor FLOAT, -- Valor do serviço dentro da ordem de serviço
  PRIMARY KEY (OrdemDeServico_idOrdemDeServico, Servico_idServico), -- Define a chave primária composta pela ordem de serviço e o serviço
  FOREIGN KEY (OrdemDeServico_idOrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico), -- Define a relação com a tabela OrdemDeServico
  FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico) -- Define a relação com a tabela Servico
);


-- Tabela: Mecanico
CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único do mecânico, auto-incrementado
    Nome VARCHAR(45), -- Nome do mecânico
    Endereco VARCHAR(45), -- Endereço do mecânico
    Especialidade VARCHAR(45) -- Especialidade do mecânico
);

-- Tabela: MecanicoDesignado
CREATE TABLE MecanicoDesignado (
  Mecanico_idMecanico INT, -- Chave estrangeira referenciando o ID do mecânico
  OrdemDeServico_idOrdemDeServico INT, -- Chave estrangeira referenciando o ID da ordem de serviço
  PRIMARY KEY (Mecanico_idMecanico, OrdemDeServico_idOrdemDeServico), -- Define a chave primária composta pelo mecânico e a ordem de serviço
  FOREIGN KEY (Mecanico_idMecanico) REFERENCES Mecanico(idMecanico), -- Define a relação com a tabela Mecanico
  FOREIGN KEY (OrdemDeServico_idOrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico) -- Define a relação com a tabela OrdemDeServico
);


-- Tabela: Peca
CREATE TABLE Peca (
    idPeça INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único da peça, auto-incrementado
    Nome VARCHAR(45), -- Nome da peça
    valor FLOAT, -- Valor da peça
    Descricao VARCHAR(45) -- Descrição da peça
);

-- Tabela: PecaPorOrdemDeServico
CREATE TABLE PecaPorOrdemDeServico (
  OrdemDeServico_idOrdemDeServico INT, -- Chave estrangeira referenciando o ID da ordem de serviço
  Peca_idPeça INT, -- Chave estrangeira referenciando o ID da peça
  Quantidade INT, -- Quantidade da peça usada na ordem de serviço
  PRIMARY KEY (OrdemDeServico_idOrdemDeServico, Peca_idPeça), -- Define a chave primária composta pela ordem de serviço e a peça
  FOREIGN KEY (OrdemDeServico_idOrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico), -- Define a relação com a tabela OrdemDeServico
  FOREIGN KEY (Peca_idPeça) REFERENCES Peca(idPeça) -- Define a relação com a tabela Peca
);