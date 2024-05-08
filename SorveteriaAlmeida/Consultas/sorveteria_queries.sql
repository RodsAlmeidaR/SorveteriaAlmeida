
-- 1. Vendas Totais por Mês
SELECT 
    EXTRACT(MONTH FROM data_pedido) AS Mes,
    SUM(preco_unitario * quantidade) AS Vendas_Totais
FROM Pedidos
JOIN ItensPedido ON Pedidos.pedido_id = ItensPedido.pedido_id
GROUP BY EXTRACT(MONTH FROM data_pedido);

-- 2. Produtos Mais Vendidos
SELECT 
    Produtos.nome,
    SUM(ItensPedido.quantidade) AS Quantidade_Vendida
FROM ItensPedido
JOIN Produtos ON ItensPedido.produto_id = Produtos.produto_id
GROUP BY Produtos.nome
ORDER BY Quantidade_Vendida DESC
LIMIT 10;

-- 3. Análise de Vendas por Categoria de Produto
SELECT 
    categoria,
    SUM(preco_unitario * quantidade) AS Vendas_Categoria
FROM Produtos
JOIN ItensPedido ON Produtos.produto_id = ItensPedido.produto_id
GROUP BY categoria;

-- 4. Desempenho dos Funcionários
SELECT 
    Funcionarios.nome,
    COUNT(DISTINCT Pedidos.pedido_id) AS Numero_Pedidos
FROM Funcionarios
JOIN Pedidos ON Funcionarios.funcionario_id = Pedidos.funcionario_id
GROUP BY Funcionarios.nome
ORDER BY Numero_Pedidos DESC;

-- 5. Análise de Clientes Frequentes
SELECT 
    Clientes.nome,
    COUNT(Pedidos.pedido_id) AS Numero_Pedidos
FROM Clientes
JOIN Pedidos ON Clientes.cliente_id = Pedidos.cliente_id
GROUP BY Clientes.nome
HAVING COUNT(Pedidos.pedido_id) > 5
ORDER BY Numero_Pedidos DESC;

-- 6. Impacto das Promoções nas Vendas de Sorvetes nos Meses Frios
SELECT 
    EXTRACT(MONTH FROM data_pedido) AS Mes,
    SUM(preco_unitario * quantidade) AS Vendas_Sorvetes
FROM Pedidos
JOIN ItensPedido ON Pedidos.pedido_id = ItensPedido.pedido_id
JOIN Produtos ON ItensPedido.produto_id = Produtos.produto_id
WHERE categoria = 'Sorvete' AND EXTRACT(MONTH FROM data_pedido) IN (6, 7, 8)
GROUP BY EXTRACT(MONTH FROM data_pedido);
