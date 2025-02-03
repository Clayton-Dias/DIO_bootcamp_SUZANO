-- 1. Clientes com nome completo
SELECT Pnome, InicialDoNomeDoMeio, Sobrenome, CONCAT(Pnome, ' ', InicialDoNomeDoMeio, '. ', Sobrenome) AS NomeCompleto FROM Cliente;

-- 2. Pedidos com valor total (valor + frete)
SELECT idPedido, Valor, Frete, Valor + Frete AS ValorTotal FROM Pedido;

-- 3. Produtos com valor aumentado em 10%
SELECT Descricao, Valor, Valor * 1.1 AS ValorAjustado FROM Produto;

-- 4. Número de dias desde o nascimento do cliente
SELECT Pnome, Sobrenome, DataDeNascimento, DATEDIFF(CURDATE(), DataDeNascimento) AS DiasDesdeNascimento FROM Cliente;

-- 5. Valor do frete como porcentagem do valor do pedido
SELECT idPedido, Valor, Frete, (Frete / Valor) * 100 AS PorcentagemFrete FROM Pedido WHERE Valor > 0;

-- 6. Nome do produto em caixa alta
SELECT Descricao, UPPER(Descricao) AS DescricaoMaiuscula FROM Produto;

-- 7.  Pedidos com um novo status
SELECT idPedido, StatusDoPedido, IF(StatusDoPedido = 'Concluído', 'Finalizado', 'Pendente') AS NovoStatus FROM Pedido;

-- 8.  Pedidos com o ano
SELECT idPedido, StatusDoPedido, YEAR(NOW()) as AnoAtual FROM Pedido;

-- 9.  Nome do vendedor externo abreviado
SELECT Nome, SUBSTRING(Nome, 1, 5) AS NomeAbreviado FROM VendedorExterno;

-- 10.  Primeira letra do nome do cliente
SELECT Pnome, LEFT(Pnome,1) AS PrimeiraLetra FROM Cliente;