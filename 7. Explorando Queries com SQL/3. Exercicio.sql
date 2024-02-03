/*O gerente de uma loja de departamentos precisa de uma lista combinada de todos os produtos vendáveis e todos os documentos aprovados
para revisão de produtos. Ele deseja ter acesso a essa lista para revisar quais produtos estão disponíveis para venda e quais documentos
foram aprovados para revisão de produtos, tudo em uma única visualização.*/
SELECT pp.IDProduto, pp.Nome, pp.PrecoLista, NULL as titulo, NULL as documento FROM Producao.Produto as pp
WHERE FlagProdutoAcabado = 1

UNION

SELECT NivelDocumento as no, null as descricao, null as preco, pd.Titulo, pd.Documento FROM producao.Documento pd
WHERE pd.FlagPasta = 1 AND pd.Status = 2

/*Um analista de dados precisa criar um relatório combinando informações sobre os modelos de produtos e as subcategorias de produtos.
Eles precisam de uma lista única que inclua os nomes dos modelos de produtos e as descrições das subcategorias de produtos para uma análise
comparativa.*/
SELECT NULL AS NULO, mp.Nome AS 'Nome modelo',NULL AS 'Descrição categoria' FROM producao.ModeloProduto mp

UNION

SELECT NULL, NULL, sp.Nome FROM producao.SubcategoriaProduto sp