-- 1. Clientes ordenados por sobrenome
SELECT * FROM Cliente ORDER BY Sobrenome;

-- 2. Produtos ordenados por valor (do menor para o maior)
SELECT * FROM Produto ORDER BY Valor;

-- 3. Pedidos ordenados por data de criação (supomos que temos uma coluna de criação 'DataPedido') e por status
SELECT * FROM Pedido ORDER BY idPedido DESC, StatusDoPedido;

-- 4. Fornecedores ordenados por razão social
SELECT * FROM Fornecedor ORDER BY RazaoSocial;

-- 5. Vendedores ordenados por local e nome
SELECT * FROM VendedorExterno ORDER BY Local, Nome;

-- 6. Clientes ordenados por data de nascimento (do mais velho para o mais novo)
SELECT * FROM Cliente ORDER BY DataDeNascimento;

-- 7. Produtos ordenados por valor (do maior para o menor)
SELECT * FROM Produto ORDER BY Valor DESC;

-- 8. Pedidos ordenados por valor total (do maior para o menor)
SELECT idPedido, Valor + Frete AS ValorTotal FROM Pedido ORDER BY ValorTotal DESC;

-- 9. Fornecedores ordenados por nome de forma decrescente
SELECT * FROM Fornecedor ORDER BY RazaoSocial DESC;

-- 10. Clientes ordenados primeiro por data de nascimento (mais velho primeiro) e depois por sobrenome
SELECT * FROM Cliente ORDER BY DataDeNascimento, Sobrenome;