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


SELECT Start_station as estacao_inicio,
	   Start_date as data_inicio,
	   Duration,
	   ROW_NUMBER() OVER (ORDER BY start_date)
FROM dbo.capitalbikeshare_tripdata
WHERE Start_date < '2012-01-09'

SELECT * FROM dbo.capitalbikeshare_tripdata

SELECT 
    DataVenda,
    ValorVenda,
	Year(Datavenda) as Ano,
    AVG(ValorVenda) OVER (PARTITION BY YEAR(DataVenda) ORDER BY DataVenda) AS MediaMovel
FROM 
    Vendas;

SELECT 
    DataVenda,
    ValorVenda,		
    AVG(ValorVenda) OVER (ORDER BY DataVenda) AS MediaMovel
FROM 
    Vendas;

-- EXPLICANDO SOBRE ROW NUMBER, DENSE_RANK E RANK
CREATE TABLE TabelaPontos (
    Time VARCHAR(50) NOT NULL,
    Pontos INT NOT NULL
);

INSERT INTO TabelaPontos (Time, Pontos)
VALUES 
    ('Flamengo', 35),
    ('Palmeiras', 35),
    ('Santos', 32),
    ('Internacional', 30),
    ('Fluminense', 30),
    ('Fortaleza', 29);

SELECT * FROM TabelaPontos

SELECT Time,ROW_NUMBER() OVER (ORDER BY Pontos ASC) as ranking FROM TabelaPontos

SELECT Time,
	   pontos,
       ROW_NUMBER() OVER (ORDER BY Pontos DESC) as ranking
FROM TabelaPontos

SELECT Time,ROW_NUMBER() OVER (ORDER BY Pontos DESC) as ranking FROM TabelaPontos
SELECT Time,ROW_NUMBER() OVER (ORDER BY Pontos ASC) as ranking FROM TabelaPontos
ORDER BY ranking DESC




SELECT 
    time,
    Pontos,
    RANK() OVER (ORDER BY Pontos DESC) AS Ranking
FROM 
    TabelaPontos;

SELECT 
    Time,
    Pontos,
    RANK() OVER (ORDER BY Pontos DESC) AS Ranking
FROM 
    TabelaPontos;