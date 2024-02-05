
CREATE TABLE TB_CLIENTES (
  id_cliente INT NOT NULL,
  nome_cliente VARCHAR(50) NULL,
  endereco_cliente VARCHAR(50) NULL,
  cidade_cliente VARCHAR(50) NULL,
  estado_cliente VARCHAR(50) NULL);

ALTER TABLE TB_CLIENTES
ADD CONSTRAINT PK_Clientes_id_cliente PRIMARY KEY (id_cliente)

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (1, 'Bob Silva', 'Rua 67', 'Fortaleza', 'CE');

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (2, 'Ronaldo Azevedo', 'Rua 64', 'Campinas', 'SP');

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (3, 'John Lenon', 'Rua 42', 'Rio de Janeiro', 'RJ');

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (4, 'Billy Joel', 'Rua 39', 'Campos', 'RJ');

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (5, 'Lady Gaga', 'Rua 45', 'Porto Alegre', 'RS');

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (6, 'Zico Nunes', 'Rua 67', 'Fortaleza', 'CE');

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (7, 'Maria Aparecida', 'Rua 61', 'Natal', 'RN');

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (8, 'Elton John', 'Rua 22', 'Ubatuba', 'SP');

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (9, 'Dario Maravilha', 'Rua 14', 'Ubatuba', 'SP');

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (10, 'Lebron James', 'Rua 29', 'Fortaleza', 'CE');

INSERT INTO TB_CLIENTES (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (11, 'Joao jose', 'Rua 105', 'Rio branco', 'AC');


CREATE TABLE TB_PEDIDOS (
  id_pedido INT NOT NULL,
  id_cliente INT NULL,
  id_vendedor INT NULL,
  data_pedido DATETIME NULL,
  id_entrega INT NULL,
  valor_pedido DECIMAL(10,2) NULL);


ALTER TABLE TB_PEDIDOS
ADD CONSTRAINT PK_Pedidos_IDPedido PRIMARY KEY (id_pedido),
	CONSTRAINT FK_Pedidos_IDCliente_IDCliente FOREIGN KEY (id_cliente) REFERENCES TB_Clientes(id_cliente),
	CONSTRAINT FK_Pedidos_IDvendedor_IDvendedor FOREIGN KEY (id_vendedor) REFERENCES TB_vendedor(id_vendedor)

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1001, 1, 5, GETDATE(), 23, 100.00);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1002, 1, 7, GETDATE(), 24, 112.00);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1003, 2, 5, GETDATE(), 23, 250.00);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1004, 3, 5, GETDATE(), 23, 340.00);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1005, 4, 7, GETDATE(), 24, 1290.00);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1006, 9, 5, GETDATE(), 23, 89.00);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1007, 5, 5, GETDATE(), 23, 468.50);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1008, 1, 7, GETDATE(), 24, 572.20);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1009, 8, 5, GETDATE(), 23, 187.45);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1010, 7, 7, GETDATE(), 24, 579.20);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1011, 10, 5, GETDATE(), 23, 192.45);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1012, 8, 5, GETDATE(), 23, 140.45);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1013, 5, 7, GETDATE(), 28, 573.20);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1014, 6, 5, GETDATE(), 27, 191.45);

INSERT INTO TB_PEDIDOS (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1015, 6, 4, GETDATE(), 22, 154.37);


CREATE TABLE TB_VENDEDOR (
  id_vendedor INT NOT NULL,
  nome_vendedor VARCHAR(50) NULL,
  dept_vendedor VARCHAR(50) NULL);

ALTER TABLE TB_VENDEDOR
ADD CONSTRAINT PK_Vendedor_IDVendedor PRIMARY KEY (id_vendedor)

INSERT INTO TB_VENDEDOR (id_vendedor, nome_vendedor, dept_vendedor)
VALUES (1, 'Vendedor 1', 'Eletronicos');

INSERT INTO TB_VENDEDOR (id_vendedor, nome_vendedor, dept_vendedor)
VALUES (2, 'Vendedor 2', 'Vestuario');

INSERT INTO TB_VENDEDOR (id_vendedor, nome_vendedor, dept_vendedor)
VALUES (3, 'Vendedor 3', 'Eletronicos');

INSERT INTO TB_VENDEDOR (id_vendedor, nome_vendedor, dept_vendedor)
VALUES (4, 'Vendedor 4', 'Moveis');

INSERT INTO TB_VENDEDOR (id_vendedor, nome_vendedor, dept_vendedor)
VALUES (5, 'Vendedor 5', 'Eletrodomesticos');

INSERT INTO TB_VENDEDOR (id_vendedor, nome_vendedor, dept_vendedor)
VALUES (6, 'Vendedor 6', 'Eletrodomesticos');

INSERT INTO TB_VENDEDOR (id_vendedor, nome_vendedor, dept_vendedor)
VALUES (7, 'Vendedor 7', 'Eletronicos');


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