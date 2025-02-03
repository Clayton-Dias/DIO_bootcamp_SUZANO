-- 1. Clientes com seus pedidos
SELECT c.Pnome, c.Sobrenome, p.idPedido, p.Valor FROM Cliente c JOIN Pedido p ON c.idCliente = p.Cliente_idCliente;

-- 2. Produtos com seus fornecedores
SELECT p.Descricao, f.RazaoSocial FROM Produto p JOIN ProdutoFornecido pf ON p.idProduto = pf.Produto_idProduto JOIN Fornecedor f ON pf.Fornecedor_idFornecedor = f.idFornecedor;

-- 3. Pedidos com detalhes dos produtos (nome, quantidade)
SELECT p.idPedido, pr.Descricao, rpp.Quantidade FROM Pedido p JOIN RelacaoProdutoPedido rpp ON p.idPedido = rpp.Pedido_idPedido JOIN Produto pr ON rpp.Produto_idProduto = pr.idProduto;

-- 4. Produtos com seus vendedores externos
SELECT p.Descricao, ve.Nome FROM Produto p JOIN ProdutoVendidoPorTerceiro pvt ON p.idProduto = pvt.Produto_idProduto JOIN VendedorExterno ve ON pvt.VendedorExterno_idVendedorExterno = ve.idVendedorExterno;

-- 5. Produtos com suas localizações em estoque
SELECT p.Descricao, e.Local FROM Produto p JOIN ProdutoEmEstoque pe ON p.idProduto = pe.Produto_idProduto JOIN Estoque e ON pe.Estoque_idEstoque = e.idEstoque;

-- 6. Todos os clientes e seus respectivos pedidos com valor e frete
SELECT c.Pnome, c.Sobrenome, p.idPedido, p.Valor, p.Frete FROM Cliente c LEFT JOIN Pedido p ON c.idCliente = p.Cliente_idCliente;

-- 7. Produtos e seus fornecedores
SELECT p.Descricao as produto, f.RazaoSocial as fornecedor FROM Produto p JOIN ProdutoFornecido pf ON p.idProduto = pf.Produto_idProduto JOIN Fornecedor f ON f.idFornecedor = pf.Fornecedor_idFornecedor;

-- 8. Produtos e seus vendedores externos
SELECT p.Descricao as produto, ve.Nome as vendedor FROM Produto p JOIN ProdutoVendidoPorTerceiro pvt ON p.idProduto = pvt.Produto_idProduto JOIN VendedorExterno ve ON ve.idVendedorExterno = pvt.VendedorExterno_idVendedorExterno;

-- 9.  Produtos, seus locais e quantidades
SELECT p.Descricao as produto, e.Local as local, e.Quantidade as quantidade_em_estoque
FROM Produto p
JOIN ProdutoEmEstoque pe ON p.idProduto = pe.Produto_idProduto
JOIN Estoque e ON e.idEstoque = pe.Estoque_idEstoque;

-- 10. Todos os pedidos com informações detalhadas
SELECT  p.idPedido, p.StatusDoPedido, p.Valor, p.Frete,c.Pnome as cliente_nome , pr.Descricao as produto_descricao, f.RazaoSocial as fornecedor_razao, ve.Nome as vendedor_externo_nome
FROM Pedido p
JOIN Cliente c ON p.Cliente_idCliente = c.idCliente
JOIN RelacaoProdutoPedido rpp ON p.idPedido = rpp.Pedido_idPedido
JOIN Produto pr ON rpp.Produto_idProduto = pr.idProduto
LEFT JOIN ProdutoFornecido pf ON pr.idProduto = pf.Produto_idProduto
LEFT JOIN Fornecedor f ON pf.Fornecedor_idFornecedor = f.idFornecedor
LEFT JOIN ProdutoVendidoPorTerceiro pvt ON pr.idProduto = pvt.Produto_idProduto
LEFT JOIN VendedorExterno ve ON pvt.VendedorExterno_idVendedorExterno = ve.idVendedorExterno;