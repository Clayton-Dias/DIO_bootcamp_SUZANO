-- 1. Recuperação Simples com SELECT Statement:
-- Seleciona todos os nomes e contatos de clientes
SELECT nome, contato FROM Cliente;


-- 2. Filtro com WHERE Statement:
-- Seleciona todos os veículos da marca 'Toyota'
SELECT * FROM Veiculo WHERE marca = 'Toyota';


-- 3. Expressões para gerar atributos derivados:
-- Calcula o valor total de cada ordem de serviço com o valor da tabela de serviços
SELECT os.idOrdemDeServico, os.valor, 
       (SELECT SUM(ts.Valor) FROM TabelaDeServico ts WHERE ts.OrdemDeServico_idOrdemDeServico = os.idOrdemDeServico) AS valor_servicos
FROM OrdemDeServico os;

-- 4. Ordenação dos dados com ORDER BY:
-- Seleciona os clientes e ordena por nome em ordem alfabética
SELECT * FROM Cliente ORDER BY nome ASC;

-- 5. Condições de filtros aos grupos – HAVING Statement:
-- Seleciona os clientes que possuem mais de um veiculo
SELECT c.nome, COUNT(v.idVeiculo) AS quantidade_veiculos
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente
GROUP BY c.nome
HAVING COUNT(v.idVeiculo) > 1;

-- 6. GROUP BY:
-- Conta quantos veículos cada cliente possui
SELECT c.nome, COUNT(v.idVeiculo) AS quantidade_veiculos
FROM Cliente c
LEFT JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente
GROUP BY c.nome;

-- 7. Junções entre tabelas:
-- Lista o nome do cliente e a marca do veículo associado
SELECT c.nome AS Cliente, v.marca AS MarcaVeiculo
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente;


-- 8. Junções entre tabelas com filtro:
-- Lista os nomes dos mecânicos e as ordens de serviço que foram designados, somente onde a especialidade do mecânico for 'Motor'
SELECT m.Nome AS Mecanico, os.idOrdemDeServico as OrdemDeServico
FROM Mecanico m
JOIN MecanicoDesignado md ON m.idMecanico = md.Mecanico_idMecanico
JOIN OrdemDeServico os ON md.OrdemDeServico_idOrdemDeServico = os.idOrdemDeServico
WHERE m.Especialidade = 'Motor';


-- 9. Junção entre tabelas com ordenação:
-- Lista os nomes das peças e suas descrições e ordene por nome da peça
SELECT p.Nome, p.Descricao
FROM Peca p
ORDER BY p.Nome ASC;

-- 10. Junção com filtro e ordenação:
-- Lista o nome dos clientes, a marca e modelo dos seus veículos, ordenado pelo nome do cliente e marca do veículo
SELECT c.nome AS Cliente, v.marca, v.modelo
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente
WHERE v.ano > 2010
ORDER BY c.nome, v.marca;