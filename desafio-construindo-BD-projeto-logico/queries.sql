-- 1. Clientes que fizeram mais de 1 pedido, com valor médio acima de 100, ordenado por média decrescente
SELECT c.Pnome, c.Sobrenome, AVG(p.Valor) AS MediaValorPedido
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.idCliente, c.Pnome, c.Sobrenome
HAVING COUNT(p.idPedido) > 1 AND AVG(p.Valor) > 100
ORDER BY MediaValorPedido DESC;

-- 2. Categorias com valor médio de produtos acima de 50, ordenadas por valor médio
SELECT Categoria, AVG(Valor) AS MediaValor
FROM Produto
WHERE Categoria <> 'Brinquedos'
GROUP BY Categoria
HAVING AVG(Valor) > 50
ORDER BY MediaValor;

-- 3. Fornecedores com mais de 2 produtos, ordenados por número de produtos
SELECT f.RazaoSocial, COUNT(pf.Produto_idProduto) AS NumeroProdutos
FROM Fornecedor f
JOIN ProdutoFornecido pf ON f.idFornecedor = pf.Fornecedor_idFornecedor
WHERE f.Endereco <> 'Rua X, 100'
GROUP BY f.idFornecedor, f.RazaoSocial
HAVING COUNT(pf.Produto_idProduto) > 2
ORDER BY NumeroProdutos DESC;

-- 4. Vendedores externos com mais de 50 produtos vendidos, ordenados por nome
SELECT ve.Nome, COUNT(pvt.Produto_idProduto) AS NumeroProdutos
FROM VendedorExterno ve
JOIN ProdutoVendidoPorTerceiro pvt ON ve.idVendedorExterno = pvt.VendedorExterno_idVendedorExterno
WHERE ve.Local = 'São Paulo'
GROUP BY ve.idVendedorExterno, ve.Nome
HAVING COUNT(pvt.Produto_idProduto) > 50
ORDER BY ve.Nome;

-- 5. Locais de estoque com mais de 2 tipos de produtos, ordenados pela quantidade de produtos
SELECT e.Local, COUNT(pe.Produto_idProduto) AS TotalProdutos
FROM Estoque e
JOIN ProdutoEmEstoque pe ON e.idEstoque = pe.Estoque_idEstoque
WHERE e.Local LIKE 'Depósito%'
GROUP BY e.idEstoque, e.Local
HAVING COUNT(pe.Produto_idProduto) > 2
ORDER BY TotalProdutos DESC;

-- 6. Pedidos com status 'Em Andamento' que tem valor total acima de 150, ordenados por valor total
SELECT p.idPedido, c.Pnome as cliente_nome, SUM(p.Valor + p.Frete) AS ValorTotal
FROM Pedido p
JOIN Cliente c ON p.Cliente_idCliente = c.idCliente
WHERE p.StatusDoPedido = 'Em Andamento'
GROUP BY p.idPedido, c.Pnome
HAVING ValorTotal > 150
ORDER BY ValorTotal DESC;

-- 7. Clientes que nasceram antes de 1990 e com valor médio de pedidos acima de 100, ordenados por data de nascimento
SELECT c.Pnome, c.Sobrenome, YEAR(c.DataDeNascimento) AS AnoNascimento, AVG(p.Valor) AS MediaValorPedido
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
WHERE YEAR(c.DataDeNascimento) < 1990
GROUP BY c.idCliente, c.Pnome, c.Sobrenome, AnoNascimento
HAVING AVG(p.Valor) > 100
ORDER BY AnoNascimento;

-- 8. Produtos fornecidos com valor médio acima de 300 e quantidade total abaixo de 100
SELECT p.Descricao, f.RazaoSocial, COUNT(pf.Quantidade) as TotalProdutos
FROM Produto p
JOIN ProdutoFornecido pf ON p.idProduto = pf.Produto_idProduto
JOIN Fornecedor f ON f.idFornecedor = pf.Fornecedor_idFornecedor
WHERE p.Valor > 250
GROUP BY p.idProduto, p.Descricao, f.RazaoSocial
HAVING AVG(p.Valor) > 300 AND  TotalProdutos < 100
ORDER BY p.Descricao;

-- 9.  Vendedores que venderam mais de 5 produtos com seus nomes em ordem crescente
SELECT ve.Nome, COUNT(pvt.Produto_idProduto) as quantidade_de_produtos
FROM VendedorExterno ve
JOIN ProdutoVendidoPorTerceiro pvt ON ve.idVendedorExterno = pvt.VendedorExterno_idVendedorExterno
WHERE ve.Local LIKE 'R%'
GROUP BY ve.idVendedorExterno, ve.Nome
HAVING quantidade_de_produtos > 5
ORDER BY ve.Nome;

-- 10.  Pedidos com status 'Em Andamento' cujo valor total seja superior a 500
SELECT c.Pnome, c.Sobrenome, p.idPedido, SUM(p.Valor+p.Frete) as ValorTotal
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
WHERE p.StatusDoPedido = 'Em Andamento'
GROUP BY c.idCliente, c.Pnome, c.Sobrenome, p.idPedido
HAVING ValorTotal > 500
ORDER BY c.Pnome;

-- 11.  Produtos com valor maior que 50 que são da categoria de 'livros' e seu valor médio é acima de 70
SELECT p.Descricao, p.Categoria, AVG(p.Valor) as ValorMedio
FROM Produto p
WHERE p.Valor > 50
GROUP BY p.idProduto, p.Descricao, p.Categoria
HAVING p.Categoria = 'Livros' AND ValorMedio > 70
ORDER BY p.Descricao;

-- 12.  Fornecedores que tem mais de 1 produto, ordenado pelo numero de produtos que tem do maior pro menor
SELECT f.RazaoSocial, COUNT(pf.Produto_idProduto) as NumeroProdutos
FROM Fornecedor f
JOIN ProdutoFornecido pf ON f.idFornecedor = pf.Fornecedor_idFornecedor
WHERE f.Endereco LIKE '%Avenida%'
GROUP BY f.idFornecedor, f.RazaoSocial
HAVING NumeroProdutos > 1
ORDER BY NumeroProdutos DESC;

-- 13.  Clientes com pedidos com valor médio acima de 100 que nasceram após 1990
SELECT c.Pnome, c.Sobrenome, AVG(p.Valor) as MediaValorPedido, c.DataDeNascimento
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
WHERE YEAR(c.DataDeNascimento) > 1990
GROUP BY c.idCliente, c.Pnome, c.Sobrenome, c.DataDeNascimento
HAVING MediaValorPedido > 100
ORDER BY c.DataDeNascimento;

-- 14.  Pedidos com status 'Concluído' que tem valor total acima de 100 ordenados pelo frete de forma crescente
SELECT p.idPedido,  c.Pnome as cliente_nome, SUM(p.Valor + p.Frete) as valor_total, p.Frete
FROM Pedido p
JOIN Cliente c ON p.Cliente_idCliente = c.idCliente
WHERE p.StatusDoPedido = 'Concluído'
GROUP BY p.idPedido, c.Pnome, p.Frete
HAVING valor_total > 100
ORDER BY p.Frete;

-- 15.  Categorias de produto com sua soma total e sua média e ordenados pela média
SELECT p.Categoria, SUM(p.Valor) as ValorTotal, AVG(p.Valor) as ValorMedio
FROM Produto p
GROUP BY p.Categoria
HAVING ValorMedio > 40
ORDER BY ValorMedio;