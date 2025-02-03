use ecommerce;

-- Inserções na tabela Cliente
INSERT INTO Cliente (Pnome, InicialDoNomeDoMeio, Sobrenome, CPF, Endereco, DataDeNascimento, Email, Telefone) VALUES
('Ana', 'M', 'Silva', '12345678901', 'Rua A, 123', '1990-05-15', 'ana.silva@email.com', '11999991111'),
('Bruno', 'R', 'Oliveira', '23456789012', 'Avenida B, 456', '1985-10-20', 'bruno.oliveira@email.com', '21888882222'),
('Carla', 'F', 'Santos', '34567890123', 'Rua C, 789', '1995-03-25', 'carla.santos@email.com', '31777773333'),
('Daniel', 'L', 'Pereira', '45678901234', 'Avenida D, 101', '1988-08-01', 'daniel.pereira@email.com', '41666664444'),
('Elisa', 'S', 'Rodrigues', '56789012345', 'Rua E, 202', '1992-12-10', 'elisa.rodrigues@email.com', '51555555555'),
('Fábio', 'P', 'Costa', '67890123456', 'Avenida F, 303', '1997-07-05', 'fabio.costa@email.com', '61444446666'),
('Gabriela', 'A', 'Almeida', '78901234567', 'Rua G, 404', '1993-04-18', 'gabriela.almeida@email.com', '71333337777'),
('Henrique', 'J', 'Martins', '89012345678', 'Avenida H, 505', '1986-09-03', 'henrique.martins@email.com', '81222228888'),
('Isabela', 'K', 'Ferreira', '90123456789', 'Rua I, 606', '1999-01-22', 'isabela.ferreira@email.com', '91111119999'),
('João', 'B', 'Gomes', '01234567890', 'Avenida J, 707', '1989-06-12', 'joao.gomes@email.com', '10987654321');

-- Inserções na tabela Pedido
INSERT INTO Pedido (StatusDoPedido, Descricao, Frete, Cliente_idCliente, Valor) VALUES
('Aberto', 'Pedido 1', 10.00, 1, 150.00),
('Em Andamento', 'Pedido 2', 15.00, 2, 200.00),
('Concluído', 'Pedido 3', 20.00, 3, 300.00),
('Cancelado', 'Pedido 4', 5.00, 4, 50.00),
('Aberto', 'Pedido 5', 12.50, 5, 120.00),
('Em Andamento', 'Pedido 6', 18.00, 6, 250.00),
('Concluído', 'Pedido 7', 22.00, 7, 350.00),
('Cancelado', 'Pedido 8', 7.50, 8, 75.00),
('Aberto', 'Pedido 9', 11.00, 9, 110.00),
('Em Andamento', 'Pedido 10', 16.00, 10, 210.00);

-- Inserções na tabela Produto
INSERT INTO Produto (Categoria, Descricao, Valor) VALUES
('Eletrônicos', 'Smartphone', 1200.00),
('Livros', 'Aventuras de Sherlock Holmes', 35.00),
('Roupas', 'Camiseta algodão', 40.00),
('Eletrodomésticos', 'Geladeira', 2500.00),
('Alimentos', 'Pacote de café', 15.00),
('Brinquedos', 'Boneca', 80.00),
('Ferramentas', 'Chave de fenda', 20.00),
('Esportes', 'Bola de futebol', 60.00),
('Móveis', 'Cadeira', 300.00),
('Informática', 'Mouse', 25.00);

-- Inserções na tabela RelacaoProdutoPedido
INSERT INTO RelacaoProdutoPedido (Pedido_idPedido, Produto_idProduto, Quantidade, Status) VALUES
(1, 1, 1, 'Entregue'),
(1, 3, 2, 'Pendente'),
(2, 2, 1, 'Entregue'),
(3, 4, 1, 'Entregue'),
(4, 5, 3, 'Pendente'),
(5, 6, 1, 'Entregue'),
(6, 7, 2, 'Entregue'),
(7, 8, 4, 'Pendente'),
(8, 9, 1, 'Entregue'),
(9, 10, 2, 'Entregue');

-- Inserções na tabela Fornecedor
INSERT INTO Fornecedor (RazaoSocial, CNPJ, Contato, Endereco) VALUES
('Tech Solutions Ltda', '12345678000190', 'fornecedor1@tech.com', 'Rua X, 100'),
('Book Masters S/A', '23456789000180', 'fornecedor2@book.com', 'Avenida Y, 200'),
('Moda & Cia', '34567890000170', 'fornecedor3@moda.com', 'Rua Z, 300'),
('Electro House', '45678901000160', 'fornecedor4@eletro.com', 'Avenida W, 400'),
('Café Mineiro', '56789012000150', 'fornecedor5@cafe.com', 'Rua K, 500'),
('Toy Fun', '67890123000140', 'fornecedor6@toy.com', 'Avenida L, 600'),
('Tools & Co', '78901234000130', 'fornecedor7@tools.com', 'Rua M, 700'),
('Sport Time', '89012345000120', 'fornecedor8@sport.com', 'Avenida N, 800'),
('Home Comfort', '90123456000110', 'fornecedor9@home.com', 'Rua O, 900'),
('Info Tech', '01234567000100', 'fornecedor10@info.com', 'Avenida P, 1000');

-- Inserções na tabela ProdutoFornecido
INSERT INTO ProdutoFornecido (Produto_idProduto, Fornecedor_idFornecedor, Quantidade) VALUES
(1, 1, 100),
(2, 2, 200),
(3, 3, 150),
(4, 4, 50),
(5, 5, 300),
(6, 6, 100),
(7, 7, 250),
(8, 8, 200),
(9, 9, 150),
(10, 10, 300);

-- Inserções na tabela VendedorExterno
INSERT INTO VendedorExterno (Nome, Identificacao, Local, Contato) VALUES
('Vendedor A', 'VA123', 'São Paulo', 'vendedor1@externo.com'),
('Vendedor B', 'VB456', 'Rio de Janeiro', 'vendedor2@externo.com'),
('Vendedor C', 'VC789', 'Belo Horizonte', 'vendedor3@externo.com'),
('Vendedor D', 'VD101', 'Porto Alegre', 'vendedor4@externo.com'),
('Vendedor E', 'VE202', 'Curitiba', 'vendedor5@externo.com'),
('Vendedor F', 'VF303', 'Salvador', 'vendedor6@externo.com'),
('Vendedor G', 'VG404', 'Brasília', 'vendedor7@externo.com'),
('Vendedor H', 'VH505', 'Recife', 'vendedor8@externo.com'),
('Vendedor I', 'VI606', 'Fortaleza', 'vendedor9@externo.com'),
('Vendedor J', 'VJ707', 'Manaus', 'vendedor10@externo.com');


-- Inserções na tabela ProdutoVendidoPorTerceiro
INSERT INTO ProdutoVendidoPorTerceiro (Produto_idProduto, VendedorExterno_idVendedorExterno, Quantidade) VALUES
(1, 1, 50),
(2, 2, 100),
(3, 3, 75),
(4, 4, 25),
(5, 5, 150),
(6, 6, 50),
(7, 7, 125),
(8, 8, 100),
(9, 9, 75),
(10, 10, 150);

-- Inserções na tabela Estoque
INSERT INTO Estoque (Local, Quantidade) VALUES
('Depósito 1', '500'),
('Loja Principal', '1000'),
('Depósito 2', '750'),
('Depósito 3', '200'),
('Loja Secundária', '1500'),
('Depósito 4', '300'),
('Depósito 5', '600'),
('Depósito 6', '400'),
('Loja Online', '1200'),
('Depósito 7', '800');

-- Inserções na tabela ProdutoEmEstoque
INSERT INTO ProdutoEmEstoque (Produto_idProduto, Estoque_idEstoque) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);