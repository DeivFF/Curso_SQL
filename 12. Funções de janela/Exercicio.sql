CREATE DATABASE EstudoSQL

CREATE TABLE Vendas (
    nome_funcionario VARCHAR(50) NOT NULL,
    ano_fiscal INT NOT NULL,
    valor_venda DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(nome_funcionario,ano_fiscal)
);

INSERT INTO Vendas (nome_funcionario, ano_fiscal, valor_venda)
VALUES('Romario',2020,2000),
      ('Romario',2021,2500),
      ('Romario',2022,3000),
      ('Zico',2020,1500),
      ('Zico',2021,1000),
      ('Zico',2022,2000),
	  ('Pele',2020,2000),
      ('Pele',2021,1500),
      ('Pele',2022,2500);

-- descobrir o total acumulado por ano
SELECT nome_funcionario,
       ano_fiscal,valor_venda,
	   SUM(valor_venda) OVER (PARTITION BY ano_fiscal) as total_acumulado 
FROM Vendas

-- descobrir o total acumulado no todo, sem particionamento.
SELECT nome_funcionario,
	   ano_fiscal,
	   valor_venda,
	   SUM(valor_venda) OVER () as total_acumulado
FROM Vendas

-- número de vendas por ano, por funcionário e o número total de vendas

-- utilizando a cláusula OVER()
SELECT nome_funcionario,
	   ano_fiscal,
	   count(nome_funcionario) as quantidade_vendas,
	   count(nome_funcionario) OVER() as total_vendas
FROM Vendas
GROUP BY nome_funcionario, ano_fiscal

-- utilizando subquery
SELECT nome_funcionario,
	   ano_fiscal,
	   count(nome_funcionario) as quantidade_vendas,
	   (SELECT count(*) FROM vendas) as total_vendas
FROM Vendas
GROUP BY nome_funcionario, ano_fiscal