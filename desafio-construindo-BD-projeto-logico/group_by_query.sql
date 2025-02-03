-- 1. Número de clientes por ano de nascimento
SELECT YEAR(DataDeNascimento) AS AnoNascimento, COUNT(*) AS NumeroClientes
FROM Cliente
GROUP BY AnoNascimento;

-- 2. Valor médio dos pedidos por cliente
SELECT c.Pnome, c.Sobrenome, AVG(p.Valor) AS MediaValorPedido
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.idCliente, c.Pnome, c.Sobrenome;

-- 3. Número de produtos por categoria
SELECT Categoria, COUNT(*) AS NumeroProdutos
FROM Produto
GROUP BY Categoria;

-- 4. Número de produtos fornecidos por cada fornecedor
SELECT f.RazaoSocial, COUNT(pf.Produto_idProduto) AS NumeroProdutos
FROM Fornecedor f
JOIN ProdutoFornecido pf ON f.idFornecedor = pf.Fornecedor_idFornecedor
GROUP BY f.idFornecedor, f.RazaoSocial;

-- 5. Número de produtos vendidos por cada vendedor externo
SELECT ve.Nome, COUNT(pvt.Produto_idProduto) AS NumeroProdutos
FROM VendedorExterno ve
JOIN ProdutoVendidoPorTerceiro pvt ON ve.idVendedorExterno = pvt.VendedorExterno_idVendedorExterno
GROUP BY ve.idVendedorExterno, ve.Nome;

-- 6. Soma do valor dos pedidos por status
SELECT StatusDoPedido, SUM(Valor) AS SomaValorPedidos
FROM Pedido
GROUP BY StatusDoPedido;

-- 7. Quantidade total de produtos em cada local de estoque
SELECT e.Local, COUNT(pe.Produto_idProduto) AS TotalProdutos
FROM Estoque e
JOIN ProdutoEmEstoque pe ON e.idEstoque = pe.Estoque_idEstoque
GROUP BY e.idEstoque, e.Local;

-- 8. Valor mínimo e máximo de produtos por categoria
SELECT Categoria, MIN(Valor) AS MenorValor, MAX(Valor) AS MaiorValor
FROM Produto
GROUP BY Categoria;

-- 9. Média de quantidade de produtos em relação de pedido/produto
SELECT rpp.Produto_idProduto, avg(rpp.Quantidade) AS MediaQuantidade
FROM RelacaoProdutoPedido rpp
GROUP BY rpp.Produto_idProduto;

-- 10.  Total de produtos em cada categoria, juntamente com a soma total de produtos
SELECT Categoria,
       COUNT(idProduto) AS ProdutosNaCategoria,
       (SELECT COUNT(*) FROM Produto) AS TotalDeProdutos
FROM Produto
GROUP BY Categoria;