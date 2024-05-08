
-- 1. Vendas Totais por Mês
SELECT 
    MONTH([data_pedido]) AS Mes,
    SUM([preco_unitario] * [quantidade]) AS Vendas_Totais
FROM [dadosSorveteria].[dbo].[pedidos] AS p
JOIN [dadosSorveteria].[dbo].[itens_pedido] AS i
ON [p].[pedido_id] = [i].[pedido_id]
GROUP BY MONTH([data_pedido]);

-- 2. Produtos Mais Vendidos
SELECT TOP 10
    produtos.nome,
    SUM(itens_pedido.quantidade) AS Quantidade_Vendida
FROM [dadosSorveteria].[dbo].[itens_pedido]
JOIN [dadosSorveteria].[dbo].[produtos] ON [itens_pedido].[produto_id] = [produtos].[produto_id]
GROUP BY produtos.nome
ORDER BY SUM(itens_pedido.quantidade) DESC;

-- 3. Análise de Vendas por Categoria de Produto
SELECT 
    produtos.categoria,
    SUM(itens_pedido.preco_unitario * itens_pedido.quantidade) AS Vendas_Categoria
FROM [dadosSorveteria].[dbo].[itens_pedido]
JOIN [dadosSorveteria].[dbo].[produtos] ON [itens_pedido].[produto_id] = [produtos].[produto_id]
GROUP BY produtos.categoria;

-- 4. Desempenho dos Funcionários
SELECT TOP 10
    funcionarios.nome,
    COUNT(DISTINCT pedidos.pedido_id) AS Numero_Pedidos
FROM [dadosSorveteria].[dbo].[funcionarios]
JOIN [dadosSorveteria].[dbo].[pedidos] ON [funcionarios].[funcionario_id] = [pedidos].[funcionario_id]
GROUP BY funcionarios.nome
ORDER BY Numero_Pedidos DESC;

-- 5. Análise de Clientes Frequentes
SELECT TOP 15
    cliente.nome,
    COUNT(pedidos.pedido_id) AS Numero_Pedidos
FROM [dadosSorveteria].[dbo].[cliente]
JOIN [dadosSorveteria].[dbo].[pedidos] ON [cliente].[cliente_id] = [pedidos].[cliente_id]
GROUP BY cliente.nome
HAVING COUNT(pedidos.pedido_id) > 5
ORDER BY Numero_Pedidos DESC;

-- 6. Impacto das Promoções nas Vendas de Sorvetes nos Meses Frios
SELECT 
    MONTH(p.data_pedido) AS Mes,
    SUM(ip.preco_unitario * ip.quantidade) AS Vendas_Sorvetes
FROM [dadosSorveteria].[dbo].[pedidos] p
JOIN [dadosSorveteria].[dbo].[itens_pedido] ip ON p.pedido_id = ip.pedido_id
JOIN [dadosSorveteria].[dbo].[produtos] pr ON ip.produto_id = pr.produto_id
WHERE pr.categoria = 'Sorvete' AND MONTH(p.data_pedido) IN (6, 7, 8)
GROUP BY MONTH(p.data_pedido);

