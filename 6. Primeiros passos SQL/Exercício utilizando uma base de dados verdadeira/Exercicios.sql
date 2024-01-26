CREATE DATABASE CAP_01


CREATE TABLE TB_NAVIO(
	nome_navio VARCHAR(50), -- Nome do Navio de Cruzeiro
	mes_ano VARCHAR(10), -- M�s e ano da inspe��o realizada.
	classificacao_risco VARCHAR(15), /*Classifica��o de risco. A ANVISA classifica as embarca��es em quatro n�veis (A, B, C e D).
	� Padr�o A: pontua��o de risco at� 150: Embarca��es em excelentes condi��es sanit�rias; � Padr�o B: pontua��o de risco
	entre 151 e 300: Embarca��es em condi��es sanit�rias satisfat�rias; � Padr�o C: pontua��o de risco entre 301 e 450:
	Embarca��es em condi��es sanit�rias aceit�veis; � Padr�o D: pontua��o de risco acima de 450: Embarca��es em condi��es
	sanit�rias insatisfat�rias com exig�ncias a cumprir imediatamente.
	A partir da Temporada 2018/2019, quando na inspe��o sanit�ria, for registrado um controle cr�tico n�o implementado, o navio ser� rebaixado para o padr�o seguinte.*/
	indice_conformidade VARCHAR(15), -- Porcentagem dos itens do roteiro de inspe��o que foram atendidos pela embarca��o.
	pontuacao_risco INT, -- � o somat�rio dos valores de risco de cada item do roteiro de inspe��o. A pontua��o de risco est� associada � aus�ncia ou falhas dos controles (a��o, medida ou dispositivo empregado para mitiga��o do risco). Assim, quanto mais controle n�o implementados a embarca��o possuir, maior o risco sanit�rio e consequentemente a pontua��o do navio.
	temporada VARCHAR(200) -- Temporada do Programa Nacional de Vigil�ncia em Sa�de para Navios de Cruzeiros. As temporadas iniciam-se em outubro e prosseguem at� o m�s abril do ano seguinte.
)

SELECT * FROM CAP_01.dbo.TB_NAVIO

SELECT nome_navio, classificacao_risco, temporada FROM CAP_01.dbo.TB_NAVIO
WHERE classificacao_risco = 'D'

SELECT nome_navio, classificacao_risco, temporada FROM CAP_01.dbo.TB_NAVIO
WHERE classificacao_risco = 'D'
ORDER BY nome_navio ASC

SELECT nome_navio, classificacao_risco, temporada FROM CAP_01.dbo.TB_NAVIO
WHERE classificacao_risco = 'D' AND pontuacao_risco > 1000
ORDER BY nome_navio ASC

SELECT TOP 10 nome_navio, classificacao_risco, temporada FROM CAP_01.dbo.TB_NAVIO
WHERE classificacao_risco = 'A' 

-- 1- Quais embarca��es possuem pontua��o de risco igual a 310?
SELECT nome_navio FROM CAP_01.dbo.TB_NAVIO
WHERE pontuacao_risco = '310'

-- 2- Quais embarca��es t�m classifica��o de risco A e �ndice de conformidade maior ou igual a 95%?
SELECT nome_navio FROM CAP_01.dbo.TB_NAVIO
WHERE classificacao_risco = 'A' AND indice_conformidade >= '95'

-- 3- Quais embarca��es t�m classifica��o de risco C ou D e �ndice de conformidade menor ou igual a 95%?
SELECT nome_navio FROM CAP_01.dbo.TB_NAVIO
WHERE classificacao_risco IN ('C','D') AND indice_conformidade <= '95'

-- 4- Quais embarca��es t�m classifica��o de risco A ou pontua��o de risco igual a 0?
SELECT nome_navio FROM CAP_01.dbo.TB_NAVIO
WHERE classificacao_risco = 'A' OR pontuacao_risco = '0'

-- 5- Quais embarca��es foram inspecionadas em Dezembro de 2016?
SELECT nome_navio FROM CAP_01.dbo.TB_NAVIO
WHERE mes_ano = '12/2016'