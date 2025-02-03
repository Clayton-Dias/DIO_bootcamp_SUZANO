-- 1. Categorias de produtos com valor médio acima de 100
SELECT Categoria, AVG(Valor) AS MediaValor FROM Produto GROUP BY Categoria HAVING AVG(Valor) > 100;

-- 2. Clientes com mais de 1 pedido
SELECT c.Pnome, c.Sobrenome, COUNT(p.idPedido) AS NumeroPedidos FROM Cliente c JOIN Pedido p ON c.idCliente = p.Cliente_idCliente GROUP BY c.idCliente HAVING COUNT(p.idPedido) > 1;

-- 3. Fornecedores com mais de 2 produtos
SELECT f.RazaoSocial, COUNT(pf.Produto_idProduto) AS NumeroProdutos FROM Fornecedor f JOIN ProdutoFornecido pf ON f.idFornecedor = pf.Fornecedor_idFornecedor GROUP BY f.idFornecedor HAVING COUNT(pf.Produto_idProduto) > 2;

-- 4. Vendedores externos com mais de 50 produtos vendidos
SELECT ve.Nome, COUNT(pvt.Produto_idProduto) AS NumeroProdutos FROM VendedorExterno ve JOIN ProdutoVendidoPorTerceiro pvt ON ve.idVendedorExterno = pvt.VendedorExterno_idVendedorExterno GROUP BY ve.idVendedorExterno HAVING COUNT(pvt.Produto_idProduto) > 50;

-- 5. Locais de estoque com mais de 1000 itens
SELECT e.Local, SUM(pe.Produto_idProduto) AS NumeroProdutos FROM Estoque e JOIN ProdutoEmEstoque pe ON e.idEstoque = pe.Estoque_idEstoque GROUP BY e.idEstoque HAVING COUNT(pe.Produto_idProduto) > 1;

-- 6. Clientes com valor total dos pedidos maior que 300
SELECT c.Pnome, c.Sobrenome, SUM(p.Valor) AS SomaValorTotal FROM Cliente c JOIN Pedido p ON c.idCliente = p.Cliente_idCliente GROUP BY c.idCliente HAVING SUM(p.Valor) > 300;

-- 7.  Categorias que tenham um valor mínimo maior que 50
SELECT Categoria, MIN(Valor) AS ValorMin FROM Produto GROUP BY Categoria HAVING MIN(Valor) > 50;

-- 8. Categorias com o menor valor menor que 20
SELECT Categoria, MIN(Valor) AS ValorMin FROM Produto GROUP BY Categoria HAVING MIN(Valor) < 20;

-- 9. Vendedores externos com mais de 2 produtos vendidos
SELECT ve.Nome, COUNT(pvt.Produto_idProduto) AS NumeroProdutos FROM VendedorExterno ve JOIN ProdutoVendidoPorTerceiro pvt ON ve.idVendedorExterno = pvt.VendedorExterno_idVendedorExterno GROUP BY ve.idVendedorExterno HAVING COUNT(pvt.Produto_idProduto) > 2;

-- 10.  Categorias que tem mais de 1 produto
SELECT Categoria, COUNT(idProduto) as NumeroProdutos FROM Produto GROUP BY Categoria HAVING COUNT(idProduto) > 1