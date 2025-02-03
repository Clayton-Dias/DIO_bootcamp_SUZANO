-- Criação das Tabelas
create database ecommerce;

use ecommerce;

CREATE TABLE Cliente (
  idCliente INT AUTO_INCREMENT PRIMARY KEY,
  Pnome VARCHAR(10),
  InicialDoNomeDoMeio VARCHAR(10),
  Sobrenome VARCHAR(20),
  CPF CHAR(11),
  Endereco VARCHAR(45),
  DataDeNascimento DATE,
  Email VARCHAR(45),
  Telefone VARCHAR(45)
);

CREATE TABLE Pedido (
  idPedido INT AUTO_INCREMENT PRIMARY KEY,
  StatusDoPedido ENUM('Aberto', 'Em Andamento', 'Concluído', 'Cancelado'),
  Descricao VARCHAR(45),
  Frete FLOAT,
  Cliente_idCliente INT,
  Valor FLOAT,
  FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Produto (
  idProduto INT AUTO_INCREMENT PRIMARY KEY,
  Categoria VARCHAR(45),
  Descricao VARCHAR(45),
  Valor FLOAT
);

CREATE TABLE RelacaoProdutoPedido (
  Pedido_idPedido INT,
  Produto_idProduto INT,
  Quantidade INT,
  Status ENUM('Pendente', 'Entregue'),
  PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
  FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
  FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Fornecedor (
  idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
  RazaoSocial VARCHAR(45),
  CNPJ CHAR(15),
  Contato VARCHAR(45),
  Endereco VARCHAR(45)
);


CREATE TABLE ProdutoFornecido (
  Produto_idProduto INT,
  Fornecedor_idFornecedor INT,
  Quantidade INT,
    PRIMARY KEY (Produto_idProduto, Fornecedor_idFornecedor),
  FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
  FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor)
);

CREATE TABLE VendedorExterno (
  idVendedorExterno INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(45),
  Identificacao VARCHAR(15),
  Local VARCHAR(45),
  Contato VARCHAR(45)
);

CREATE TABLE ProdutoVendidoPorTerceiro (
  Produto_idProduto INT,
  VendedorExterno_idVendedorExterno INT,
  Quantidade INT,
   PRIMARY KEY (Produto_idProduto, VendedorExterno_idVendedorExterno),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
  FOREIGN KEY (VendedorExterno_idVendedorExterno) REFERENCES VendedorExterno(idVendedorExterno)
);

CREATE TABLE Estoque (
  idEstoque INT AUTO_INCREMENT PRIMARY KEY,
  Local VARCHAR(45),
  Quantidade VARCHAR(45)
);

CREATE TABLE ProdutoEmEstoque (
  Produto_idProduto INT,
  Estoque_idEstoque INT,
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
   FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
   FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);