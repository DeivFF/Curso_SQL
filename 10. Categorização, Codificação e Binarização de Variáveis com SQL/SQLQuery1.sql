CREATE DATABASE CAP_02

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