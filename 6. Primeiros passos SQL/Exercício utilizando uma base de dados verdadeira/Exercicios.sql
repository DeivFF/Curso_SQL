CREATE DATABASE CAP_01


CREATE TABLE TB_NAVIO(
	nome_navio VARCHAR(50), -- Nome do Navio de Cruzeiro
	mes_ano VARCHAR(10), -- Mês e ano da inspeção realizada.
	classificacao_risco VARCHAR(15), /*Classificação de risco. A ANVISA classifica as embarcações em quatro níveis (A, B, C e D).
	• Padrão A: pontuação de risco até 150: Embarcações em excelentes condições sanitárias; • Padrão B: pontuação de risco
	entre 151 e 300: Embarcações em condições sanitárias satisfatórias; • Padrão C: pontuação de risco entre 301 e 450:
	Embarcações em condições sanitárias aceitáveis; • Padrão D: pontuação de risco acima de 450: Embarcações em condições
	sanitárias insatisfatórias com exigências a cumprir imediatamente.
	A partir da Temporada 2018/2019, quando na inspeção sanitária, for registrado um controle crítico não implementado, o navio será rebaixado para o padrão seguinte.*/
	indice_conformidade VARCHAR(15), -- Porcentagem dos itens do roteiro de inspeção que foram atendidos pela embarcação.
	pontuacao_risco INT, -- É o somatório dos valores de risco de cada item do roteiro de inspeção. A pontuação de risco está associada à ausência ou falhas dos controles (ação, medida ou dispositivo empregado para mitigação do risco). Assim, quanto mais controle não implementados a embarcação possuir, maior o risco sanitário e consequentemente a pontuação do navio.
	temporada VARCHAR(200) -- Temporada do Programa Nacional de Vigilância em Saúde para Navios de Cruzeiros. As temporadas iniciam-se em outubro e prosseguem até o mês abril do ano seguinte.
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

-- 1- Quais embarcações possuem pontuação de risco igual a 310?
SELECT nome_navio FROM CAP_01.dbo.TB_NAVIO
WHERE pontuacao_risco = '310'

-- 2- Quais embarcações têm classificação de risco A e índice de conformidade maior ou igual a 95%?
SELECT nome_navio FROM CAP_01.dbo.TB_NAVIO
WHERE classificacao_risco = 'A' AND indice_conformidade >= '95'

-- 3- Quais embarcações têm classificação de risco C ou D e índice de conformidade menor ou igual a 95%?
SELECT nome_navio FROM CAP_01.dbo.TB_NAVIO
WHERE classificacao_risco IN ('C','D') AND indice_conformidade <= '95'

-- 4- Quais embarcações têm classificação de risco A ou pontuação de risco igual a 0?
SELECT nome_navio FROM CAP_01.dbo.TB_NAVIO
WHERE classificacao_risco = 'A' OR pontuacao_risco = '0'

-- 5- Quais embarcações foram inspecionadas em Dezembro de 2016?
SELECT nome_navio FROM CAP_01.dbo.TB_NAVIO
WHERE mes_ano = '12/2016'