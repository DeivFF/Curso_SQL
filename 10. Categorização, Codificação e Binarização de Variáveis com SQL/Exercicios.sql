-- Criação do banco de dados que será utilizado
CREATE DATABASE CAP_02

-- Criação da primeira tabela
CREATE TABLE TB_BREAST (
	classe VARCHAR(100) NULL,
	idade VARCHAR(45) NULL,
	menopausa VARCHAR(45) NULL,
	tamanho_tumor VARCHAR(45) NULL,
	inv_nodes VARCHAR(45) NULL,
	node_caps VARCHAR(3) NULL,
	deg_malig INT NULL,
	seio VARCHAR(5) NULL,
	quadrante VARCHAR(10) NULL,
	irradiando VARCHAR(3) NULL,
)

SELECT * FROM CAP_02.dbo.TB_BREAST

-- verificação das ocorrências na coluna 'classe' (possui 2 ocorrências)
SELECT DISTINCT(classe) FROM CAP_02.dbo.TB_BREAST

-- A coluna classe possui duas ocorrências, sendo assim, aplicamos a binarização, que consite criar uma nova coluna com valores entre 0 e 1.
SELECT CASE	
			WHEN classe='no-recurrence-events' THEN 0
			WHEN classe='recurrence-events' THEN 1
		END as classe
FROM CAP_02.dbo.TB_BREAST

-- verificação das ocorrências na coluna 'irradiando' (possui 2 ocorrências)
SELECT DISTINCT(irradiando) FROM CAP_02.dbo.TB_BREAST

-- A coluna classe possui duas ocorrências, sendo assim, aplicamos a binarização, que consite criar uma nova coluna com valores entre 0 e 1.
SELECT CASE	
			WHEN irradiando='no' THEN 0
			WHEN irradiando='yes' THEN 1
		END as irradiando
FROM CAP_02.dbo.TB_BREAST

-- Essa coluna é diferente, ela possui 3 valores, "0","1" e "null", precisamos tratar esse dado, geramos uma uma nova query com a intenção de retirar esse valores nulos
SELECT DISTINCT(node_caps) FROM CAP_02.dbo.TB_BREAST

SELECT CASE	
			WHEN node_caps='no' THEN 0
			WHEN node_caps='yes' THEN 1
			ELSE 2
		END as node_caps, node_caps
FROM CAP_02.dbo.TB_BREAST

-- Verificação das ocorrências na coluna "seio", (possui duas ocorrências).
SELECT DISTINCT(seio) FROM CAP_02.dbo.TB_BREAST

-- Categorização da coluna em valores "D" e "E"
SELECT CASE	
			WHEN seio='right' THEN 'D'
			WHEN seio='left' THEN 'E'
		END as seio
FROM CAP_02.dbo.TB_BREAST

-- Essa coluna possui 11 registros distintos, fazemos essa query para diminuiá-la, transformado-as em 6 ocorrências distintas.
SELECT CASE	
			WHEN tamanho_tumor='0-4' OR tamanho_tumor='5-9' THEN 'Muito pequeno'
			WHEN tamanho_tumor='10-14' OR tamanho_tumor='15-19' THEN 'Pequeno'
			WHEN tamanho_tumor='20-24' OR tamanho_tumor='25-29' THEN 'Médio'
			WHEN tamanho_tumor='30-34' OR tamanho_tumor='35-39' THEN 'Grande'
			WHEN tamanho_tumor='40-44' OR tamanho_tumor='45-49' THEN 'Muito grande'
			WHEN tamanho_tumor='50-54' THEN 'Tratamento urgente'
		END as tamanho_tumor, tamanho_tumor 
FROM CAP_02.dbo.TB_BREAST

-- Aplicamos a técnica "label enconding" nesta coluna.
SELECT CASE	
			WHEN quadrante='left_low'  THEN 1
			WHEN quadrante='left_up' THEN 2
			WHEN quadrante='right_low'  THEN 3
			WHEN quadrante='right_up'  THEN 4
			WHEN quadrante='central' THEN 5
		ELSE 0
		END as quadrante
FROM CAP_02.dbo.TB_BREAST

-- Agora, nossa intenção é criar  uma nova tabela com as informações anteriores, para isso, realizamos a query abaixo.
SELECT CASE	
			WHEN classe='no-recurrence-events' THEN 0
			WHEN classe='recurrence-events' THEN 1
		END as classe,
		idade, menopausa,
		CASE	
			WHEN tamanho_tumor='0-4' OR tamanho_tumor='5-9' THEN 'Muito pequeno'
			WHEN tamanho_tumor='10-14' OR tamanho_tumor='15-19' THEN 'Pequeno'
			WHEN tamanho_tumor='20-24' OR tamanho_tumor='25-29' THEN 'Médio'
			WHEN tamanho_tumor='30-34' OR tamanho_tumor='35-39' THEN 'Grande'
			WHEN tamanho_tumor='40-44' OR tamanho_tumor='45-49' THEN 'Muito grande'
			WHEN tamanho_tumor='50-54' THEN 'Tratamento urgente'
		END as tamanho_tumor,
		inv_nodes,
		CASE	
			WHEN node_caps='no' THEN 0
			WHEN node_caps='yes' THEN 1
			ELSE 3
		END as node_caps,
		deg_malig, 
		CASE	
			WHEN seio='right' THEN 'D'
			WHEN seio='left' THEN 'E'
		END as seio,
		CASE	
			WHEN quadrante='left_low'  THEN 1
			WHEN quadrante='left_up' THEN 2
			WHEN quadrante='right_low'  THEN 3
			WHEN quadrante='right_up'  THEN 4
			WHEN quadrante='central' THEN 5
		ELSE 0
		END as quadrante,
		CASE	
			WHEN irradiando='no' THEN 0
			WHEN irradiando='yes' THEN 1
		END as irradiando
INTO TB_BREAST02
FROM CAP_02.dbo.TB_BREAST

-- Verificação dos resultados.
SELECT * FROM TB_BREAST02

/* AGORA VAMOS PARA A SEGUNDA ETAPA */

--- aplicando label enconding na coluna "menopausa"
SELECT CASE	
			WHEN menopausa='premeno'  THEN 1
			WHEN menopausa='ge40'  THEN 2
			WHEN menopausa='lt40' THEN 3
		END as menopausa
FROM TB_BREAST02

-- concatenando valores da coluna inv_nodes e quadrante para criar uma nova coluna chamada  posicao_tumor.
SELECT inv_nodes + ' ' + CONVERT(VARCHAR(50),quadrante) as posicao_tumor FROM TB_BREAST02

-- o exercício atual é realizar a técnica one-hot-enconding

-- verificação das ocorrências na coluna.
SELECT DISTINCT(deg_malig) FROM TB_BREAST02

-- criação das novas colunas.
SELECT CASE	
			WHEN deg_malig='1'  THEN 1
		ELSE 0
END as deg_malig_label1 FROM TB_BREAST02

SELECT CASE	
			WHEN deg_malig='2'  THEN 1
		ELSE 0
END as deg_malig_label2 FROM TB_BREAST02

SELECT CASE	
			WHEN deg_malig='3'  THEN 1
		ELSE 0
END as deg_malig_label3 FROM TB_BREAST02

-- criação da terceira tabela resultante das queries.
SELECT 
	classe,idade,
	CASE	
		WHEN menopausa='premeno'  THEN 1
		WHEN menopausa='ge40'  THEN 2
		WHEN menopausa='lt40' THEN 3
	END as menopausa,
	tamanho_tumor, 
	inv_nodes + '-' + CONVERT(VARCHAR(10),quadrante) as posicao_tumor,
	node_caps,
	CASE	
		WHEN deg_malig='1'  THEN 1
		ELSE 0 
	END as deg_malig_label1,
	CASE	
		WHEN deg_malig='2'  THEN 1
		ELSE 0 
	END as deg_malig_label2,
	CASE	
		WHEN deg_malig='3'  THEN 1
		ELSE 0 
	END as deg_malig_label3,
	seio, quadrante,irradiando
INTO TB_BREAST03
FROM TB_BREAST02

SELECT * FROM TB_BREAST03
