SELECT * FROM Producao.SubcategoriaProduto

-- Escreva uma consulta que selecione todos os produtos com um custo padr�o entre $50 e $100.
SELECT * FROM Producao.Produto
WHERE CustoPadrao BETWEEN 50 AND 100

-- Escreva uma consulta que retorne todos os documentos cuja revis�o esteja entre 1 e 4.
SELECT * FROM Producao.documento
WHERE Revisao BETWEEN 1 AND 4

--Selecione todos os produtos cujo ponto de reposi��o esteja entre 20 e 50.
SELECT * FROM Producao.Produto
WHERE PontoReposicao BETWEEN 20 AND 50

-- Selecione todos os produtos com peso que n�o esteja entre 10 e 20.
SELECT * FROM Producao.Produto
WHERE Peso NOT BETWEEN 10 AND 20

