CREATE DATABASE EstudoJoin

-- criando tabela cliente (dimensão)
CREATE TABLE Cliente (
  id_cliente INT NOT NULL,
  nome_cliente VARCHAR(50) NULL,
  endereco_cliente VARCHAR(50) NULL,
  cidade_cliente VARCHAR(50) NULL,
  estado_cliente VARCHAR(50) NULL
 )

 -- adicionando chave primária
ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente_IDCliente PRIMARY KEY (id_cliente)



-- criando tabela vendedor (dimensão)
CREATE TABLE Vendedor (
  id_vendedor INT NOT NULL,
  nome_vendedor VARCHAR(50) NULL);

-- adicionando chave primária
ALTER TABLE Vendedor
ADD CONSTRAINT PK_Vendedor_IDVendedor PRIMARY KEY (id_vendedor)



-- criando tabela pedidos (fato)
CREATE TABLE Pedidos (
  id_pedido INT NULL,
  id_cliente INT NULL,
  id_vendedor INT NULL,
  data_pedido DATETIME NULL,
  id_entrega INT NULL)

-- adicionando chaves estrangeiras vinculando as tabelas dimensões.
ALTER TABLE Pedidos
ADD CONSTRAINT FK_Pedidos_ID_Cliente FOREIGN KEY (ID_Cliente) REFERENCES cliente(ID_Cliente),
	CONSTRAINT FK_Pedidos_Vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)


-- inserindo valores na tabela cliente
INSERT INTO Cliente (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (1, 'Bob Silva', 'Rua 67', 'Fortaleza', 'CE');

INSERT INTO Cliente (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (2, 'Ronaldo Azevedo', 'Rua 64', 'Campinas', 'SP');

INSERT INTO Cliente (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (3, 'John Lenon', 'Rua 42', 'Rio de Janeiro', 'RJ');

INSERT INTO Cliente (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (4, 'Billy Joel', 'Rua 39', 'Campos', 'RJ');

INSERT INTO Cliente (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (5, 'Lady Gaga', 'Rua 45', 'Porto Alegre', 'RS');



-- inserindo valores na tabela Pedidos
INSERT INTO Pedidos (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega)
VALUES (1001, 1, 5, GETDATE(), 23);

INSERT INTO Pedidos (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega)
VALUES (1002, 1, 7, GETDATE(), 24);

INSERT INTO Pedidos (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega)
VALUES (1003, 2, 5, GETDATE(), 23);



-- inserindo valores na tabela Vendedor
INSERT INTO Vendedor (id_vendedor, nome_vendedor)
VALUES (1, 'Vendedor 1');

INSERT INTO Vendedor (id_vendedor, nome_vendedor)
VALUES (2, 'Vendedor 2');

INSERT INTO Vendedor (id_vendedor, nome_vendedor)
VALUES (3, 'Vendedor 3');

INSERT INTO Vendedor (id_vendedor, nome_vendedor)
VALUES (4, 'Vendedor 4');

INSERT INTO Vendedor (id_vendedor, nome_vendedor)
VALUES (5, 'Vendedor 5');

INSERT INTO Vendedor (id_vendedor, nome_vendedor)
VALUES (6, 'Vendedor 6');

INSERT INTO Vendedor (id_vendedor, nome_vendedor)
VALUES (7, 'Vendedor 7');


SELECT * FROM Pedidos
SELECT * FROM Vendedor
SELECT * FROM Cliente




