-- qual n�mero de hubs por cidade
SELECT COUNT(hub_city) as [quantidade hubs], hub_city FROM hubs
GROUP BY hub_city

-- 2- Qual o n�mero de pedidos (orders) por status?
SELECT COUNT(delivery_order_id) as [numero de pedidos],delivery_status FROM deliveries
GROUP BY delivery_status

-- 3- Qual o n�mero de lojas (stores) por cidade dos hubs?
SELECT COUNT(s.hub_id) as [Quantidade loja],h.hub_city FROM stores as s
RIGHT JOIN hubs as h on s.hub_id = h.hub_id

-- 4- Qual o maior e o menor valor de pagamento (payment_amount) registrado?
SELECT MAX(payment_amount),MIN(payment_amount) FROM payments

-- 5- Qual tipo de driver (driver_type) fez o maior n�mero de entregas?
SELECT COUNT(de.driver_id) as quantidade_entrega, dr.driver_type FROM deliveries de
RIGHT JOIN drivers as dr ON de.driver_id = dr.driver_id
GROUP BY dr.driver_type
ORDER BY quantidade_entrega DESC

-- 6- Qual a dist�ncia m�dia das entregas por tipo de driver (driver_modal)?
SELECT AVG(CONVERT(BIGINT,delivery_distance_meters)) as [Distancia media],dr.driver_modal FROM deliveries as de
INNER JOIN drivers as dr ON dr.driver_id = de.driver_id
GROUP BY dr.driver_modal

-- 7- Qual a m�dia de valor de pedido (order_amount) por loja, em ordem decrescente?


/*

# 7- Qual a m�dia de valor de pedido (order_amount) por loja, em ordem decrescente?
# 8- Existem pedidos que n�o est�o associados a lojas? Se caso positivo, quantos?
# 9- Qual o valor total de pedido (order_amount) no channel 'FOOD PLACE'?
# 10- Quantos pagamentos foram cancelados (chargeback)?
# 11- Qual foi o valor m�dio dos pagamentos cancelados (chargeback)?
# 12- Qual a m�dia do valor de pagamento por m�todo de pagamento (payment_method) em ordem decrescente?
# 13- Quais m�todos de pagamento tiveram valor m�dio superior a 100?
# 14- Qual a m�dia de valor de pedido (order_amount) por estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type)?
# 15- Qual estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type) teve m�dia de valor de pedido (order_amount) maior que 450?
# 16- Qual o valor total de pedido (order_amount) por estado do hub (hub_state),*/

SELECT * FROM hubs
SELECT * FROM channels
SELECT * FROM deliveries
SELECT * FROM drivers
SELECT * FROM stores
SELECT * FROM paymens