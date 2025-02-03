-- 1. Clientes que nasceram após 1990
SELECT * FROM Cliente WHERE YEAR(DataDeNascimento) > 1990;

-- 2. Pedidos com valor acima de 100
SELECT * FROM Pedido WHERE Valor > 100;

-- 3. Produtos da categoria 'Eletrônicos'
SELECT * FROM Produto WHERE Categoria = 'Eletrônicos';

-- 4. Fornecedores com CNPJ específico
SELECT * FROM Fornecedor WHERE CNPJ = '12345678000190';

-- 5. Clientes que moram na Rua A
SELECT * FROM Cliente WHERE Endereco LIKE 'Rua A%';

-- 6. Pedidos com frete acima de 15 e status 'Em Andamento'
SELECT * FROM Pedido WHERE Frete > 15 AND StatusDoPedido = 'Em Andamento';

-- 7. Produtos com valor entre 50 e 200
SELECT * FROM Produto WHERE Valor BETWEEN 50 AND 200;

-- 8. Vendedores externos localizados em 'São Paulo'
SELECT * FROM VendedorExterno WHERE Local = 'São Paulo';

-- 9. Clientes com email que contenha 'email.com'
SELECT * FROM Cliente WHERE Email LIKE '%email.com%';

-- 10. Produtos que começam com a descrição 'C'
SELECT * FROM Produto WHERE Descricao LIKE 'C%';