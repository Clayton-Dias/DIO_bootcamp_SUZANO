-- Inserindo clientes na tabela Cliente
INSERT INTO Cliente (nome, contato, Identificacao) VALUES
('Maria Silva', '11-9999-8888', '123456789-00'),
('João Santos', '21-8888-7777', '987654321-11'),
('Ana Oliveira', '31-7777-6666', '555444333-22'),
('Carlos Pereira', '41-6666-5555', '111222333-44');

-- Inserindo veículos na tabela Veiculo
INSERT INTO Veiculo (marca, cor, ano, modelo, Cliente_idCliente) VALUES
('Volkswagen', 'Prata', '2020', 'Gol', 1),
('Fiat', 'Vermelho', '2021', 'Uno', 2),
('Ford', 'Branco', '2022', 'Ka', 3),
('Chevrolet', 'Preto', '2023', 'Onix', 4),
('Toyota', 'Azul', '2019', 'Corolla', 1),
('Hyundai', 'Cinza', '2022', 'HB20', 3);

-- Inserindo serviços na tabela Servico
INSERT INTO Servico (Nome, Descricao) VALUES
('Troca de Óleo', 'Substituição do óleo do motor'),
('Revisão', 'Revisão completa do veículo'),
('Alinhamento', 'Ajuste da geometria das rodas'),
('Balanceamento', 'Balanceamento das rodas'),
('Troca de Pneus', 'Substituição de pneus'),
('Troca de Freios', 'Substituição de pastilhas e discos de freio');

-- Inserindo ordens de serviço na tabela OrdemDeServico
INSERT INTO OrdemDeServico (dataDeEmissao, valor, status, dataDeConclusao, Veiculo_idVeiculo) VALUES
('2023-10-27', 150.00, 'Concluída', '2023-10-27', 1),
('2023-10-28', 300.00, 'Concluída', '2023-10-28', 2),
('2023-10-29', 100.00, 'Aberta', NULL, 3),
('2023-10-30', 200.00, 'Em Andamento', NULL, 4),
('2023-10-31', 120.00, 'Concluída', '2023-10-31', 5),
('2023-11-01', 400.00, 'Aberta', NULL, 6),
('2023-11-01', 300.00, 'Concluída', '2023-11-01', 1),
('2023-11-02', 100.00, 'Aberta', NULL, 2),
('2023-11-03', 400.00, 'Concluída', '2023-11-03', 3),
('2023-11-04', 300.00, 'Concluída', '2023-11-04', 4),
('2023-11-05', 200.00, 'Aberta', NULL, 5);

-- Inserindo serviços nas ordens de serviço na tabela TabelaDeServico
INSERT INTO TabelaDeServico (OrdemDeServico_idOrdemDeServico, Servico_idServico, Valor) VALUES
(1, 1, 80.00),
(1, 2, 70.00),
(2, 3, 120.00),
(2, 4, 180.00),
(3, 1, 100.00),
(4, 5, 200.00),
(5, 6, 120.00),
(6, 4, 400.00),
(7, 1, 80.00),
(7, 2, 220.00),
(8, 3, 100.00),
(9, 1, 300.00),
(9, 2, 100.00),
(10, 5, 200.00),
(10, 6, 100.00),
(11, 4, 200.00);

-- Inserindo mecânicos na tabela Mecanico
INSERT INTO Mecanico (Nome, Endereco, Especialidade) VALUES
('Ricardo Alves', 'Rua A, 100', 'Motor'),
('Fernanda Lima', 'Rua B, 200', 'Suspensão'),
('Lucas Oliveira', 'Rua C, 300', 'Freios'),
('Patrícia Souza', 'Rua D, 400', 'Eletricidade');

-- Inserindo mecânicos designados para ordens de serviço na tabela MecanicoDesignado
INSERT INTO MecanicoDesignado (Mecanico_idMecanico, OrdemDeServico_idOrdemDeServico) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(1, 5),
(2, 6),
(3, 7),
(4, 8),
(1, 9),
(2, 10),
(3, 11),
(4, 1);


-- Inserindo peças na tabela Peca
INSERT INTO Peca (Nome, valor, Descricao) VALUES
('Filtro de Óleo', 25.00, 'Filtro de óleo do motor'),
('Pastilha de Freio', 80.00, 'Pastilha de freio dianteira'),
('Pneu', 250.00, 'Pneu aro 15'),
('Bateria', 350.00, 'Bateria para carros'),
('Filtro de Ar', 30.00, 'Filtro de ar do motor'),
('Vela de Ignição', 15.00, 'Vela de ignição do motor');

-- Inserindo peças utilizadas nas ordens de serviço na tabela PecaPorOrdemDeServico
INSERT INTO PecaPorOrdemDeServico (OrdemDeServico_idOrdemDeServico, Peca_idPeça, Quantidade) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 4),
(4, 4, 1),
(5, 5, 2),
(6, 1, 1),
(7, 2, 2),
(8, 3, 4),
(9, 4, 1),
(10, 5, 2),
(11, 6, 1),
(1, 6, 4),
(2, 5, 1);