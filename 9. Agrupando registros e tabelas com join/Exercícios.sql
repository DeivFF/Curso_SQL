/*
H� v�rias formas de fazer uma jun��o de tabela, nas situa��es abaixo, utilizaremos INNER JOIN e a
clausula WHERE para retornar os mesmos resultados
*/


/*Retorne uma consulta em que seja poss�vel verificar
o n�mero do pedido e o nome do cliente */

-- utilizando join
SELECT P.id_pedido, C.nome_cliente FROM Pedidos as P
INNER JOIN Cliente as C ON P.id_cliente = C.id_cliente

-- utilizando a cl�usula where
SELECT p.id_pedido, c.nome_cliente FROM Pedidos as p, Cliente as c
WHERE P.id_cliente = c.id_cliente

/*Retorne uma consulta em que seja poss�vel verificar as informa��es de um pedido,
as informa��es devem conter o nome do vendedor e o nome do cliente.*/

-- utilizando inner join
SELECT P.id_pedido, C.nome_cliente, V.nome_vendedor FROM Pedidos as P 
INNER JOIN Cliente as C ON C.id_cliente = P.id_cliente
INNER JOIN Vendedor as V ON V.id_vendedor = P.id_vendedor 

-- utilizando a cl�usula WHERE
SELECT P.id_pedido, C.nome_cliente, V.nome_vendedor FROM Pedidos as P, Vendedor as V, Cliente as C
WHERE P.id_cliente = C.id_cliente AND P.id_vendedor = V.id_vendedor

/*Retorne uma consulta em que seja poss�vel verificar
o n�mero do pedido e o nome do cliente, caso o cliente n�o tenha comprado nenhum produto, retorne-o da mesma forma */

SELECT c.nome_cliente,p.id_pedido FROM Cliente as c
LEFT JOIN Pedidos as p ON p.id_cliente = c.id_cliente

SELECT C.nome_cliente, P.id_pedido 
FROM Cliente as C, Pedidos as P 
WHERE C.id_cliente = P.id_cliente OR P.id_cliente IS NULL;

/*Retorne uma consulta em que seja poss�vel verificar os clientes que n�o realizaram nenhuma compra*/


SELECT c.nome_cliente,p.id_pedido FROM Cliente as c
LEFT JOIN Pedidos as p ON p.id_cliente = c.id_cliente
WHERE p.id_pedido IS NULL


-- Retorne o nome dos vendedores que venderam e os que n�o venderam, retorne tamb�m o nome dos clientes.

SELECT p.data_pedido,v.nome_vendedor,V.id_vendedor,c.nome_cliente FROM Pedidos as P
INNER JOIN Cliente as C ON c.id_cliente = P.id_cliente
RIGHT JOIN Vendedor as V ON V.id_vendedor = P.id_vendedor
ORDER BY C.nome_cliente

SELECT p.data_pedido,c.nome_cliente FROM Pedidos as P
INNER JOIN Cliente as C ON c.id_cliente = P.id_cliente

