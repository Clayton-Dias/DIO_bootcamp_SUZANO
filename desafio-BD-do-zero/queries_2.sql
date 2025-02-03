-- 1. Seleciona o nome do cliente, a marca do veículo e valor da ordem de serviço, ordenado pelo valor total, filtrando por ano do veiculo e data de emissão.
SELECT
    c.nome AS Cliente,
    v.marca AS MarcaVeiculo,
    os.idOrdemDeServico,
    os.dataDeEmissao,
    os.valor AS ValorTotal
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente
JOIN OrdemDeServico os ON v.idVeiculo = os.Veiculo_idVeiculo
WHERE v.ano > '2015' AND os.dataDeEmissao > '2023-01-01'
ORDER BY os.valor DESC;


-- 2. Seleciona os mecânicos e o número de ordens de serviço que eles trabalharam, ordenando pelo número de ordens.
SELECT m.Nome AS Mecanico, COUNT(md.OrdemDeServico_idOrdemDeServico) AS NumeroDeOrdens
FROM Mecanico m
LEFT JOIN MecanicoDesignado md ON m.idMecanico = md.Mecanico_idMecanico
GROUP BY m.Nome
ORDER BY NumeroDeOrdens DESC;


-- 3. Seleciona o nome de clientes, o total de peças que foram utilizadas e o valor total, filtrando por clientes que tem mais de 2 veiculos.
SELECT c.nome AS Cliente, SUM(pos.Quantidade) AS TotalPecas,
    SUM(pos.Quantidade * p.valor) AS ValorTotalPecas
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente
JOIN OrdemDeServico os ON v.idVeiculo = os.Veiculo_idVeiculo
JOIN PecaPorOrdemDeServico pos ON os.idOrdemDeServico = pos.OrdemDeServico_idOrdemDeServico
JOIN Peca p ON pos.Peca_idPeça = p.idPeça
GROUP BY c.nome
HAVING COUNT(DISTINCT v.idVeiculo) > 1
ORDER BY ValorTotalPecas DESC;


-- 4.  Seleciona o nome do cliente,  o valor total de cada ordem de serviço, o valor dos serviços e total das peças, filtrando por datas e clientes com mais de 1 veiculo e ordenando por valor total da ordem.
SELECT
    c.nome AS Cliente,
    os.idOrdemDeServico,
    os.valor AS valor_ordem,
    (SELECT SUM(ts.Valor) FROM TabelaDeServico ts WHERE ts.OrdemDeServico_idOrdemDeServico = os.idOrdemDeServico) AS valor_servicos,
     (SELECT SUM(pos.Quantidade * p.valor) FROM PecaPorOrdemDeServico pos
      JOIN Peca p ON pos.Peca_idPeça = p.idPeça
      WHERE pos.OrdemDeServico_idOrdemDeServico = os.idOrdemDeServico ) AS valor_pecas
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente
JOIN OrdemDeServico os ON v.idVeiculo = os.Veiculo_idVeiculo
WHERE os.dataDeEmissao BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.nome, os.idOrdemDeServico
HAVING COUNT(DISTINCT v.idVeiculo) > 1
ORDER BY os.valor DESC;


-- 5. Seleciona a data de emissão das ordens de serviço, calcula o total gasto com peças e serviços, filtra por datas e ordena pela data de emissão
SELECT
    os.dataDeEmissao,
	os.idOrdemDeServico,
	os.valor,
    (SELECT SUM(pos.Quantidade * p.valor) FROM PecaPorOrdemDeServico pos
     JOIN Peca p ON pos.Peca_idPeça = p.idPeça
	 WHERE pos.OrdemDeServico_idOrdemDeServico = os.idOrdemDeServico) AS valor_total_pecas,
	(SELECT SUM(ts.Valor) FROM TabelaDeServico ts WHERE ts.OrdemDeServico_idOrdemDeServico = os.idOrdemDeServico) AS valor_total_servicos
FROM OrdemDeServico os
WHERE os.dataDeEmissao BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY os.dataDeEmissao;

-- 6. Seleciona o nome dos clientes, a quantidade total de serviços realizados para cada cliente, filtrando por clientes que possuem mais de 1 veiculo e ordenado pela quantidade de serviços.
SELECT c.nome AS Cliente, COUNT(ts.Servico_idServico) AS TotalServicos
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente
JOIN OrdemDeServico os ON v.idVeiculo = os.Veiculo_idVeiculo
LEFT JOIN TabelaDeServico ts ON os.idOrdemDeServico = ts.OrdemDeServico_idOrdemDeServico
GROUP BY c.nome
HAVING COUNT(DISTINCT v.idVeiculo) > 1
ORDER BY TotalServicos DESC;


-- 7. Seleciona as informações dos veículos, juntando com dados da ordem de serviço, e mecânicos, filtrando por status da ordem e ordenando pela data de emissão da ordem.
SELECT
    v.marca AS MarcaVeiculo,
    v.modelo AS ModeloVeiculo,
    os.dataDeEmissao,
    m.Nome AS MecanicoResponsavel,
    os.status AS StatusOrdem
FROM Veiculo v
JOIN OrdemDeServico os ON v.idVeiculo = os.Veiculo_idVeiculo
JOIN MecanicoDesignado md ON os.idOrdemDeServico = md.OrdemDeServico_idOrdemDeServico
JOIN Mecanico m ON md.Mecanico_idMecanico = m.idMecanico
WHERE os.status = 'Aberta'
ORDER BY os.dataDeEmissao DESC;


-- 8. Seleciona o nome das peças, sua quantidade total utilizada em cada ordem de serviço, filtrando por um valor acima de 50 e ordenado pelo valor total gasto com a peça.
SELECT
    p.Nome AS Peca,
	os.idOrdemDeServico,
    SUM(pos.Quantidade) AS QuantidadeTotal,
    SUM(pos.Quantidade * p.valor) AS ValorTotal
FROM Peca p
JOIN PecaPorOrdemDeServico pos ON p.idPeça = pos.Peca_idPeça
JOIN OrdemDeServico os ON pos.OrdemDeServico_idOrdemDeServico = os.idOrdemDeServico
GROUP BY p.Nome, os.idOrdemDeServico
HAVING SUM(p.valor * pos.Quantidade) > 50
ORDER BY ValorTotal DESC;

-- 9. Seleciona o nome do cliente, a data de emissão, o valor total da ordem, o valor dos serviços, o valor das peças, filtra por data e clientes que tem mais de 1 veículo, ordenando pelo valor total da ordem
SELECT
    c.nome AS Cliente,
    os.dataDeEmissao,
    os.valor AS ValorTotal,
    (SELECT SUM(ts.Valor) FROM TabelaDeServico ts WHERE ts.OrdemDeServico_idOrdemDeServico = os.idOrdemDeServico) AS ValorServicos,
    (SELECT SUM(pos.Quantidade * p.valor) FROM PecaPorOrdemDeServico pos JOIN Peca p ON pos.Peca_idPeça = p.idPeça WHERE pos.OrdemDeServico_idOrdemDeServico = os.idOrdemDeServico) AS ValorPecas
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente
JOIN OrdemDeServico os ON v.idVeiculo = os.Veiculo_idVeiculo
WHERE os.dataDeEmissao BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.nome, os.idOrdemDeServico
HAVING COUNT(DISTINCT v.idVeiculo) > 1
ORDER BY ValorTotal DESC;


-- 10. Seleciona a especialidade dos mecânicos e o total de ordens de serviços que executaram, filtra mecânicos com mais de 2 ordens e ordena pela especialidade e total de ordens.
SELECT
    m.Especialidade,
    COUNT(md.OrdemDeServico_idOrdemDeServico) AS TotalOrdens
FROM Mecanico m
LEFT JOIN MecanicoDesignado md ON m.idMecanico = md.Mecanico_idMecanico
GROUP BY m.Especialidade
HAVING COUNT(md.OrdemDeServico_idOrdemDeServico) > 2
ORDER BY m.Especialidade, TotalOrdens DESC;