CREATE TABLE Vendas (
    DataVenda DATE,
    ValorVenda DECIMAL(10, 2),
);

INSERT INTO Vendas (DataVenda, ValorVenda) VALUES
('2023-01-01', 100.00 ),
('2023-01-02', 150.00),
('2023-01-03', 200.00 ),
('2023-01-04', 250.00 ),
('2023-01-05', 300.00),
('2024-01-01', 100.00),
('2024-01-02', 150.00),
('2024-01-03', 200.00),
('2024-01-04', 250.00),
('2024-01-05', 300.00);

-- média móvel ao longo do tempo particionada por ano.
SELECT 
    DataVenda,
    ValorVenda,
	Year(Datavenda) as Ano,
    AVG(ValorVenda) OVER (PARTITION BY YEAR(DataVenda) ORDER BY DataVenda) AS MediaMovel
FROM 
    Vendas;

-- média móvel ao longo do tempo sem particionamento.
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

-- não pula valores e não repete valores
SELECT Time,
	   pontos,
       ROW_NUMBER() OVER (ORDER BY Pontos DESC) as ranking
FROM TabelaPontos

-- pula valores e repete valores
SELECT 
    time,
    Pontos,
    RANK() OVER (ORDER BY Pontos DESC) AS Ranking
FROM 
    TabelaPontos;

-- não pula valores mas repete valores.
SELECT 
    Time,
    Pontos,
    DENSE_RANK() OVER (ORDER BY Pontos DESC) AS Ranking
FROM 
    TabelaPontos;