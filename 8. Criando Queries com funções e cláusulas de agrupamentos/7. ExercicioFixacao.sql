
/*O gerente está interessado em saber quantos pedidos cada cliente fez em nosso sistema de vendas.
Isso nos ajudará a identificar os clientes mais ativos e a entender melhor o comportamento de compra de cada um*/

SELECT COUNT(p.id_cliente) as Quantidade_de_compra,c.nome_cliente FROM TB_CLIENTES as c
LEFT JOIN TB_PEDIDOS as P ON P.id_cliente = c.id_cliente
GROUP BY c.nome_cliente
ORDER BY COUNT(p.id_cliente) DESC

/*Nosso gerente deseja saber quanto cada cliente gastou em nossa loja. Isso nos dará uma visão clara dos clientes mais lucrativos
e nos ajudará a segmentar nossa base de clientes para estratégias de marketing mais eficazes.*/

SELECT 
	CASE 
		WHEN SUM(p.valor_pedido) IS NULL THEN 0
		ELSE SUM(p.valor_pedido) 
	END as total_gasto,
c.nome_cliente FROM TB_PEDIDOS as p
RIGHT JOIN TB_CLIENTES as C ON p.id_cliente = C.id_cliente
GROUP BY c.nome_cliente
ORDER BY SUM(p.valor_pedido) DESC

/*Como parte de nossa análise de desempenho de vendas, precisamos calcular o valor médio dos pedidos para cada vendedor. 
Isso nos ajudará a entender o desempenho médio de vendas de cada membro da equipe e identificar possíveis áreas de melhoria ou sucesso.*/

SELECT AVG(P.valor_pedido) as valor_vendido,v.nome_vendedor FROM TB_PEDIDOS AS P
RIGHT JOIN TB_VENDEDOR as V ON V.id_vendedor = P.id_vendedor
GROUP BY v.nome_vendedor
ORDER BY AVG(P.valor_pedido) DESC

/*Para entender melhor nossa base de clientes e onde nossa presença é mais forte, precisamos determinar quantos clientes
temos em cada cidade atendida. Isso nos ajudará a direcionar melhor nossos esforços de marketing e vendas em regiões específicas*/

SELECT COUNT(c.cidade_cliente) as quantidade_cliente,c.cidade_cliente FROM TB_CLIENTES as c
GROUP BY c.cidade_cliente

/*É importante para nós entender a distribuição geográfica de nossas vendas e identificar quais estados contribuem mais para nossa
receita total. Calcular a soma dos valores dos pedidos em cada estado nos dará uma visão clara de onde nossa empresa está gerando mais negócios.*/

SELECT SUM(p.valor_pedido) as receita_total, c.estado_cliente FROM TB_PEDIDOS as P, TB_CLIENTES as C
WHERE p.id_cliente = c.id_cliente
GROUP BY c.estado_cliente
ORDER BY SUM(p.valor_pedido) DESC