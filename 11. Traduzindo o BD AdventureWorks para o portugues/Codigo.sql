CREATE DATABASE AdventureWorksPT

EXEC ('CREATE SCHEMA Pessoa')

SELECT AddressTypeID as IDTipoEndereco, 
		CASE Name
			 WHEN 'Billing' THEN 'Faturamento'
			 WHEN 'Home' THEN 'Residencial'
			 WHEN 'Main Office' THEN 'Escritório Principal'
			 WHEN 'Primary' THEN 'Principal'
			 WHEN 'Shipping' THEN 'Envio'
			 WHEN 'Archive' THEN 'Arquivo'
    END AS Nome, ModifiedDate as UltimaModificacao
INTO AdventureWorksPT.dbo.TipoEndereco
FROM Person.AddressType

ALTER SCHEMA Pessoa TRANSFER TipoEndereco

SELECT * FROM Person.BusinessEntity

SELECT BusinessEntityID as IDEntidadeNegocio,
	   ModifiedDate as DataModificacao 
INTO AdventureWorksPT.dbo.EntidadeNegocio
FROM Person.BusinessEntity

ALTER SCHEMA Pessoa TRANSFER EntidadeNegocio

SELECT BusinessEntityID AS IDEntidadeNegocio,
	AddressID AS IDEndereco,
    AddressTypeID AS IDTipoEndereco,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.EnderecoEntidadeNegocio
FROM Person.BusinessEntityAddress

ALTER SCHEMA Pessoa TRANSFER EnderecoEntidadeNegocio

SELECT BusinessEntityID as IDEntidadeNegocio,
	   PersonID as IDPessoa,
	   ContactTypeID as IDTipoContato,
	   ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.ContatoEntidadeNegocio
FROM Person.BusinessEntityContact

ALTER SCHEMA Pessoa TRANSFER ContatoEntidadeNegocio

SELECT StateProvinceID AS IDEstadoProvincia,
    StateProvinceCode AS CodigoEstadoProvincia,
    CountryRegionCode AS CodigoPaisRegiao,
    IsOnlyStateProvinceFlag AS EstadoProvinciaUnico,
    Name AS Nome,
    TerritoryID AS IDTerritorio,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.EstadoProvincia
FROM Person.StateProvince

SELECT CountryRegionCode AS CodigoPaisRegiao,
	CurrencyCode as CodigoMoeda,
	ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.MoedaRegiaoPais
FROM Sales.CountryRegionCurrency

EXEC ('CREATE SCHEMA Vendas')
ALTER SCHEMA Vendas TRANSFER MoedaRegiaoPais

SELECT 
    CreditCardID AS IDCreditCard,
    CardType AS TipoCartao,
    CardNumber AS NumeroCartao,
    ExpMonth AS MesExpiracao,
    ExpYear AS AnoExpiracao,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.CartaoCredito
FROM Sales.CreditCard;

ALTER SCHEMA Vendas TRANSFER CartaoCredito

SELECT 
    CurrencyCode AS CodigoMoeda,
     CASE Name
           WHEN 'Emirati Dirham' THEN 'Dirham dos Emirados Árabes Unidos'
           WHEN 'Afghani' THEN 'Afegane'
           WHEN 'Lek' THEN 'Lek Albanês'
           WHEN 'Armenian Dram' THEN 'Dram Armênio'
           WHEN 'Netherlands Antillian Guilder' THEN 'Florim das Antilhas Neerlandesas'
           WHEN 'Kwanza' THEN 'Kwanza Angolano'
           WHEN 'Argentine Peso' THEN 'Peso Argentino'
           WHEN 'Shilling' THEN 'Xelim'
           WHEN 'Australian Dollar' THEN 'Dólar Australiano'
           WHEN 'Aruban Guilder' THEN 'Florim de Aruba'
           WHEN 'Azerbaijanian Manat' THEN 'Manat Azerbaijano'
           WHEN 'Barbados Dollar' THEN 'Dólar de Barbados'
           WHEN 'Taka' THEN 'Taka'
           WHEN 'Belgian Franc' THEN 'Franco Belga'
           WHEN 'Bulgarian Lev' THEN 'Lev Búlgaro'
           WHEN 'Bahraini Dinar' THEN 'Dinar Bareinita'
           WHEN 'Brunei Dollar' THEN 'Dólar de Brunei'
           WHEN 'Boliviano' THEN 'Boliviano'
           WHEN 'Brazilian Real' THEN 'Real Brasileiro'
           WHEN 'Bahamian Dollar' THEN 'Dólar das Bahamas'
           WHEN 'Ngultrum' THEN 'Ngultrum'
           WHEN 'Canadian Dollar' THEN 'Dólar Canadense'
		   WHEN 'Swiss Franc' THEN 'Franco Suíço'
           WHEN 'Chilean Peso' THEN 'Peso Chileno'
           WHEN 'Yuan Renminbi' THEN 'Renminbi Chinês'
           WHEN 'Colombian Peso' THEN 'Peso Colombiano'
           WHEN 'Costa Rican Colon' THEN 'Colón Costarriquenho'
           WHEN 'Cyprus Pound' THEN 'Libra Cipriota'
           WHEN 'Czech Koruna' THEN 'Coroa Tcheca'
           WHEN 'Deutsche Mark' THEN 'Marco Alemão'
           WHEN 'Danish Krone' THEN 'Coroa Dinamarquesa'
           WHEN 'Dominican Peso' THEN 'Peso Dominicano'
           WHEN 'Algerian Dinar' THEN 'Dinar Argelino'
           WHEN 'Kroon' THEN 'Coroa Estoniana'
           WHEN 'Egyptian Pound' THEN 'Libra Egípcia'
           WHEN 'Spanish Peseta' THEN 'Peseta Espanhola'
           WHEN 'EURO' THEN 'Euro'
           WHEN 'Markka' THEN 'Marco Finlandês'
           WHEN 'Fiji Dollar' THEN 'Dólar Fijiano'
           WHEN 'French Franc' THEN 'Franco Francês'
           WHEN 'United Kingdom Pound' THEN 'Libra Esterlina Britânica'
           WHEN 'Cedi' THEN 'Cedi'
		    WHEN 'Drachma' THEN 'Dracma'
           WHEN 'Quetzal' THEN 'Quetzal'
           WHEN 'Hong Kong Dollar' THEN 'Dólar de Hong Kong'
           WHEN 'Croatian Kuna' THEN 'Kuna Croata'
           WHEN 'Forint' THEN 'Forint'
           WHEN 'Rupiah' THEN 'Rupia'
           WHEN 'Irish Pound' THEN 'Libra Irlandesa'
           WHEN 'New Israeli Shekel' THEN 'Novo Shekel Israelense'
           WHEN 'Indian Rupee' THEN 'Rupia Indiana'
           WHEN 'Iceland Krona' THEN 'Coroa Islandesa'
           WHEN 'Italian Lira' THEN 'Lira Italiana'
           WHEN 'Jamaican Dollar' THEN 'Dólar Jamaicano'
           WHEN 'Jordanian Dinar' THEN 'Dinar Jordano'
           WHEN 'Yen' THEN 'Iene'
           WHEN 'Kenyan Shilling' THEN 'Xelim Queniano'
           WHEN 'Won' THEN 'Won'
           WHEN 'Kuwaiti Dinar' THEN 'Dinar Kuwaitiano'
           WHEN 'Lebanese Pound' THEN 'Libra Libanesa'
           WHEN 'Sri Lankan Rupee' THEN 'Rupia do Sri Lanka'
           WHEN 'Lithuanian Litas' THEN 'Litas Lituana'
		   WHEN 'Latvian Lats' THEN 'Lats Letão'
           WHEN 'Moroccan Dirham' THEN 'Dirham Marroquino'
           WHEN 'Maltese Lira' THEN 'Lira Maltesa'
           WHEN 'Mauritius Rupee' THEN 'Rupia das Maurícias'
           WHEN 'Rufiyaa' THEN 'Rufiyaa'
           WHEN 'Mexican Peso' THEN 'Peso Mexicano'
           WHEN 'Malaysian Ringgit' THEN 'Ringgit Malaio'
           WHEN 'Namibia Dollar' THEN 'Dólar da Namíbia'
           WHEN 'Naira' THEN 'Naira'
           WHEN 'Netherlands Guilder' THEN 'Florim Neerlandês'
           WHEN 'Norwegian Krone' THEN 'Coroa Norueguesa'
           WHEN 'Nepalese Rupee' THEN 'Rupia Nepalesa'
           WHEN 'New Zealand Dollar' THEN 'Dólar da Nova Zelândia'
           WHEN 'Omani Rial' THEN 'Rial Omanense'
           WHEN 'Balboa' THEN 'Balboa'
           WHEN 'Nuevo Sol' THEN 'Nuevo Sol'
           WHEN 'Philippine Peso' THEN 'Peso Filipino'
           WHEN 'Pakistan Rupee' THEN 'Rupia Paquistanesa'
           WHEN 'Zloty' THEN 'Zloty'
           WHEN 'Polish Zloty(old)' THEN 'Zloty Polonês (antigo)'
		   WHEN 'Portuguese Escudo' THEN 'Escudo Português'
           WHEN 'Guarani' THEN 'Guarani'
           WHEN 'Leu' THEN 'Leu'
           WHEN 'Russian Ruble' THEN 'Rublo Russo'
           WHEN 'Russian Ruble(old)' THEN 'Rublo Russo (antigo)'
           WHEN 'Saudi Riyal' THEN 'Riyal Saudita'
           WHEN 'Swedish Krona' THEN 'Coroa Sueca'
           WHEN 'Singapore Dollar' THEN 'Dólar de Singapura'
           WHEN 'Tolar' THEN 'Tolar'
           WHEN 'Slovak Koruna' THEN 'Coroa Eslovaca'
           WHEN 'El Salvador Colon' THEN 'Colón de El Salvador'
           WHEN 'Baht' THEN 'Baht'
           WHEN 'Tunisian Dinar' THEN 'Dinar Tunisiano'
           WHEN 'Turkish Lira' THEN 'Lira Turca'
           WHEN 'Trinidad and Tobago Dollar' THEN 'Dólar de Trinidad e Tobago'
           WHEN 'New Taiwan Dollar' THEN 'Novo Dólar de Taiwan'
           WHEN 'US Dollar' THEN 'Dólar Americano'
           WHEN 'Uruguayan Peso' THEN 'Peso Uruguaio'
           WHEN 'Bolivar' THEN 'Bolívar'
           WHEN 'Dong' THEN 'Dong'
           WHEN 'CFA Franc BCEAO' THEN 'Franco CFA BCEAO'
           WHEN 'Rand' THEN 'Rand'
           WHEN 'Zimbabwe Dollar' THEN 'Dólar do Zimbábue'
       END AS 'Nome',
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.Moeda
FROM Sales.Currency;

ALTER SCHEMA Vendas TRANSFER Moeda

SELECT 
    CurrencyRateID AS IDTaxaCambio,
    CurrencyRateDate AS DataTaxaCambio,
    FromCurrencyCode AS CodigoMoedaOrigem,
    ToCurrencyCode AS CodigoMoedaDestino,
    AverageRate AS TaxaMedia,
    EndOfDayRate AS TaxaFinalDia,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.TaxaCambio
FROM Sales.CurrencyRate

ALTER SCHEMA Vendas TRANSFER TaxaCambio

SELECT * FROM Sales.Customer

SELECT 
    CustomerID AS IDCliente,
    PersonID AS IDPessoa,
    StoreID AS IDLoja,
    TerritoryID AS IDTerritorio,
    AccountNumber AS NumeroConta,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.Cliente
FROM Sales.Customer;

ALTER SCHEMA Vendas TRANSFER Cliente

SELECT 
    BusinessEntityID AS IDEntidadeNegocio,
    CreditCardID AS IDCreditCard,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.EntidadeCartaoCredito
FROM Sales.PersonCreditCard

ALTER SCHEMA Vendas TRANSFER EntidadeCartaoCredito

SELECT 
    SalesOrderID AS IDPedidoVenda,
    SalesOrderDetailID AS IDDetalhePedidoVenda,
    CarrierTrackingNumber AS NumeroRastreamentoTransportadora,
    OrderQty AS QuantidadePedido,
    ProductID AS IDProduto,
    SpecialOfferID AS IDOfertaEspecial,
    UnitPrice AS PrecoUnitario,
    UnitPriceDiscount AS DescontoPrecoUnitario,
    LineTotal AS TotalLinha,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.DetalhePedidoVenda
FROM Sales.SalesOrderDetail;

ALTER SCHEMA Vendas TRANSFER DetalhePedidoVenda

SELECT 
    SalesOrderID AS IDPedidoVenda,
    RevisionNumber AS NumeroRevisao,
    OrderDate AS DataPedido,
    DueDate AS DataVencimento,
    ShipDate AS DataEnvio,
    Status AS StatusPedido,
    OnlineOrderFlag AS PedidoOnline,
    SalesOrderNumber AS NumeroPedidoVenda,
    PurchaseOrderNumber AS NumeroOrdemCompra,
    AccountNumber AS NumeroConta,
    CustomerID AS IDCliente,
    SalesPersonID AS IDSolicitanteVenda,
    TerritoryID AS IDTerritorio,
    BillToAddressID AS IDEnderecoFaturamento,
    ShipToAddressID AS IDEnderecoEntrega,
    ShipMethodID AS IDMetodoEntrega,
    CreditCardID AS IDCreditCard,
    CreditCardApprovalCode AS CodigoAprovacaoCartao,
    CurrencyRateID AS IDTaxaCambio,
    SubTotal AS Subtotal,
    TaxAmt AS ValorImposto,
    Freight AS Frete,
    TotalDue AS TotalDevido,
    Comment AS Comentario,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.PedidoVenda
FROM Sales.SalesOrderHeader;

ALTER SCHEMA Vendas TRANSFER PedidoVenda

SELECT 
    SalesOrderID AS IDPedidoVenda,
    SalesReasonID AS IDMotivoPedidoVenda,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.MotivoPedidoVenda
FROM Sales.SalesOrderHeaderSalesReason

ALTER SCHEMA Vendas TRANSFER MotivoPedidoVenda

SELECT 
    BusinessEntityID AS IDEntidadeNegocio,
    TerritoryID AS IDTerritorio,
    SalesQuota AS MetaVendasAnual,
    Bonus AS Bonus,
    CommissionPct AS PercentualComissao,
    SalesYTD AS VendasAnoAtualAcumulado,
    SalesLastYear AS VendasAnoPassado,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.Vendedor
FROM Sales.SalesPerson

ALTER SCHEMA Vendas TRANSFER Vendedor

SELECT 
    BusinessEntityID AS IDVendedor,
    QuotaDate AS DataCotaVendas,
    SalesQuota AS CotaVendas,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.CotaVendas
FROM Sales.SalesPersonQuotaHistory;

ALTER SCHEMA Vendas TRANSFER CotaVendas

SELECT 
    SalesReasonID AS IDMotivoVenda,
    CASE Name
           WHEN 'Price' THEN 'Preço'
           WHEN 'On Promotion' THEN 'Em Promoção'
           WHEN 'Magazine Advertisement' THEN 'Anúncio em Revista'
           WHEN 'Television Advertisement' THEN 'Anúncio na Televisão'
           WHEN 'Manufacturer' THEN 'Fabricante'
           WHEN 'Review' THEN 'Avaliação'
           WHEN 'Demo Event' THEN 'Evento de Demonstração'
           WHEN 'Sponsorship' THEN 'Patrocínio'
           WHEN 'Quality' THEN 'Qualidade'
           WHEN 'Other' THEN 'Outro'
       END AS Nome,
    ReasonType AS TipoMotivo,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.MotivoVenda
FROM Sales.SalesReason;

ALTER SCHEMA Vendas TRANSFER MotivoVenda

SELECT 
    SalesTaxRateID AS IDTaxaImpostoVenda,
    StateProvinceID AS IDEstadoProvincia,
    TaxType AS TipoImposto,
    TaxRate AS TaxaImposto,
    CASE name
           WHEN 'Arizona State Sales Tax' THEN 'Imposto sobre Vendas do Estado do Arizona'
           WHEN 'California State Sales Tax' THEN 'Imposto sobre Vendas do Estado da Califórnia'
           WHEN 'Canadian GST' THEN 'GST Canadense'
           WHEN 'Canadian GST + Alberta Provincial Tax' THEN 'GST Canadense + Imposto Provincial de Alberta'
           WHEN 'Canadian GST + Ontario Provincial Tax' THEN 'GST Canadense + Imposto Provincial de Ontario'
           WHEN 'Canadian GST + Quebec Provincial Tax' THEN 'GST Canadense + Imposto Provincial de Quebec'
           WHEN 'Florida State Sales Tax' THEN 'Imposto sobre Vendas do Estado da Flórida'
           WHEN 'France Output Tax' THEN 'Imposto de Saída da França'
           WHEN 'Germany Output Tax' THEN 'Imposto de Saída da Alemanha'
           WHEN 'Massachusetts State Sales Tax' THEN 'Imposto sobre Vendas do Estado de Massachusetts'
           WHEN 'Michigan State Sales Tax' THEN 'Imposto sobre Vendas do Estado de Michigan'
           WHEN 'Minnesota State Sales Tax' THEN 'Imposto sobre Vendas do Estado de Minnesota'
           WHEN 'Taxable Supply' THEN 'Fornecimento Tributável'
           WHEN 'Tennessee State Sales Tax' THEN 'Imposto sobre Vendas do Estado do Tennessee'
           WHEN 'Texas State Sales Tax' THEN 'Imposto sobre Vendas do Estado do Texas'
           WHEN 'United Kingdom Output Tax' THEN 'Imposto de Saída do Reino Unido'
           WHEN 'Utah State Sales Tax' THEN 'Imposto sobre Vendas do Estado de Utah'
           WHEN 'Washington State Sales Tax' THEN 'Imposto sobre Vendas do Estado de Washington'
           ELSE 'Desconhecido'
       END Nome,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.TaxaImpostoVenda
FROM Sales.SalesTaxRate

ALTER SCHEMA Vendas TRANSFER TaxaImpostoVenda

SELECT 
    TerritoryID AS IDTerritorioVendas,
    CASE Name
           WHEN 'Australia' THEN 'Austrália'
           WHEN 'Canada' THEN 'Canadá'
           WHEN 'Central' THEN 'Central'
           WHEN 'France' THEN 'França'
           WHEN 'Germany' THEN 'Alemanha'
           WHEN 'Northeast' THEN 'Nordeste'
           WHEN 'Northwest' THEN 'Noroeste'
           WHEN 'Southeast' THEN 'Sudeste'
           WHEN 'Southwest' THEN 'Sudoeste'
           WHEN 'United Kingdom' THEN 'Reino Unido'
       END AS Nome,
    CountryRegionCode AS CodigoPaisRegiao,
    CASE [Group]
           WHEN 'North America' THEN 'América do Norte'
           WHEN 'Europe' THEN 'Europa'
           WHEN 'Pacific' THEN 'Pacífico'
       END AS [Group],
    SalesYTD AS VendasAnoAtual,
    SalesLastYear AS VendasAnoPassado,
    CostYTD AS CustosAnoAtual,
    CostLastYear AS CustosAnoPassado,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.TerritorioVendas
FROM Sales.SalesTerritory

ALTER SCHEMA Vendas TRANSFER TerritorioVendas

SELECT 
    BusinessEntityID AS IDRepresentanteVendas,
    TerritoryID AS IDTerritorio,
    StartDate AS DataInicio,
    EndDate AS DataFim,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.RepresentanteTerritorio
FROM Sales.SalesTerritoryHistory;

ALTER SCHEMA Vendas TRANSFER RepresentanteTerritorio

SELECT 
    ShoppingCartItemID AS IDItemCarrinhoCompras,
    ShoppingCartID AS IDCarrinhoCompras,
    Quantity AS Quantidade,
    ProductID AS IDProduto,
    DateCreated AS DataCriacao,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.ItemCarrinhoCompras
FROM Sales.ShoppingCartItem

ALTER SCHEMA Vendas TRANSFER ItemCarrinhoCompras

SELECT 
    SpecialOfferID AS IDOfertaEspecial,
    CASE Description
           WHEN 'Half-Price Pedal Sale' THEN 'Venda de Pedal com 50% de Desconto'
           WHEN 'LL Road Frame Sale' THEN 'Venda de Quadro de Estrada LL'
           WHEN 'Mountain Tire Sale' THEN 'Venda de Pneu de Montanha'
           WHEN 'Mountain-100 Clearance Sale' THEN 'Venda de Liquidação Mountain-100'
           WHEN 'Mountain-500 Silver Clearance Sale' THEN 'Venda de Liquidação Mountain-500 Silver'
           WHEN 'No Discount' THEN 'Sem Desconto'
           WHEN 'Road-650 Overstock' THEN 'Excesso de Estoque Road-650'
           WHEN 'Sport Helmet Discount-2002' THEN 'Desconto em Capacete Esportivo-2002'
           WHEN 'Sport Helmet Discount-2003' THEN 'Desconto em Capacete Esportivo-2003'
           WHEN 'Touring-1000 Promotion' THEN 'Promoção Touring-1000'
           WHEN 'Touring-3000 Promotion' THEN 'Promoção Touring-3000'
           WHEN 'Volume Discount 11 to 14' THEN 'Desconto por Volume de 11 a 14'
           WHEN 'Volume Discount 15 to 24' THEN 'Desconto por Volume de 15 a 24'
           WHEN 'Volume Discount 25 to 40' THEN 'Desconto por Volume de 25 a 40'
           WHEN 'Volume Discount 41 to 60' THEN 'Desconto por Volume de 41 a 60'
           WHEN 'Volume Discount over 60' THEN 'Desconto por Volume acima de 60'
           ELSE 'Desconhecido'
	END As Descricao,
    DiscountPct AS PercentualDesconto,
    CASE Type
           WHEN 'Discontinued Product' THEN 'Produto Descontinuado'
           WHEN 'Excess Inventory' THEN 'Inventário Excedente'
           WHEN 'New Product' THEN 'Novo Produto'
           WHEN 'No Discount' THEN 'Sem Desconto'
           WHEN 'Seasonal Discount' THEN 'Desconto Sazonal'
           WHEN 'Volume Discount' THEN 'Desconto por Volume'
           ELSE 'Desconhecido'
       END AS Tipo,
    CASE Category
           WHEN 'Customer' THEN 'Cliente'
           WHEN 'No Discount' THEN 'Sem Desconto'
           WHEN 'Reseller' THEN 'Revendedor'
           ELSE 'Desconhecido'
       END AS Categoria,
    StartDate AS DataInicio,
    EndDate AS DataFim,
    MinQty AS QuantidadeMinima,
    MaxQty AS QuantidadeMaxima,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.OfertaEspecial
FROM Sales.SpecialOffer

ALTER SCHEMA Vendas TRANSFER OfertaEspecial

SELECT 
    SpecialOfferID AS IDOfertaEspecial,
    ProductID AS IDProduto,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.OfertaEspecialProduto
FROM Sales.SpecialOfferProduct

ALTER SCHEMA Vendas TRANSFER OfertaEspecialProduto




SELECT 
    BusinessEntityID AS IDEntidadeNegocio,
	CASE Name
           WHEN 'A Bicycle Association' THEN 'Associação de Bicicletas'
           WHEN 'A Bike Store' THEN 'Loja de Bicicletas'
           WHEN 'A Cycle Shop' THEN 'Loja de Ciclos'
           WHEN 'A Great Bicycle Company' THEN 'Uma Grande Empresa de Bicicletas'
           WHEN 'A Typical Bike Shop' THEN 'Uma Loja de Bicicletas Típica'
           WHEN 'Acceptable Sales & Service' THEN 'Vendas e Serviços Aceitáveis'
           WHEN 'Accessories Network' THEN 'Rede de Acessórios'
           WHEN 'Acclaimed Bicycle Company' THEN 'Empresa de Bicicletas Reconhecida'
           WHEN 'Ace Bicycle Supply' THEN 'Fornecimento de Bicicletas Ace'
           WHEN 'Action Bicycle Specialists' THEN 'Especialistas em Bicicletas de Ação'
           WHEN 'Active Cycling' THEN 'Ciclismo Ativo'
           WHEN 'Active Life Toys' THEN 'Brinquedos para Vida Ativa'
           WHEN 'Active Systems' THEN 'Sistemas Ativos'
           WHEN 'Active Transport Inc.' THEN 'Transporte Ativo Inc.'
           WHEN 'Activity Center' THEN 'Centro de Atividades'
           WHEN 'Advanced Bike Components' THEN 'Componentes Avançados de Bicicletas'
           WHEN 'Aerobic Exercise Company' THEN 'Empresa de Exercícios Aeróbicos'
           WHEN 'Affordable Sports Equipment' THEN 'Equipamento Esportivo Acessível'
           WHEN 'All Cycle Shop' THEN 'Todas as Lojas de Ciclos'
           WHEN 'All Seasons Sports Supply' THEN 'Fornecimento de Esportes para Todas as Estações'
           WHEN 'Alpine Ski House' THEN 'Casa de Esqui Alpino'
           WHEN 'Alternative Vehicles' THEN 'Veículos Alternativos'
           WHEN 'Amalgamated Parts Shop' THEN 'Loja de Peças Amalgamadas'
           WHEN 'Another Bicycle Company' THEN 'Outra Empresa de Bicicletas'
           WHEN 'Another Sporting Goods Company' THEN 'Outra Empresa de Artigos Esportivos'
           WHEN 'Area Bike Accessories' THEN 'Acessórios de Bicicleta da Região'
           WHEN 'Area Sheet Metal Supply' THEN 'Fornecimento de Chapas da Região'
           WHEN 'Associated Bikes' THEN 'Bicicletas Associadas'
           WHEN 'Atypical Bike Company' THEN 'Empresa de Bicicletas Atípica'
           WHEN 'Authentic Sales and Service' THEN 'Vendas e Serviços Autênticos'
	       WHEN 'Authorized Bike Sales and Rental' THEN 'Vendas e Locação Autorizadas de Bicicletas'
           WHEN 'Basic Bike Company' THEN 'Empresa Básica de Bicicletas'
           WHEN 'Basic Sports Equipment' THEN 'Equipamentos Esportivos Básicos'
           WHEN 'Beneficial Exercises and Activities' THEN 'Exercícios e Atividades Beneficiais'
           WHEN 'Best Cycle Store' THEN 'Melhor Loja de Bicicletas'
           WHEN 'Best Bikes' THEN 'Melhores Bicicletas'
           WHEN 'Better Bike Shop' THEN 'Loja de Bicicletas Melhor'
           WHEN 'Bicycle Accessories and Kits' THEN 'Acessórios e Kits de Bicicleta'
           WHEN 'Bicycle Exporters' THEN 'Exportadores de Bicicleta'
           WHEN 'Bicycle Lines Distributors' THEN 'Distribuidores de Linhas de Bicicleta'
           WHEN 'Bicycle Merchandise Warehouse' THEN 'Armazém de Mercadorias de Bicicleta'
           WHEN 'Bicycle Outfitters' THEN 'Equipamentos para Bicicletas'
           WHEN 'Bicycle Warehouse Inc.' THEN 'Armazém de Bicicletas Inc.'
           WHEN 'Big Cycle Mall' THEN 'Grande Shopping de Bicicletas'
           WHEN 'Big-[Time] Bike Store' THEN 'Loja de Bicicletas de Alto Padrão'
           WHEN 'Bike Boutique' THEN 'Boutique de Bicicletas'
           WHEN 'Bike Dealers Association' THEN 'Associação de Revendedores de Bicicletas'
           WHEN 'Bike Experts' THEN 'Especialistas em Bicicletas'
           WHEN 'Bike Goods' THEN 'Bens de Bicicleta'
           WHEN 'Bike Part Wholesalers' THEN 'Atacadistas de Peças de Bicicleta'
           WHEN 'Bike Products and Accessories' THEN 'Produtos e Acessórios para Bicicletas'
           WHEN 'Bike Rims Company' THEN 'Empresa de Aros para Bicicletas'
           WHEN 'Bike Universe' THEN 'Universo da Bicicleta'
           WHEN 'Bike World' THEN 'Mundo das Bicicletas'
           WHEN 'Bikes and Motorbikes' THEN 'Bicicletas e Motocicletas'
           WHEN 'Bikes Anyone?' THEN 'Bicicletas para Todos?'
           WHEN 'Bikes for Kids and Adults' THEN 'Bicicletas para Crianças e Adultos'
           WHEN 'Bikes for Two' THEN 'Bicicletas para Dois'
           WHEN 'Black Bicycle Company' THEN 'Empresa de Bicicletas Pretas'
           WHEN 'Blue Bicycle Company' THEN 'Empresa de Bicicletas Azuis'
           WHEN 'Blue-Ribbon Bike Company' THEN 'Empresa de Bicicletas de Fita Azul'
           WHEN 'Bold Bike Accessories' THEN 'Acessórios de Bicicleta Ousados'
           WHEN 'Brakes and Gears' THEN 'Freios e Engrenagens'
           WHEN 'Brand New Bikes' THEN 'Bicicletas Novas'
		   WHEN 'Brightwork Company' THEN 'Empresa de Trabalhos Brilhantes'
           WHEN 'Brown Bicycle Company' THEN 'Empresa de Bicicletas Marrons'
           WHEN 'Budget Bike Company' THEN 'Empresa de Bicicletas Econômicas'
           WHEN 'Budget Toy Store' THEN 'Loja de Brinquedos Econômicos'
           WHEN 'Bulk Discount Store' THEN 'Loja de Descontos em Atacado'
           WHEN 'Camping and Sports Store' THEN 'Loja de Camping e Esportes'
           WHEN 'Capable Sales and Service' THEN 'Vendas e Serviços Capazes'
           WHEN 'Capital Riding Supplies' THEN 'Suprimentos para Passeios na Capital'
           WHEN 'Cash & Carry Bikes' THEN 'Bicicletas em Dinheiro e Carregar'
           WHEN 'Casual Bicycle Store' THEN 'Loja de Bicicletas Casual'
           WHEN 'Catalog Store' THEN 'Loja de Catálogo'
           WHEN 'Center Cycle Shop' THEN 'Loja de Ciclos Central'
           WHEN 'Central Bicycle Specialists' THEN 'Especialistas em Bicicletas Central'
           WHEN 'Central Discount Store' THEN 'Loja de Descontos Central'
           WHEN 'Certified Bicycle Supply' THEN 'Fornecimento de Bicicletas Certificado'
           WHEN 'Certified Sports Supply' THEN 'Fornecimento de Esportes Certificado'
           WHEN 'Chain and Chain Tool Distributions' THEN 'Distribuições de Corrente e Ferramentas de Corrente'
           WHEN 'Channel Outlet' THEN 'Saída de Canal'
           WHEN 'Chic Department Stores' THEN 'Lojas de Departamento Chic'
           WHEN 'City Cycling' THEN 'Ciclismo na Cidade'
           WHEN 'City Manufacturing' THEN 'Manufatura na Cidade'
           WHEN 'Citywide Service and Repair' THEN 'Serviço e Reparo em Toda a Cidade'
           WHEN 'Clamps & Brackets Co.' THEN 'Empresa de Grampos e Suportes'
           WHEN 'Classic Cycle Store' THEN 'Loja de Ciclos Clássicos'
           WHEN 'Client Discount Store' THEN 'Loja de Descontos para Clientes'
           WHEN 'Closeout Boutique' THEN 'Boutique de Liquidação'
           WHEN 'Closest Bicycle Store' THEN 'Loja de Bicicletas Mais Próxima'
           WHEN 'Coalition Bike Company' THEN 'Empresa de Bicicletas da Coalizão'
           WHEN 'Coho Sports' THEN 'Esportes Coho'
           WHEN 'Commendable Bikes' THEN 'Bicicletas Elogiáveis'
           WHEN 'Commerce Bicycle Specialists' THEN 'Especialistas em Bicicletas Comerciais'
           WHEN 'Commercial Sporting Goods' THEN 'Artigos Esportivos Comerciais'
           WHEN 'Community Department Stores' THEN 'Lojas de Departamento Comunitárias'
           WHEN 'Commuter Bicycle Store' THEN 'Loja de Bicicletas para Comutar'
           WHEN 'Consolidated Messenger' THEN 'Mensageiro Consolidado'
           WHEN 'Consolidated Sales' THEN 'Vendas Consolidadas'
           WHEN 'Consumer Equipment' THEN 'Equipamento do Consumidor'
           WHEN 'Contoso, Ltd.' THEN 'Contoso, Ltda.'
		   WHEN 'Convenient Bike Shop' THEN 'Loja de Bicicletas Conveniente'
           WHEN 'Convenient Sales and Service' THEN 'Vendas e Serviços Convenientes'
           WHEN 'Corner Bicycle Supply' THEN 'Fornecimento de Bicicletas de Esquina'
           WHEN 'Country Parts Shop' THEN 'Loja de Peças de Campo'
           WHEN 'Countryside Company' THEN 'Empresa do Interior'
           WHEN 'Courteous Bicycle Specialists' THEN 'Especialistas em Bicicletas Corteses'
           WHEN 'Cross-Country Riding Supplies' THEN 'Suprimentos para Passeios Cross-Country'
           WHEN 'Cross-town Parts Shop' THEN 'Loja de Peças de Cidade Cruzada'
           WHEN 'Curbside Sporting Goods' THEN 'Artigos Esportivos à Beira da Calçada'
           WHEN 'Curbside Universe' THEN 'Universo à Beira da Calçada'
           WHEN 'Custom Accessories Company' THEN 'Empresa de Acessórios Personalizados'
           WHEN 'Custom Sales and Service' THEN 'Vendas e Serviços Personalizados'
           WHEN 'Cycle Clearance' THEN 'Liquidação de Ciclos'
           WHEN 'Cycle Merchants' THEN 'Comerciantes de Ciclos'
           WHEN 'Cycle Parts and Accessories' THEN 'Peças e Acessórios de Ciclo'
           WHEN 'Cycles and Scooters' THEN 'Ciclos e Patinetes'
           WHEN 'Cycles Sales and Repair' THEN 'Vendas e Reparo de Ciclos'
           WHEN 'Cycles Wholesaler & Mfg.' THEN 'Atacado e Fabricação de Ciclos'
           WHEN 'Cycling Goods' THEN 'Artigos para Ciclismo'
           WHEN 'Daring Rides' THEN 'Passeios Ousados'
           WHEN 'Demand Distributors' THEN 'Distribuidores de Demanda'
           WHEN 'Designated Distributors' THEN 'Distribuidores Designados'
           WHEN 'Designer Department Stores' THEN 'Lojas de Departamento de Designer'
           WHEN 'Discount Bicycle Specialists' THEN 'Especialistas em Bicicletas com Desconto'
           WHEN 'Discount Tours' THEN 'Passeios com Desconto'
           WHEN 'Distance Bikes' THEN 'Bicicletas de Distância'
           WHEN 'Distant Inn' THEN 'Pousada Distante'
           WHEN 'Distinctive Cycles Sales & Service' THEN 'Vendas e Serviços de Ciclos Distintivos'
           WHEN 'Distinctive Store' THEN 'Loja Distintiva'
           WHEN 'District Mall' THEN 'Shopping do Distrito'
           WHEN 'Downhill Bicycle Specialists' THEN 'Especialistas em Bicicletas de Downhill'
           WHEN 'Downtown Hotel' THEN 'Hotel no Centro'
           WHEN 'Eastside Cycle Shop' THEN 'Loja de Bicicletas Leste'
           WHEN 'Eastside Department Store' THEN 'Loja de Departamento Leste'
           WHEN 'Eastside Parts Shop' THEN 'Loja de Peças Leste'
           WHEN 'Eastside Sporting Goods' THEN 'Artigos Esportivos Leste'
           WHEN 'Eastward Bike Accessories' THEN 'Acessórios de Bicicleta para Leste'
           WHEN 'eCommerce Bikes' THEN 'Bicicletas de Comércio Eletrônico'
           WHEN 'Economic Parts Supply' THEN 'Fornecimento Econômico de Peças'
           WHEN 'Economy Bikes Company' THEN 'Empresa de Bicicletas Econômicas'
           WHEN 'Economy Center' THEN 'Centro Econômico'
           WHEN 'Educational Services' THEN 'Serviços Educacionais'
           WHEN 'Efficient Cycling' THEN 'Ciclismo Eficiente'
           WHEN 'Eighth Bike Store' THEN 'Oitava Loja de Bicicletas'
           WHEN 'Eighty Toy Stores' THEN 'Oitenta Lojas de Brinquedos'
           WHEN 'Elemental Sporting Goods' THEN 'Artigos Esportivos Elementares'
           WHEN 'Eleventh Bike Store' THEN 'Décima Primeira Loja de Bicicletas'
		   WHEN 'Elite Bikes' THEN 'Bicicletas de Elite'
           WHEN 'Endurance Bikes' THEN 'Bicicletas de Resistência'
           WHEN 'Engineered Bike Systems' THEN 'Sistemas de Bicicletas Projetadas'
           WHEN 'Enterprise Center' THEN 'Centro Empresarial'
           WHEN 'Essential Bike Works' THEN 'Trabalhos Essenciais de Bicicleta'
           WHEN 'Every Bike Shop' THEN 'Toda Loja de Bicicletas'
           WHEN 'Excellent Bikes' THEN 'Excelentes Bicicletas'
           WHEN 'Excellent Riding Supplies' THEN 'Excelentes Suprimentos para Passeios'
           WHEN 'Exceptional Cycle Services' THEN 'Serviços de Ciclo Excepcionais'
           WHEN 'Exchange Parts Inc.' THEN 'Troca de Peças Inc.'
           WHEN 'Exclusive Bicycle Mart' THEN 'Mercado Exclusivo de Bicicletas'
           WHEN 'Executive Discount Store' THEN 'Loja de Descontos Executivos'
           WHEN 'Executive Gift Store' THEN 'Loja de Presentes Executivos'
           WHEN 'Exemplary Cycles' THEN 'Ciclos Exemplares'
           WHEN 'Exercise Center' THEN 'Centro de Exercícios'
           WHEN 'Exertion Activities Club' THEN 'Clube de Atividades de Exercícios'
           WHEN 'Exhibition Showroom' THEN 'Showroom de Exibição'
           WHEN 'Exhilarating Cycles' THEN 'Ciclos Exaltantes'
           WHEN 'Exotic Bikes' THEN 'Bicicletas Exóticas'
           WHEN 'Expert Cycle Store' THEN 'Loja de Ciclos Especialista'
           WHEN 'Expert Sports Store' THEN 'Loja de Esportes Especialista'
           WHEN 'Express Bike Services' THEN 'Serviços Rápidos de Bicicleta'
           WHEN 'Extended Bike Sales' THEN 'Vendas de Bicicleta Estendidas'
           WHEN 'Extended Tours' THEN 'Passeios Estendidos'
           WHEN 'Extraordinary Bike Works' THEN 'Trabalhos Extraordinários de Bicicleta'
           WHEN 'Extras Sporting Goods' THEN 'Artigos Esportivos Extras'
           WHEN 'Extreme Riding Supplies' THEN 'Suprimentos para Passeios Extremos'
           WHEN 'Extreme Toy Store' THEN 'Loja de Brinquedos Extremos'
           WHEN 'Fabrikam Inc., East' THEN 'Fabrikam Inc., Leste'
           WHEN 'Fabrikam Inc., West' THEN 'Fabrikam Inc., Oeste'
           WHEN 'Fad Outlet' THEN 'Outlet de Moda Passageira'
           WHEN 'Family Cycle Store' THEN 'Loja de Ciclos Familiar'
           WHEN 'Family Entertainment Center' THEN 'Centro de Entretenimento Familiar'
           WHEN 'Familys Favorite Bike Shop' THEN 'Loja de Bicicletas Favorita da Família'
           WHEN 'Famous Bike Sales and Service' THEN 'Vendas e Serviços de Bicicletas Famosas'
           WHEN 'Famous Bike Shop' THEN 'Loja de Bicicletas Famosa'
           WHEN 'Farthermost Bike Shop' THEN 'Loja de Bicicletas Mais Distante'
           WHEN 'Farthest Bike Store' THEN 'Loja de Bicicletas Mais Distante'
           WHEN 'Fashionable Bikes and Accessories' THEN 'Bicicletas e Acessórios Fashion'
           WHEN 'Fashionable Department Stores' THEN 'Lojas de Departamento Fashion'
           WHEN 'Fast Bike Works' THEN 'Trabalhos Rápidos de Bicicleta'
           WHEN 'Fast Services' THEN 'Serviços Rápidos'
           WHEN 'Fasteners & Bolts Outlet' THEN 'Outlet de Fixadores e Parafusos'
           WHEN 'Favorite Toy Distributor' THEN 'Distribuidor de Brinquedos Favorito'
           WHEN 'Field Trip Inc' THEN 'Excursão ao Campo Inc'
           WHEN 'Field Trip Store' THEN 'Loja de Excursão ao Campo'
           WHEN 'Fifth Bike Store' THEN 'Quinta Loja de Bicicletas'
           WHEN 'Finer Cycle Shop' THEN 'Loja de Ciclos Mais Fina'
           WHEN 'Finer Mart' THEN 'Mercado Mais Fino'
           WHEN 'Finer Parts Shop' THEN 'Loja de Peças Mais Fina'
           WHEN 'Finer Riding Supplies' THEN 'Suprimentos para Passeios Mais Finos'
           WHEN 'Finer Sales and Service' THEN 'Vendas e Serviços Mais Finos'
           WHEN 'Finer Sporting Goods' THEN 'Artigos Esportivos Mais Finos'
           WHEN 'Finish and Sealant Products' THEN 'Produtos de Acabamento e Selante'
           WHEN 'Finished Parts Shop' THEN 'Loja de Peças Acabadas'
           WHEN 'First Bike Store' THEN 'Primeira Loja de Bicicletas'
           WHEN 'First Center' THEN 'Primeiro Centro'
           WHEN 'First Cycle Store' THEN 'Primeira Loja de Ciclos'
           WHEN 'First Department Stores' THEN 'Primeiras Lojas de Departamento'
           WHEN 'First Supplies' THEN 'Primeiros Suprimentos'
           WHEN 'First-Rate Outlet' THEN 'Outlet de Primeira Classe'
           WHEN 'Fitness Bike Accessories' THEN 'Acessórios de Bicicleta Fitness'
           WHEN 'Fitness Cycling' THEN 'Ciclismo Fitness'
           WHEN 'Fitness Department Stores' THEN 'Lojas de Departamento Fitness'
           WHEN 'Fitness Discount Store' THEN 'Loja de Desconto Fitness'
           WHEN 'Fitness Hotel' THEN 'Hotel Fitness'
           WHEN 'Fitness Sport Boutique' THEN 'Boutique de Esportes Fitness'
           WHEN 'Fitness Supplies' THEN 'Suprimentos'
		   WHEN 'Fitness Toy Store' THEN 'Loja de Brinquedos Fitness'
           WHEN 'Fitness Toys' THEN 'Brinquedos Fitness'
           WHEN 'Flawless Bike Shop' THEN 'Loja de Bicicletas Impecável'
           WHEN 'Fleet Bikes' THEN 'Frota de Bicicletas'
           WHEN 'Fourth Bike Store' THEN 'Quarta Loja de Bicicletas'
           WHEN 'Friendly Bike Shop' THEN 'Loja de Bicicletas Amigável'
           WHEN 'Friendly Neighborhood Bikes' THEN 'Bicicletas do Bairro Amigável'
           WHEN 'Front Runner Bikes' THEN 'Bicicletas da Frente'
           WHEN 'Front Sporting Goods' THEN 'Artigos Esportivos da Frente'
           WHEN 'Frugal Bike Shop' THEN 'Loja de Bicicletas Econômica'
           WHEN 'Full Sports Supply' THEN 'Fornecimento Completo de Artigos Esportivos'
           WHEN 'Full-Service Bike Store' THEN 'Loja de Bicicletas com Serviço Completo'
           WHEN 'Fun Times Club' THEN 'Clube dos Tempos Divertidos'
           WHEN 'Fun Toys and Bikes' THEN 'Brinquedos e Bicicletas Divertidos'
           WHEN 'Functional Store North' THEN 'Loja Funcional Norte'
           WHEN 'Functional Store South' THEN 'Loja Funcional Sul'
           WHEN 'Future Bikes' THEN 'Bicicletas do Futuro'
           WHEN 'Futuristic Bikes' THEN 'Bicicletas Futurísticas'
           WHEN 'Futuristic Sport Distributors' THEN 'Distribuidores de Esportes Futurísticos'
           WHEN 'Games and Sport Supply Company' THEN 'Empresa de Fornecimento de Jogos e Esportes'
           WHEN 'Gasless Cycle Shop' THEN 'Loja de Bicicletas sem Gás'
           WHEN 'Gears and Parts Company' THEN 'Empresa de Engrenagens e Peças'
           WHEN 'Gear-Shift Bikes Limited' THEN 'Bicicletas Limitadas de Mudança de Marcha'
           WHEN 'General Associates' THEN 'Associados Gerais'
           WHEN 'General Bike Corporation' THEN 'Corporação de Bicicletas Gerais'
           WHEN 'General Cycle Storehouse' THEN 'Depósito de Bicicletas Gerais'
           WHEN 'General Department Stores' THEN 'Lojas de Departamento Gerais'
           WHEN 'General Industries' THEN 'Indústrias Gerais'
           WHEN 'General Riding Supplies' THEN 'Suprimentos Gerais para Passeios'
           WHEN 'General Supplies' THEN 'Suprimentos Gerais'
           WHEN 'Genial Bike Associates' THEN 'Associados de Bicicletas Geniais'
           WHEN 'Genuine Bike Shop' THEN 'Loja de Bicicletas Genuínas'
           WHEN 'Getaway Inn' THEN 'Pousada de Fuga'
           WHEN 'Gift and Toy Store' THEN 'Loja de Presentes e Brinquedos'
           WHEN 'Global Bike Retailers' THEN 'Varejistas Globais de Bicicletas'
           WHEN 'Global Plaza' THEN 'Plaza Global'
           WHEN 'Global Sporting Goods' THEN 'Artigos Esportivos Globais'
           WHEN 'Global Sports Outlet' THEN 'Outlet de Esportes Globais'
           WHEN 'Glossy Bikes' THEN 'Bicicletas Brilhantes'
           WHEN 'Go-cart and Bike Specialists' THEN 'Especialistas em Go-Kart e Bicicletas'
           WHEN 'Golf and Cycle Store' THEN 'Loja de Golfe e Bicicletas'
           WHEN 'Good Bicycle Store' THEN 'Boa Loja de Bicicletas'
           WHEN 'Good Bike Shop' THEN 'Boa Loja de Bicicletas'
           WHEN 'Good Toys' THEN 'Bons Brinquedos'
           WHEN 'Grand Bicycle Stores' THEN 'Grandes Lojas de Bicicletas'
           WHEN 'Grand Cycle Store' THEN 'Grande Loja de Ciclos'
           WHEN 'Grand Discount Store' THEN 'Grande Loja de Descontos'
           WHEN 'Grand Industries' THEN 'Grandes Indústrias'
           WHEN 'Grand Sport Boutique' THEN 'Boutique de Grandes Esportes'
           WHEN 'Grease and Oil Products Company' THEN 'Empresa de Produtos de Graxa e Óleo'
		   WHEN 'Great Bicycle Supply' THEN 'Grande Fornecimento de Bicicletas'
           WHEN 'Great Bikes' THEN 'Grandes Bicicletas'
           WHEN 'Greater Bike Store' THEN 'Loja de Bicicletas Maior'
           WHEN 'Grown-up Bike Store' THEN 'Loja de Bicicletas para Adultos'
           WHEN 'Guaranteed Sales and Service' THEN 'Vendas e Serviços Garantidos'
           WHEN 'Handy Bike Services' THEN 'Serviços de Bicicleta Práticos'
           WHEN 'Hardware Components' THEN 'Componentes de Hardware'
           WHEN 'Health Spa, Limited' THEN 'Spa de Saúde, Limitado'
           WHEN 'Healthy Activity Store' THEN 'Loja de Atividades Saudáveis'
           WHEN 'Helmets and Cycles' THEN 'Capacetes e Bicicletas'
           WHEN 'Helpful Sales and Repair Service' THEN 'Serviço de Vendas e Reparo Útil'
           WHEN 'Hiatus Bike Tours' THEN 'Passeios de Bicicleta em Hiato'
           WHEN 'Highway Bike Shop' THEN 'Loja de Bicicletas da Rodovia'
           WHEN 'Historic Bicycle Sales' THEN 'Vendas de Bicicletas Históricas'
           WHEN 'Hobby Store' THEN 'Loja de Hobbies'
           WHEN 'Home Town Bike Store' THEN 'Loja de Bicicletas da Cidade Natal'
           WHEN 'Hometown Riding Supplies' THEN 'Suprimentos de Passeio da Cidade Natal'
           WHEN 'Honest Repair Service' THEN 'Serviço de Reparo Honesto'
           WHEN 'Ideal Components' THEN 'Componentes Ideais'
           WHEN 'Imaginary Toys' THEN 'Brinquedos Imaginários'
           WHEN 'Immediate Repair Shop' THEN 'Oficina de Reparo Imediato'
           WHEN 'Immense Manufacturing Company' THEN 'Empresa de Manufatura Imensa'
           WHEN 'Impervious Paint Company' THEN 'Empresa de Tinta Impermeável'
           WHEN 'Imported and Domestic Cycles' THEN 'Ciclos Importados e Domésticos'
           WHEN 'Impromptu Trips' THEN 'Viagens Impromptu'
           WHEN 'Incomparable Bicycle Store' THEN 'Loja de Bicicletas Incomparável'
           WHEN 'Independent Outlet' THEN 'Outlet Independente'
           WHEN 'Industrial Supplies' THEN 'Suprimentos Industriais'
           WHEN 'Inexpensive Parts Shop' THEN 'Loja de Peças Baratas'
           WHEN 'Initial Bike Company' THEN 'Empresa Inicial de Bicicletas'
           WHEN 'Instant Cycle Store' THEN 'Loja de Ciclos Instantânea'
           WHEN 'Instruments and Parts Company' THEN 'Empresa de Instrumentos e Peças'
           WHEN 'Irregulars Outlet' THEN 'Outlet de Irregulares'
           WHEN 'Journey Sporting Goods' THEN 'Artigos Esportivos de Jornada'
           WHEN 'Jumbo Bikes' THEN 'Bicicletas Gigantes'
           WHEN 'Juvenile Sports Equipment' THEN 'Equipamento Esportivo Juvenil'
           WHEN 'Kickstand Sellers' THEN 'Vendedores de Descansos'
           WHEN 'Kickstands and Accessories Company' THEN 'Empresa de Descansos e Acessórios'
           WHEN 'Kids and Adults Cycle Shop' THEN 'Loja de Bicicletas para Crianças e Adultos'
           WHEN 'Large Bike Shop' THEN 'Loja de Bicicletas Grande'
           WHEN 'Larger Cycle Shop' THEN 'Loja de Ciclos Maior'
           WHEN 'Largest Bike Store' THEN 'Maior Loja de Bicicletas'
           WHEN 'Latest Accessories Sales' THEN 'Vendas de Acessórios Mais Recentes'
           WHEN 'Latest Sports Equipment' THEN 'Equipamento Esportivo Mais Recente'
           WHEN 'Leading Bike Distributors' THEN 'Principais Distribuidores de Bicicletas'
           WHEN 'Leading Sales & Repair' THEN 'Vendas e Reparos Líderes'
           WHEN 'Lease-a-Bike Shop' THEN 'Loja de Aluguel de Bicicletas'
           WHEN 'Leather and Vinyl Manufacturing' THEN 'Manufatura de Couro e Vinil'
           WHEN 'Leather Seat Factory' THEN 'Fábrica de Assentos de Couro'
           WHEN 'Leisure Activities' THEN 'Atividades de Lazer'
           WHEN 'Leisure Clearing House' THEN 'Casa de Compensação de Lazer'
		   WHEN 'Links Works' THEN 'Trabalhos de Links'
           WHEN 'Liquidation Sales' THEN 'Vendas de Liquidação'
           WHEN 'List Price Catalog Company' THEN 'Empresa de Catálogo de Preços de Lista'
           WHEN 'Little Bicycle Supply Shop' THEN 'Pequena Loja de Suprimentos de Bicicletas'
           WHEN 'Little Sports Center' THEN 'Pequeno Centro Esportivo'
           WHEN 'Local Hardware Factory' THEN 'Fábrica de Hardware Local'
           WHEN 'Local Sales and Rental' THEN 'Vendas e Aluguel Locais'
           WHEN 'Locks Company' THEN 'Empresa de Trancas'
           WHEN 'Lots of Bikes Storehouse' THEN 'Depósito de Muitas Bicicletas'
           WHEN 'Low Price Cycles' THEN 'Ciclos de Baixo Preço'
           WHEN 'Lubricant and Grease Suppliers' THEN 'Fornecedores de Lubrificantes e Graxas'
           WHEN 'Lustrous Paints and Components' THEN 'Tintas e Componentes Lustrosos'
           WHEN 'Machines & Cycles Store' THEN 'Loja de Máquinas e Ciclos'
           WHEN 'Mail Market' THEN 'Mercado de Correio'
           WHEN 'Mail-Order Outlet' THEN 'Outlet de Pedido por Correio'
           WHEN 'Main Bicycle Services' THEN 'Principais Serviços de Bicicleta'
           WHEN 'Maintenance and Repair for Bicycles' THEN 'Manutenção e Reparo para Bicicletas'
           WHEN 'Major Amusement Company' THEN 'Empresa de Entretenimento Principal'
           WHEN 'Major Bicycle Store' THEN 'Loja de Bicicletas Principal'
           WHEN 'Major Cycling' THEN 'Ciclismo Principal'
           WHEN 'Major Equipment Co' THEN 'Empresa de Equipamentos Principal'
           WHEN 'Major Sport Suppliers' THEN 'Principais Fornecedores de Esportes'
           WHEN 'Major Sporting Goods' THEN 'Principais Artigos Esportivos'
           WHEN 'Manufacturers Inc' THEN 'Fabricantes Inc'
           WHEN 'Many Bikes Store' THEN 'Loja de Muitas Bicicletas'
           WHEN 'Margies Travel' THEN 'Viagem da Margie'
           WHEN 'Mass Market Bikes' THEN 'Bicicletas de Mercado em Massa'
           WHEN 'Mechanical Brake Manufacturers' THEN 'Fabricantes de Freios Mecânicos'
           WHEN 'Mechanical Products Ltd.' THEN 'Produtos Mecânicos Ltda.'
           WHEN 'Mechanical Sports Center' THEN 'Centro de Esportes Mecânicos'
           WHEN 'Mercantile Outlet' THEN 'Outlet Mercantil'
           WHEN 'Metal Clearing House' THEN 'Casa de Compensação de Metal'
           WHEN 'Metal Processing Company' THEN 'Empresa de Processamento de Metal'
           WHEN 'Metallic Paint and Overcoat Co' THEN 'Empresa de Tinta Metálica e Sobretudo'
           WHEN 'Metro Bike Mart' THEN 'Mercado de Bicicletas Metro'
           WHEN 'Metro Bike Works' THEN 'Trabalhos de Bicicletas Metro'
           WHEN 'Metro Cycle Shop' THEN 'Loja de Ciclos Metro'
           WHEN 'Metro Manufacturing' THEN 'Manufatura Metro'
           WHEN 'Metro Metals Co.' THEN 'Co. de Metais Metro'
           WHEN 'Metro Sports Equipment' THEN 'Equipamento de Esportes Metro'
           WHEN 'Metropolitan Bicycle Supply' THEN 'Fornecimento de Bicicletas Metropolitanas'
           WHEN 'Metropolitan Equipment' THEN 'Equipamento Metropolitano'
           WHEN 'Metropolitan Manufacturing' THEN 'Manufatura Metropolitana'
           WHEN 'Metropolitan Sales and Rental' THEN 'Vendas e Aluguel Metropolitanos'
           WHEN 'Metropolitan Sports Supply' THEN 'Fornecimento de Esportes Metropolitanos'
           WHEN 'Mobile Outlet' THEN 'Outlet Móvel'
           WHEN 'Moderately-Priced Bikes Store' THEN 'Loja de Bicicletas com Preços Moderados'
           WHEN 'Modern Bike Store' THEN 'Loja de Bicicletas Moderna'
           WHEN 'Modular Cycle Systems' THEN 'Sistemas Modulares de Ciclismo'
           WHEN 'More Bikes!' THEN 'Mais Bicicletas!'
           WHEN 'Mountain Bike Center' THEN 'Centro de Bicicleta de Montanha'
           WHEN 'Mountain Bike Store' THEN 'Loja de Bicicletas de Montanha'
           WHEN 'Mountain Emporium' THEN 'Empório de Montanha'
           WHEN 'Mountain Toy Store' THEN 'Loja de Brinquedos de Montanha'
           WHEN 'National Manufacturing' THEN 'Manufatura Nacional'
           WHEN 'Nationwide Supply' THEN 'Fornecimento Nacional'
           WHEN 'Nearby Bike Mall' THEN 'Shopping de Bicicletas Próximo'
           WHEN 'Nearby Cycle Shop' THEN 'Loja de Ciclos Próxima'
		   WHEN 'Nearby Sporting Goods' THEN 'Artigos Esportivos Próximos'
           WHEN 'Nearest Bike Store' THEN 'Loja de Bicicletas Mais Próxima'
           WHEN 'Neighborhood Bicycle Storehouse' THEN 'Depósito de Bicicletas do Bairro'
           WHEN 'Neighborhood Store' THEN 'Loja do Bairro'
           WHEN 'New and Used Bicycles' THEN 'Bicicletas Novas e Usadas'
           WHEN 'New Bikes Company' THEN 'Empresa de Bicicletas Novas'
           WHEN 'Next Door Cycles' THEN 'Ciclos da Porta ao Lado'
           WHEN 'Next-Door Bike Store' THEN 'Loja de Bicicletas da Porta ao Lado'
           WHEN 'Nice Bikes' THEN 'Bicicletas Legais'
           WHEN 'Noiseless Gear Company' THEN 'Empresa de Engrenagens Silenciosas'
           WHEN 'Nonskid Tire Company' THEN 'Empresa de Pneus Antiderrapantes'
           WHEN 'Non-Slip Pedal Company' THEN 'Empresa de Pedais Antiderrapantes'
           WHEN 'North Bike Company' THEN 'Empresa de Bicicletas do Norte'
           WHEN 'Novelty Bikes' THEN 'Bicicletas de Novidade'
           WHEN 'Number 1 Supply' THEN 'Fornecimento Número 1'
           WHEN 'Number One Bike Co.' THEN 'Empresa de Bicicletas Número Um'
           WHEN 'Nuts and Bolts Mfg.' THEN 'Fabricante de Porcas e Parafusos'
           WHEN 'Odometers and Accessories Company' THEN 'Empresa de Odômetros e Acessórios'
           WHEN 'Official Parts Shop' THEN 'Loja Oficial de Peças'
           WHEN 'Off-Price Bike Center' THEN 'Centro de Bicicletas com Desconto'
           WHEN 'Oils and Fluids Warehouse' THEN 'Depósito de Óleos e Fluidos'
           WHEN 'One Bike Company' THEN 'Empresa de Bicicletas Única'
           WHEN 'One-Piece Handle Bars' THEN 'Guidões de Uma Peça'
           WHEN 'Online Bike Catalog' THEN 'Catálogo de Bicicletas Online'
           WHEN 'Online Bike Sellers' THEN 'Vendedores de Bicicletas Online'
           WHEN 'Online Bike Warehouse' THEN 'Depósito de Bicicletas Online'
           WHEN 'Only Bikes and Accessories' THEN 'Apenas Bicicletas e Acessórios'
           WHEN 'Operational Manufacturing' THEN 'Manufatura Operacional'
           WHEN 'Optimal Bikes' THEN 'Bicicletas Otimizadas'
           WHEN 'Orange Bicycle Company' THEN 'Empresa de Bicicletas Laranja'
           WHEN 'Original Bicycle Supply Company' THEN 'Empresa Original de Fornecimento de Bicicletas'
           WHEN 'Our Sporting Goods Store' THEN 'Nossa Loja de Artigos Esportivos'
           WHEN 'Outdoor Aerobic Systems Company' THEN 'Empresa de Sistemas Aeróbicos Externos'
           WHEN 'Outdoor Distributors' THEN 'Distribuidores Externos'
           WHEN 'Outdoor Equipment Store' THEN 'Loja de Equipamentos Externos'
           WHEN 'Outdoor Sporting Goods' THEN 'Artigos Esportivos Externos'
           WHEN 'Outdoor Sports Supply' THEN 'Fornecimento de Esportes Externos'
           WHEN 'Outdoor Toy Store' THEN 'Loja de Brinquedos Externos'
           WHEN 'Out-of-the-Way Hotels' THEN 'Hotéis Fora do Caminho'
           WHEN 'Outstanding Cycles' THEN 'Bicicletas Excepcionais'
           WHEN 'Paint Supply' THEN 'Fornecimento de Tinta'
           WHEN 'Painters Bicycle Specialists' THEN 'Especialistas em Bicicletas para Pintores'
           WHEN 'Paints and Solvents Company' THEN 'Empresa de Tintas e Solventes'
           WHEN 'Parcel Express Delivery Service' THEN 'Serviço de Entrega Expressa de Pacotes'
           WHEN 'Parts Shop' THEN 'Loja de Peças'
           WHEN 'Pedal Systems Company' THEN 'Empresa de Sistemas de Pedal'
           WHEN 'Pedaling Components' THEN 'Componentes de Pedalagem'
           WHEN 'Pedals Warehouse' THEN 'Depósito de Pedais'
           WHEN 'Perfect Toys' THEN 'Brinquedos Perfeitos'
           WHEN 'Permanent Finish Products' THEN 'Produtos de Acabamento Permanente'
           WHEN 'Petroleum Products Distributors' THEN 'Distribuidores de Produtos de Petróleo'
           WHEN 'Plastic Parts Company' THEN 'Empresa de Peças Plásticas'
           WHEN 'Plastic Products Manufacturers' THEN 'Fabricantes de Produtos Plásticos'
           WHEN 'Popular Bike Lines' THEN 'Linhas de Bicicletas Populares'
           WHEN 'Practical Bike Supply Company' THEN 'Empresa de Fornecimento de Bicicletas Práticas'
           WHEN 'Precision Gears Inc.' THEN 'Engrenagens de Precisão Inc.'
           WHEN 'Preferable Bikes' THEN 'Bicicletas Preferidas'
		   WHEN 'Preferred Bikes' THEN 'Bicicletas Preferidas'
           WHEN 'Pretty Bikes and Toys' THEN 'Bicicletas e Brinquedos Bonitos'
           WHEN 'Price-Cutter Discount Bikes' THEN 'Bicicletas de Desconto Cortador de Preços'
           WHEN 'Primary Bike Distributors' THEN 'Distribuidores de Bicicletas Primárias'
           WHEN 'Primary Cycle Shop' THEN 'Loja de Ciclos Primária'
           WHEN 'Principal Bicycle Supply' THEN 'Fornecimento Principal de Bicicletas'
           WHEN 'Principal Bike Company' THEN 'Empresa de Bicicletas Principal'
           WHEN 'Pro Sporting Goods' THEN 'Artigos Esportivos Pro'
           WHEN 'Producer Goods Clearinghouse' THEN 'Depósito de Mercadorias Produtoras'
           WHEN 'Professional Containers and Packaging Co.' THEN 'Empresa Profissional de Contêineres e Embalagens'
           WHEN 'Professional Cycle Store' THEN 'Loja Profissional de Ciclos'
           WHEN 'Professional Cyclists' THEN 'Ciclistas Profissionais'
           WHEN 'Professional Sales and Service' THEN 'Vendas e Serviço Profissional'
           WHEN 'Professional Sporting Goods' THEN 'Artigos Esportivos Profissionais'
           WHEN 'Progressive Sports' THEN 'Esportes Progressivos'
           WHEN 'Prosperous Tours' THEN 'Passeios Prósperos'
           WHEN 'Purchase Mart' THEN 'Mercado de Compras'
           WHEN 'Purple Bicycle Company' THEN 'Empresa de Bicicletas Roxas'
           WHEN 'Qualified Sales and Repair Services' THEN 'Serviços Qualificados de Vendas e Reparos'
           WHEN 'Quality Bike Sales' THEN 'Vendas de Bicicletas de Qualidade'
           WHEN 'Quantity Discounts' THEN 'Descontos por Quantidade'
           WHEN 'Quick Delivery Service' THEN 'Serviço de Entrega Rápida'
           WHEN 'Quick Parts and Service' THEN 'Peças e Serviço Rápido'
           WHEN 'Quitting Business Distributors' THEN 'Distribuidores de Negócios Encerrando'
           WHEN 'Racing Association' THEN 'Associação de Corridas'
           WHEN 'Racing Bike Outlet' THEN 'Outlet de Bicicletas de Corrida'
           WHEN 'Racing Partners' THEN 'Parceiros de Corrida'
           WHEN 'Racing Sales and Service' THEN 'Vendas e Serviço de Corrida'
           WHEN 'Racing Store' THEN 'Loja de Corrida'
           WHEN 'Racing Supply Distributors' THEN 'Distribuidores de Suprimentos de Corrida'
           WHEN 'Racing Tours' THEN 'Passeios de Corrida'
           WHEN 'Racing Toys' THEN 'Brinquedos de Corrida'
           WHEN 'Racks and Security Systems' THEN 'Racks e Sistemas de Segurança'
           WHEN 'Rally Day Mall' THEN 'Shopping do Dia do Rally'
           WHEN 'Rally Master Company Inc' THEN 'Empresa Mestra de Rally Inc'
           WHEN 'Rambling Tours' THEN 'Passeios Errantes'
           WHEN 'Rampart Amusement Company' THEN 'Empresa de Entretenimento Rampart'
           WHEN 'Rapid Bikes' THEN 'Bicicletas Rápidas'
           WHEN 'Raw Materials Inc' THEN 'Materiais Crus Inc'
           WHEN 'Real Sporting Goods' THEN 'Artigos Esportivos Reais'
           WHEN 'Reasonable Bicycle Sales' THEN 'Vendas de Bicicletas Razóveis'
           WHEN 'Recommended Bicycles' THEN 'Bicicletas Recomendadas'
           WHEN 'Recreation Supplies' THEN 'Suprimentos de Recreação'
           WHEN 'Recreation Systems' THEN 'Sistemas de Recreação'
           WHEN 'Recreation Toy Store' THEN 'Loja de Brinquedos de Recreação'
           WHEN 'Red Bicycle Company' THEN 'Empresa de Bicicletas Vermelhas'
           WHEN 'Refined Department Stores' THEN 'Lojas de Departamento Refinadas'
           WHEN 'Region Bike Company' THEN 'Empresa de Bicicletas Regional'
           WHEN 'Regional Cycle Shop' THEN 'Loja de Ciclos Regional'
           WHEN 'Regional Manufacturing' THEN 'Manufatura Regional'
           WHEN 'Registered Cycle Store' THEN 'Loja de Ciclos Registrada'
           WHEN 'Reliable Brake Systems' THEN 'Sistemas de Freio Confiáveis'
           WHEN 'Reliable Retail Center' THEN 'Centro de Varejo Confiável'
           WHEN 'Remarkable Bike Store' THEN 'Loja de Bicicletas Notável'
           WHEN 'Remote Bicycle Specialists' THEN 'Especialistas em Bicicletas Remotas'
           WHEN 'Rental Bikes' THEN 'Bicicletas para Alugar'
           WHEN 'Rental Gallery' THEN 'Galeria de Aluguel'
		   WHEN 'Requisite Part Supply' THEN 'Fornecimento de Peças Necessárias'
           WHEN 'Resale Services' THEN 'Serviços de Revenda'
           WHEN 'Resident Cycle Shop' THEN 'Loja de Ciclos Residente'
           WHEN 'Responsible Bike Dealers' THEN 'Revendedores de Bicicletas Responsáveis'
           WHEN 'Retail Cycle Shop' THEN 'Loja de Ciclos de Varejo'
           WHEN 'Retail Discount Store' THEN 'Loja de Descontos de Varejo'
           WHEN 'Retail Mall' THEN 'Shopping de Varejo'
           WHEN 'Retail Sales and Service' THEN 'Vendas e Serviço de Varejo'
           WHEN 'Retail Sporting Equipment' THEN 'Equipamento Esportivo de Varejo'
           WHEN 'Retail Sporting Goods' THEN 'Artigos Esportivos de Varejo'
           WHEN 'Retail Toy Store' THEN 'Loja de Brinquedos de Varejo'
           WHEN 'Retirement Activities Association' THEN 'Associação de Atividades de Aposentadoria'
           WHEN 'Retread Tire Company' THEN 'Empresa de Recauchutagem de Pneus'
           WHEN 'Retreat Inn' THEN 'Pousada de Retiro'
           WHEN 'Rewarding Activities Company' THEN 'Empresa de Atividades Recompensadoras'
           WHEN 'Rich Department Store' THEN 'Loja de Departamento Rica'
           WHEN 'Riders Company' THEN 'Empresa de Cavalos'
           WHEN 'Riding Associates' THEN 'Associados de Montaria'
           WHEN 'Riding Cycles' THEN 'Ciclos de Montaria'
           WHEN 'Riding Excursions' THEN 'Excursões de Montaria'
           WHEN 'Riverside Company' THEN 'Empresa à Beira do Rio'
           WHEN 'Road Way Sales and Rental' THEN 'Vendas e Aluguel de Estradas'
           WHEN 'Roadway Bicycle Supply' THEN 'Fornecimento de Bicicletas de Estrada'
           WHEN 'Roadway Bike Emporium' THEN 'Empório de Bicicletas de Estrada'
           WHEN 'Road-Way Mart' THEN 'Mercado de Estrada'
           WHEN 'Roadway Supplies' THEN 'Suprimentos de Estrada'
           WHEN 'Rodeway Bike Store' THEN 'Loja de Bicicletas Rodoviárias'
           WHEN 'Roving Sports' THEN 'Esportes Itinerantes'
           WHEN 'Rugged Bikes' THEN 'Bicicletas Robustas'
           WHEN 'Running and Cycling Gear' THEN 'Equipamento de Corrida e Ciclismo'
           WHEN 'Rural Bicycle Supply' THEN 'Fornecimento de Bicicletas Rurais'
           WHEN 'Rural Cycle Emporium' THEN 'Empório de Ciclos Rurais'
           WHEN 'Rural Department Store' THEN 'Loja de Departamento Rural'
           WHEN 'Rural Mountain Bike Mart' THEN 'Mercado de Bicicletas de Montanha Rural'
           WHEN 'Rural Sales and Service' THEN 'Vendas e Serviço Rural'
           WHEN 'Rural Sporting Goods' THEN 'Artigos Esportivos Rurais'
           WHEN 'Rustic Bike Store' THEN 'Loja de Bicicletas Rústica'
           WHEN 'Safe Cycles Shop' THEN 'Loja de Bicicletas Seguras'
           WHEN 'Safe Toys' THEN 'Brinquedos Seguros'
           WHEN 'Sales and Supply Company' THEN 'Empresa de Vendas e Fornecimento'
           WHEN 'Sample Bike Store' THEN 'Loja de Bicicletas de Amostra'
           WHEN 'Satin Finish Company' THEN 'Empresa de Acabamento de Cetim'
           WHEN 'Scooters and Bikes Store' THEN 'Loja de Scooters e Bicicletas'
           WHEN 'Scratch-Resistant Finishes Company' THEN 'Empresa de Acabamentos Resistentes a Riscos'
           WHEN 'Seaside Bike Works' THEN 'Oficina de Bicicletas à Beira-Mar'
           WHEN 'Seats and Saddles Company' THEN 'Empresa de Assentos e Selas'
           WHEN 'Second Bike Shop' THEN 'Segunda Loja de Bicicletas'
           WHEN 'Security Racks and Locks Wholesalers' THEN 'Atacadistas de Racks de Segurança e Fechaduras'
           WHEN 'Selected Distributors' THEN 'Distribuidores Selecionados'
           WHEN 'Self-Contained Cycle Parts Company' THEN 'Empresa de Peças de Ciclos Autocontidas'
           WHEN 'Sellers of Cycles' THEN 'Vendedores de Ciclos'
           WHEN 'Sensational Discount Store' THEN 'Loja de Descontos Sensacionais'
           WHEN 'Sensible Sports' THEN 'Esportes Sensatos'
           WHEN 'Separate Parts Corporation' THEN 'Corporação de Peças Separadas'
           WHEN 'Serious Cycles' THEN 'Ciclos Sérios'
           WHEN 'Seventh Bike Store' THEN 'Sétima Loja de Bicicletas'
		   WHEN 'Sharp Bikes' THEN 'Bicicletas Afiadas'
           WHEN 'Sheet Metal Manufacturing' THEN 'Fabricação de Chapas Metálicas'
           WHEN 'Shipping Specialists' THEN 'Especialistas em Envio'
           WHEN 'Showcase for Cycles' THEN 'Mostruário para Ciclos'
           WHEN 'Simple Bike Parts' THEN 'Peças Simples para Bicicletas'
           WHEN 'Sixth Bike Store' THEN 'Sexta Loja de Bicicletas'
           WHEN 'Sleek Bikes' THEN 'Bicicletas Elegantes'
           WHEN 'Small Bike Accessories Shop' THEN 'Loja de Acessórios para Bicicletas Pequenas'
           WHEN 'Small Bike Shop' THEN 'Pequena Loja de Bicicletas'
           WHEN 'Small Cycle Store' THEN 'Pequena Loja de Ciclos'
           WHEN 'Social Activities Club' THEN 'Clube de Atividades Sociais'
           WHEN 'Solid Bike Parts' THEN 'Peças Sólidas para Bicicletas'
           WHEN 'Some Discount Store' THEN 'Alguma Loja de Descontos'
           WHEN 'South Bike Company' THEN 'Empresa de Bicicletas do Sul'
           WHEN 'Spa and Exercise Outfitters' THEN 'Equipamentos de Spa e Exercício'
           WHEN 'Spare Parts Co.' THEN 'Empresa de Peças de Reposição'
           WHEN 'Sparkling Paint and Finishes' THEN 'Tinta e Acabamentos Cintilantes'
           WHEN 'Specialty Sports Store' THEN 'Loja de Esportes Especializados'
           WHEN 'Speedometer Sales' THEN 'Vendas de Velocímetros'
           WHEN 'Spoke Manufacturers' THEN 'Fabricantes de Raios'
           WHEN 'Sporting Goods and Bicycle Shop' THEN 'Loja de Artigos Esportivos e Bicicletas'
           WHEN 'Sports Commodities' THEN 'Commodities Esportivas'
           WHEN 'Sports Merchandise' THEN 'Mercadorias Esportivas'
           WHEN 'Sports Products Store' THEN 'Loja de Produtos Esportivos'
           WHEN 'Sports Sales and Rental' THEN 'Vendas e Aluguel de Artigos Esportivos'
           WHEN 'Sports Store' THEN 'Loja de Esportes'
           WHEN 'Standard Bikes' THEN 'Bicicletas Padrão'
           WHEN 'Stationary Bikes and Stands' THEN 'Bicicletas Estacionárias e Suportes'
           WHEN 'Steel Inc.' THEN 'Aço Inc.'
           WHEN 'Stock Parts and Supplies' THEN 'Peças e Suprimentos em Estoque'
           WHEN 'Strenuous Exercise Shop' THEN 'Loja de Exercícios Intensos'
           WHEN 'Strong Metal Manufacturing' THEN 'Fabricação de Metais Fortes'
           WHEN 'Sturdy Toys' THEN 'Brinquedos Resistentes'
           WHEN 'Stylish Department Stores' THEN 'Lojas de Departamento Estilosas'
           WHEN 'Suburban Cycle Shop' THEN 'Loja de Ciclos Suburbana'
           WHEN 'Successful Sales Company' THEN 'Empresa de Vendas de Sucesso'
           WHEN 'Summer Sports Place' THEN 'Lugar de Esportes de Verão'
           WHEN 'Sundry Sporting Goods' THEN 'Artigos Esportivos Diversos'
           WHEN 'Sunny Place Bikes' THEN 'Bicicletas do Lugar Ensolarado'
           WHEN 'Super Sports Store' THEN 'Super Loja de Esportes'
           WHEN 'Superb Sales and Repair' THEN 'Vendas e Reparos Excelentes'
           WHEN 'Superior Hardware Distributors' THEN 'Distribuidores de Hardware Superior'
           WHEN 'Superlative Bikes' THEN 'Bicicletas Superlativas'
           WHEN 'Sure & Reliable Sporting Goods' THEN 'Artigos Esportivos Seguros e Confiáveis'
           WHEN 'Swift Cycles' THEN 'Ciclos Rápidos'
           WHEN 'Synthetic Materials Manufacturing' THEN 'Fabricação de Materiais Sintéticos'
           WHEN 'Systematic Sales' THEN 'Vendas Sistemáticas'
           WHEN 'Tachometers and Accessories' THEN 'Tacômetros e Acessórios'
           WHEN 'Tandem Bicycle Store' THEN 'Loja de Bicicletas Tandem'
           WHEN 'Tandem Sales and Service' THEN 'Vendas e Serviço Tandem'
           WHEN 'Technical Parts Manufacturing' THEN 'Fabricação de Peças Técnicas'
           WHEN 'Teen Discount Store' THEN 'Loja de Descontos para Adolescentes'
           WHEN 'Tenth Bike Store' THEN 'Décima Loja de Bicicletas'
           WHEN 'The Accessories Store' THEN 'A Loja de Acessórios'
           WHEN 'The Bicycle Accessories Company' THEN 'A Empresa de Acessórios para Bicicletas'
           WHEN 'The Bike Mechanics' THEN 'Os Mecânicos de Bicicletas'
           WHEN 'The Bike Outlet' THEN 'O Outlet de Bicicletas'
           WHEN 'The Bike Shop' THEN 'A Loja de Bicicletas'
		   WHEN 'The Commissary' THEN 'O Comissariado'
           WHEN 'The Cycle Store' THEN 'A Loja de Ciclos'
           WHEN 'The Gear Store' THEN 'A Loja de Equipamentos'
           WHEN 'The New Bike Store' THEN 'A Nova Loja de Bicicletas'
           WHEN 'The Showroom' THEN 'O Showroom'
           WHEN 'Third Bike Store' THEN 'Terceira Loja de Bicicletas'
           WHEN 'This Area Sporting Goods' THEN 'Artigos Esportivos desta Área'
           WHEN 'Thorough Parts and Repair Services' THEN 'Serviços de Peças e Reparos Detalhados'
           WHEN 'Thrifty Parts and Sales' THEN 'Vendas e Peças Econômicas'
           WHEN 'Thrilling Bike Tours' THEN 'Passeios de Bicicleta Empolgantes'
           WHEN 'Timely Shipping Service' THEN 'Serviço de Envio Oportuno'
           WHEN 'Tiny Bike Boutique' THEN 'Boutique de Bicicletas Pequenas'
           WHEN 'Tire Company' THEN 'Empresa de Pneus'
           WHEN 'Tire Exchange' THEN 'Troca de Pneus'
           WHEN 'Tires and Tubes' THEN 'Pneus e Tubos'
           WHEN 'Top Bike Market' THEN 'Mercado de Bicicletas Premium'
           WHEN 'Top of the Line Bikes' THEN 'Bicicletas Top de Linha'
           WHEN 'Top Sports Supply' THEN 'Fornecimento de Esportes de Ponta'
           WHEN 'Topnotch Bikes' THEN 'Bicicletas de Primeira Qualidade'
           WHEN 'Totes & Baskets Company' THEN 'Empresa de Sacolas e Cestas'
           WHEN 'Tough and Reliable Parts' THEN 'Peças Resistentes e Confiáveis'
           WHEN 'Touring Services' THEN 'Serviços de Turismo'
           WHEN 'Town Industries' THEN 'Indústrias da Cidade'
           WHEN 'Township Inn' THEN 'Pousada do Município'
           WHEN 'Toy Manufacturing Inc' THEN 'Indústria de Fabricação de Brinquedos'
           WHEN 'Traction Tire Company' THEN 'Empresa de Pneus de Tração'
           WHEN 'Traditional Department Stores' THEN 'Lojas de Departamento Tradicionais'
           WHEN 'Trailblazing Sports' THEN 'Esportes Inovadores'
           WHEN 'Transport Bikes' THEN 'Bicicletas de Transporte'
           WHEN 'Transportation Options' THEN 'Opções de Transporte'
           WHEN 'Travel Sports' THEN 'Esportes de Viagem'
           WHEN 'Travel Systems' THEN 'Sistemas de Viagem'
           WHEN 'Tread Industries' THEN 'Indústrias de Borracha'
           WHEN 'Trendy Department Stores' THEN 'Lojas de Departamento Modernas'
           WHEN 'Trusted Catalog Store' THEN 'Loja de Catálogos Confiáveis'
           WHEN 'Tubeless Tire Company' THEN 'Empresa de Pneus Sem Câmara de Ar'
           WHEN 'Twelfth Bike Store' THEN 'Décima Segunda Loja de Bicicletas'
           WHEN 'Twin Cycles' THEN 'Bicicletas Gêmeas'
           WHEN 'Two Bike Shops' THEN 'Duas Lojas de Bicicletas'
           WHEN 'Two Wheels Cycle Store' THEN 'Loja de Ciclos de Duas Rodas'
           WHEN 'Two-Seater Bikes' THEN 'Bicicletas de Dois Lugares'
           WHEN 'Two-Wheeled Transit Company' THEN 'Empresa de Trânsito de Duas Rodas'
           WHEN 'Ultimate Bicycle Company' THEN 'Empresa de Bicicletas Definitiva'
           WHEN 'Ultimate Bike Shop' THEN 'Loja de Bicicletas Definitiva'
           WHEN 'Uncompromising Quality Co' THEN 'Empresa de Qualidade Intransigente'
           WHEN 'Underglaze and Finish Company' THEN 'Empresa de Esmalte e Acabamento'
           WHEN 'Unicycles, Bicycles, and Tricycles' THEN 'Monociclos, Bicicletas e Triciclos'
           WHEN 'Unified Sports Company' THEN 'Empresa de Esportes Unificados'
           WHEN 'Unique Bikes' THEN 'Bicicletas Únicas'
           WHEN 'Unsurpassed Bikes' THEN 'Bicicletas Sem Igual'
           WHEN 'Unusual Bicycle Company' THEN 'Empresa de Bicicletas Incomuns'
           WHEN 'Up-To-Date Sports' THEN 'Esportes Atualizados'
		   WHEN 'Urban Sports Emporium' THEN 'Empório de Esportes Urbanos'
           WHEN 'Utilitarian Sporting Goods' THEN 'Artigos Esportivos Utilitários'
           WHEN 'Uttermost Bike Shop' THEN 'Loja de Bicicletas Extremas'
           WHEN 'Vale Riding Supplies' THEN 'Suprimentos para Equitação no Vale'
           WHEN 'Valley Bicycle Distributors' THEN 'Distribuidores de Bicicletas do Vale'
           WHEN 'Valley Bicycle Specialists' THEN 'Especialistas em Bicicletas do Vale'
           WHEN 'Valley Toy Store' THEN 'Loja de Brinquedos do Vale'
           WHEN 'Valuable Bike Parts Company' THEN 'Empresa de Peças de Bicicleta Valiosas'
           WHEN 'Variety Bike Outlet' THEN 'Outlet de Variedades de Bicicletas'
           WHEN 'Variety Cycling' THEN 'Ciclismo de Variedades'
           WHEN 'Vast Bike Sales and Rental' THEN 'Vendas e Aluguéis de Bicicletas Vastas'
           WHEN 'Vehicle Shop' THEN 'Loja de Veículos'
           WHEN 'Versatile Sporting Goods Company' THEN 'Empresa de Artigos Esportivos Versáteis'
           WHEN 'Very Best Sports Supply' THEN 'Fornecimento de Artigos Esportivos de Alta Qualidade'
           WHEN 'Vigorous Exercise Company' THEN 'Empresa de Exercícios Vigorosos'
           WHEN 'Vigorous Sports Store' THEN 'Loja de Esportes Vigorosos'
           WHEN 'Village Tours' THEN 'Passeios pela Vila'
           WHEN 'Vintage Sport Boutique' THEN 'Boutique de Esportes Vintage'
           WHEN 'Vinyl and Plastic Goods Corporation' THEN 'Corporação de Produtos de Vinil e Plástico'
           WHEN 'Volume Bike Sellers' THEN 'Vendedores de Bicicletas em Volume'
           WHEN 'Weekend Bike Tours' THEN 'Passeios de Bicicleta de Fim de Semana'
           WHEN 'Weekend Tours' THEN 'Passeios de Fim de Semana'
           WHEN 'West Side Mart' THEN 'Mercado do Lado Oeste'
           WHEN 'West Wind Distributors' THEN 'Distribuidores do Vento Oeste'
           WHEN 'Western Bike Supplies' THEN 'Suprimentos de Bicicleta do Oeste'
           WHEN 'Westside Cycle Store' THEN 'Loja de Ciclos do Lado Oeste'
           WHEN 'Westside Plaza' THEN 'Praça do Lado Oeste'
           WHEN 'Wheel Gallery' THEN 'Galeria de Rodas'
           WHEN 'Wheels Inc.' THEN 'Rodas Inc.'
           WHEN 'Wheelsets Storehouse' THEN 'Armazém de Conjuntos de Rodas'
           WHEN 'Wholesale Bikes' THEN 'Bicicletas por Atacado'
           WHEN 'Wholesale Parts' THEN 'Peças por Atacado'
           WHEN 'Widget Bicycle Specialists' THEN 'Especialistas em Bicicletas de Widget'
           WHEN 'Wingtip Toys' THEN 'Brinquedos de Bico de Asa'
           WHEN 'Wire Baskets and Parts' THEN 'Cestas e Peças de Arame'
           WHEN 'Wonderful Bikes Inc.' THEN 'Inc. de Bicicletas Maravilhosas'
           WHEN 'Work and Play Association' THEN 'Associação de Trabalho e Diversão'
           WHEN 'Workout Emporium' THEN 'Empório de Treinamento'
           WHEN 'World Bike Discount Store' THEN 'Loja de Descontos de Bicicletas Mundial'
           WHEN 'World of Bikes' THEN 'Mundo das Bicicletas'
           WHEN 'Worthwhile Activity Store' THEN 'Loja de Atividades que Valem a Pena'
           WHEN 'Year-Round Sports' THEN 'Esportes Durante Todo o Ano'
           WHEN 'Yellow Bicycle Company' THEN 'Empresa de Bicicletas Amarelas'
		   ELSE Name
    END as Nome,
    SalesPersonID as IDPessoaVendas,
    ModifiedDate as DataModificacao
INTO AdventureWorksPT.dbo.Loja
FROM Sales.Store

ALTER SCHEMA Vendas TRANSFER Loja

SELECT 
    BillOfMaterialsID AS IDListaMateriais,
    ProductAssemblyID AS IDProdutoMontagem,
    ComponentID AS IDComponente,
    StartDate AS DataInicio,
    EndDate AS DataFim,
    UnitMeasureCode AS CodigoUnidadeMedida,
    BOMLevel AS NivelListaMateriais,
    PerAssemblyQty AS QuantidadePorMontagem,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.ListaMateriais
FROM Production.BillOfMaterials

EXEC ('CREATE SCHEMA Producao')
ALTER SCHEMA Producao TRANSFER ListaMateriais

SELECT 
    CultureID AS IDCultura,
    CASE Name
           WHEN 'Invariant Language (Invariant Country)' THEN 'Linguagem Invariável (País Invariável)'
           WHEN 'Arabic' THEN 'Árabe'
           WHEN 'English' THEN 'Inglês'
           WHEN 'Spanish' THEN 'Espanhol'
           WHEN 'French' THEN 'Francês'
           WHEN 'Hebrew' THEN 'Hebraico'
           WHEN 'Thai' THEN 'Tailandês'
           WHEN 'Chinese' THEN 'Chinês'
    END AS Nome,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.Cultura
FROM Production.Culture

ALTER SCHEMA Producao TRANSFER Cultura

SELECT 
    DocumentNode AS NoDocumento,
    DocumentLevel AS NivelDocumento,
    CASE Title
           WHEN 'Documents' THEN 'Documentos'
           WHEN 'Overview' THEN 'Visão Geral'
           WHEN 'Introduction 1' THEN 'Introdução 1'
           WHEN 'Repair and Service Guidelines' THEN 'Diretrizes de Reparo e Serviço'
           WHEN 'Maintenance' THEN 'Manutenção'
           WHEN 'Crank Arm and Tire Maintenance' THEN 'Manutenção do Braço de Manivela e Pneu'
           WHEN 'Lubrication Maintenance' THEN 'Manutenção de Lubrificação'
           WHEN 'Assembly' THEN 'Montagem'
           WHEN 'Front Reflector Bracket and Reflector Assembly 3' THEN 'Montagem do Suporte e Refletor Dianteiro 3'
           WHEN 'Front Reflector Bracket Installation' THEN 'Instalação do Suporte do Refletor Dianteiro'
           WHEN 'Installing Replacement Pedals' THEN 'Instalando Pedais de Reposição'
           WHEN 'Seat Assembly' THEN 'Montagem do Assento'
           WHEN 'Training Wheels 2' THEN 'Rodinhas de Treinamento 2'
    END AS Titulo,
    Owner AS Proprietario,
    FolderFlag AS FlagPasta,
    CASE FileName
           WHEN 'Documents' THEN 'Documentos'
           WHEN 'Overview' THEN 'Visão Geral'
           WHEN 'Introduction 1.doc' THEN 'Introdução 1.doc'
           WHEN 'Repair and Service Guidelines.doc' THEN 'Diretrizes de Reparo e Serviço.doc'
           WHEN 'Maintenance' THEN 'Manutenção'
           WHEN 'Crank Arm and Tire Maintenance.doc' THEN 'Manutenção de Braço de Manivela e Pneu.doc'
           WHEN 'Lubrication Maintenance.doc' THEN 'Manutenção de Lubrificação.doc'
           WHEN 'Assembly' THEN 'Montagem'
           WHEN 'Front Reflector Bracket and Reflector Assembly 3.doc' THEN 'Montagem de Suporte e Refletor Dianteiro 3.doc'
           WHEN 'Front Reflector Bracket Installation.doc' THEN 'Instalação de Suporte de Refletor Dianteiro.doc'
           WHEN 'Installing Replacement Pedals.doc' THEN 'Instalando Pedais de Reposição.doc'
           WHEN 'Seat Assembly.doc' THEN 'Montagem de Assento.doc'
           WHEN 'Training Wheels 2.doc' THEN 'Rodinhas de Treinamento 2.doc'
    END AS NomeArquivo,
    FileExtension AS ExtensaoArquivo,
    Revision AS Revisao,
    ChangeNumber AS NumeroAlteracao,
    Status AS Status,
    Document AS Documento,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.Documento
FROM Production.Document

ALTER SCHEMA Producao TRANSFER Documento

SELECT * FROM Production.Illustration

SELECT 
    IllustrationID AS IDIlustracao,
    Diagram AS Diagrama,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.Ilustracao
FROM Production.Illustration;

ALTER SCHEMA Producao TRANSFER Ilustracao

SELECT 
    LocationID AS IDLocalizacao,
    CASE 
        WHEN Name = 'Tool Crib' THEN 'Almoxarifado de Ferramentas'
        WHEN Name = 'Sheet Metal Racks' THEN 'Estantes de Chapas Metálicas'
        WHEN Name = 'Paint Shop' THEN 'Oficina de Pintura'
        WHEN Name = 'Paint Storage' THEN 'Armazenamento de Tintas'
        WHEN Name = 'Metal Storage' THEN 'Armazenamento de Metais'
        WHEN Name = 'Miscellaneous Storage' THEN 'Armazenamento Diversos'
        WHEN Name = 'Finished Goods Storage' THEN 'Armazenamento de Produtos Acabados'
        WHEN Name = 'Frame Forming' THEN 'Formação de Estruturas'
        WHEN Name = 'Frame Welding' THEN 'Soldagem de Estruturas'
        WHEN Name = 'Debur and Polish' THEN 'Rebarbação e Polimento'
        WHEN Name = 'Paint' THEN 'Pintura'
        WHEN Name = 'Specialized Paint' THEN 'Pintura Especializada'
        WHEN Name = 'Subassembly' THEN 'Submontagem'
        WHEN Name = 'Final Assembly' THEN 'Montagem Final'
    END AS Nome,
    CostRate AS TaxaCusto,
    Availability AS Disponibilidade,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.Localizacao
FROM Production.Location;

ALTER SCHEMA Producao TRANSFER Localizacao

SELECT 
    ProductID AS IDProduto,
    CASE 
        WHEN Name = 'Adjustable Race' THEN 'Rolamento Ajustável'
        WHEN Name = 'All-Purpose Bike Stand' THEN 'Suporte para Bicicleta Multifuncional'
        WHEN Name = 'AWC Logo Cap' THEN 'Boné com Logotipo da AWC'
        WHEN Name = 'BB Ball Bearing' THEN 'Rolamento de Esferas BB'
        WHEN Name = 'Bearing Ball' THEN 'Esfera de Rolamento'
        WHEN Name = 'Bike Wash - Dissolver' THEN 'Lavagem de Bicicleta - Removedor'
        WHEN Name = 'Blade' THEN 'Lâmina'
        WHEN Name = 'Cable Lock' THEN 'Trava de Cabo'
        WHEN Name = 'Chain' THEN 'Corrente'
        WHEN Name = 'Chain Stays' THEN 'Tubos da Corrente'
        WHEN Name = 'Chainring' THEN 'Coroa da Corrente'
        WHEN Name = 'Chainring Bolts' THEN 'Parafusos da Coroa da Corrente'
        WHEN Name = 'Chainring Nut' THEN 'Porca da Coroa da Corrente'
        WHEN Name = 'Classic Vest, L' THEN 'Colete Clássico, L'
        WHEN Name = 'Classic Vest, M' THEN 'Colete Clássico, M'
        WHEN Name = 'Classic Vest, S' THEN 'Colete Clássico, S'
        WHEN Name = 'Cone-Shaped Race' THEN 'Rolamento Cônico'
        WHEN Name = 'Crown Race' THEN 'Rolamento de Coroa'
        WHEN Name = 'Cup-Shaped Race' THEN 'Rolamento em Forma de Copo'
        WHEN Name = 'Decal 1' THEN 'Adesivo 1'
        WHEN Name = 'Decal 2' THEN 'Adesivo 2'
        WHEN Name = 'Down Tube' THEN 'Tubo Inferior'
        WHEN Name = 'External Lock Washer 1' THEN 'Arruela de Trava Externa 1'
        WHEN Name = 'External Lock Washer 2' THEN 'Arruela de Trava Externa 2'
        WHEN Name = 'External Lock Washer 3' THEN 'Arruela de Trava Externa 3'
        WHEN Name = 'External Lock Washer 4' THEN 'Arruela de Trava Externa 4'
        WHEN Name = 'External Lock Washer 5' THEN 'Arruela de Trava Externa 5'
        WHEN Name = 'External Lock Washer 6' THEN 'Arruela de Trava Externa 6'
        WHEN Name = 'External Lock Washer 7' THEN 'Arruela de Trava Externa 7'
        WHEN Name = 'External Lock Washer 8' THEN 'Arruela de Trava Externa 8'
        WHEN Name = 'External Lock Washer 9' THEN 'Arruela de Trava Externa 9'
        WHEN Name = 'Fender Set - Mountain' THEN 'Conjunto de Para-lamas - Mountain'
        WHEN Name = 'Fork Crown' THEN 'Coroa do Garfo'
        WHEN Name = 'Fork End' THEN 'Ponta do Garfo'
        WHEN Name = 'Freewheel' THEN 'Roda Livre'
        WHEN Name = 'Front Brakes' THEN 'Freios Dianteiros'
        WHEN Name = 'Front Derailleur' THEN 'Câmbio Dianteiro'
        WHEN Name = 'Front Derailleur Cage' THEN 'Gaiola do Câmbio Dianteiro'
        WHEN Name = 'Front Derailleur Linkage' THEN 'Ligação do Câmbio Dianteiro'
        WHEN Name = 'Full-Finger Gloves, L' THEN 'Luvas de Dedo Inteiro, L'
        WHEN Name = 'Full-Finger Gloves, M' THEN 'Luvas de Dedo Inteiro, M'
        WHEN Name = 'Full-Finger Gloves, S' THEN 'Luvas de Dedo Inteiro, S'
        WHEN Name = 'Guide Pulley' THEN 'Roda Guia'
        WHEN Name = 'Half-Finger Gloves, L' THEN 'Luvas de Meio Dedo, L'
        WHEN Name = 'Half-Finger Gloves, M' THEN 'Luvas de Meio Dedo, M'
        WHEN Name = 'Half-Finger Gloves, S' THEN 'Luvas de Meio Dedo, S'
        WHEN Name = 'Handlebar Tube' THEN 'Tubo do Guidão'
        WHEN Name = 'Head Tube' THEN 'Tubo de Cabeça'
        WHEN Name = 'Headlights - Dual-Beam' THEN 'Faróis - Duplo Feixe'
        WHEN Name = 'Headlights - Weatherproof' THEN 'Faróis - À Prova de Intempéries'
        WHEN Name = 'Headset Ball Bearings' THEN 'Rolamentos de Esferas do Conjunto de Direção'
        WHEN Name = 'Hitch Rack - 4-Bike' THEN 'Rack de Engate - 4 Bicicletas'
        WHEN Name = 'HL Bottom Bracket' THEN 'Suporte Inferior HL'
        WHEN Name = 'HL Crankarm' THEN 'Braço de Pedivela HL'
		WHEN Name = 'HL Crankset' THEN 'Pedivela HL'
        WHEN Name = 'HL Fork' THEN 'Garfo HL'
        WHEN Name = 'HL Grip Tape' THEN 'Fita de Manopla HL'
        WHEN Name = 'HL Headset' THEN 'Conjunto de Direção HL'
        WHEN Name = 'HL Hub' THEN 'Cubo HL'
        WHEN Name = 'HL Mountain Front Wheel' THEN 'Roda Dianteira de Montanha HL'
        WHEN Name = 'HL Mountain Handlebars' THEN 'Guidão de Montanha HL'
        WHEN Name = 'HL Mountain Pedal' THEN 'Pedal de Montanha HL'
        WHEN Name = 'HL Mountain Rear Wheel' THEN 'Roda Traseira de Montanha HL'
        WHEN Name = 'HL Mountain Rim' THEN 'Aro de Montanha HL'
        WHEN Name = 'HL Mountain Seat Assembly' THEN 'Montagem do Banco de Montanha HL'
        WHEN Name = 'HL Mountain Seat/Saddle' THEN 'Banco de Montanha HL'
        WHEN Name = 'HL Mountain Tire' THEN 'Pneu de Montanha HL'
        WHEN Name = 'HL Nipple' THEN 'Bico de Mamilo HL'
        WHEN Name = 'HL Road Front Wheel' THEN 'Roda Dianteira de Estrada HL'
        WHEN Name = 'HL Road Handlebars' THEN 'Guidão de Estrada HL'
        WHEN Name = 'HL Road Pedal' THEN 'Pedal de Estrada HL'
        WHEN Name = 'HL Road Rear Wheel' THEN 'Roda Traseira de Estrada HL'
        WHEN Name = 'HL Road Rim' THEN 'Aro de Estrada HL'
        WHEN Name = 'HL Road Seat Assembly' THEN 'Montagem do Banco de Estrada HL'
        WHEN Name = 'HL Road Seat/Saddle' THEN 'Banco de Estrada HL'
        WHEN Name = 'HL Road Tire' THEN 'Pneu de Estrada HL'
        WHEN Name = 'HL Shell' THEN 'Concha HL'
        WHEN Name = 'HL Spindle/Axle' THEN 'Eixo/Árvore de Manivela HL'
		WHEN Name = 'HL Touring Handlebars' THEN 'Guidão de Turismo HL'
        WHEN Name = 'HL Touring Seat Assembly' THEN 'Montagem do Banco de Turismo HL'
        WHEN Name = 'HL Touring Seat/Saddle' THEN 'Banco de Turismo HL'
        WHEN Name = 'Hydration Pack - 70 oz.' THEN 'Mochila de Hidratação - 70 oz.'
        WHEN Name = 'Keyed Washer' THEN 'Arruela com Chave'
        WHEN Name = 'LL Bottom Bracket' THEN 'Suporte Inferior LL'
        WHEN Name = 'LL Crankarm' THEN 'Braço de Pedivela LL'
        WHEN Name = 'LL Crankset' THEN 'Pedivela LL'
        WHEN Name = 'LL Fork' THEN 'Garfo LL'
        WHEN Name = 'LL Grip Tape' THEN 'Fita de Manopla LL'
        WHEN Name = 'LL Headset' THEN 'Conjunto de Direção LL'
        WHEN Name = 'LL Hub' THEN 'Cubo LL'
        WHEN Name = 'LL Mountain Front Wheel' THEN 'Roda Dianteira de Montanha LL'
        WHEN Name = 'LL Mountain Handlebars' THEN 'Guidão de Montanha LL'
        WHEN Name = 'LL Mountain Pedal' THEN 'Pedal de Montanha LL'
        WHEN Name = 'LL Mountain Rear Wheel' THEN 'Roda Traseira de Montanha LL'
        WHEN Name = 'LL Mountain Rim' THEN 'Aro de Montanha LL'
        WHEN Name = 'LL Mountain Seat Assembly' THEN 'Montagem do Banco de Montanha LL'
        WHEN Name = 'LL Mountain Seat/Saddle' THEN 'Banco de Montanha LL'
        WHEN Name = 'LL Mountain Tire' THEN 'Pneu de Montanha LL'
        WHEN Name = 'LL Nipple' THEN 'Bico de Mamilo LL'
        WHEN Name = 'LL Road Front Wheel' THEN 'Roda Dianteira de Estrada LL'
        WHEN Name = 'LL Road Handlebars' THEN 'Guidão de Estrada LL'
        WHEN Name = 'LL Road Pedal' THEN 'Pedal de Estrada LL'
        WHEN Name = 'LL Road Rear Wheel' THEN 'Roda Traseira de Estrada LL'
        WHEN Name = 'LL Road Rim' THEN 'Aro de Estrada LL'
        WHEN Name = 'LL Road Seat Assembly' THEN 'Montagem do Banco de Estrada LL'
        WHEN Name = 'LL Road Seat/Saddle' THEN 'Banco de Estrada LL'
        WHEN Name = 'LL Road Tire' THEN 'Pneu de Estrada LL'
        WHEN Name = 'LL Shell' THEN 'Concha LL'
        WHEN Name = 'LL Spindle/Axle' THEN 'Eixo de Pedivela LL'
        WHEN Name = 'LL Touring Handlebars' THEN 'Guidão de Turismo LL'
        WHEN Name = 'LL Touring Seat Assembly' THEN 'Montagem do Banco de Turismo LL'
        WHEN Name = 'LL Touring Seat/Saddle' THEN 'Banco de Turismo LL'
        WHEN Name = 'Lock Ring' THEN 'Anel de Trava'
        WHEN Name = 'Metal Angle' THEN 'Ângulo de Metal'
        WHEN Name = 'Metal Tread Plate' THEN 'Chapa de Degrau de Metal'
        WHEN Name = 'Minipump' THEN 'Bomba de Ar Portátil'
        WHEN Name LIKE 'ML Bottom Bracket' THEN 'Caixa de Pedivela ML'
        WHEN Name LIKE 'ML Crankarm' THEN 'Braço de Pedivela ML'
        WHEN Name LIKE 'ML Crankset' THEN 'Pedivela ML'
        WHEN Name = 'ML Fork' THEN 'Garfo ML'
        WHEN Name = 'ML Grip Tape' THEN 'Fita de Manopla ML'
        WHEN Name = 'ML Headset' THEN 'Conjunto de Direção ML'
        WHEN Name = 'ML Mountain Front Wheel' THEN 'Roda Dianteira de Montanha ML'
        WHEN Name = 'ML Mountain Handlebars' THEN 'Guidão de Montanha ML'
        WHEN Name = 'ML Mountain Pedal' THEN 'Pedal de Montanha ML'
        WHEN Name = 'ML Mountain Rear Wheel' THEN 'Roda Traseira de Montanha ML'
        WHEN Name = 'ML Mountain Rim' THEN 'Aro de Montanha ML'
        WHEN Name = 'ML Mountain Seat Assembly' THEN 'Montagem do Assento de Montanha ML'
        WHEN Name = 'ML Mountain Seat/Saddle' THEN 'Assento de Montanha ML'
        WHEN Name = 'ML Mountain Tire' THEN 'Pneu de Montanha ML'
        WHEN Name = 'ML Road Front Wheel' THEN 'Roda Dianteira de Estrada ML'
        WHEN Name = 'ML Road Handlebars' THEN 'Guidão de Estrada ML'
        WHEN Name = 'ML Road Pedal' THEN 'Pedal de Estrada ML'
        WHEN Name = 'ML Road Rear Wheel' THEN 'Roda Traseira de Estrada ML'
        WHEN Name = 'ML Road Rim' THEN 'Aro de Estrada ML'
        WHEN Name = 'ML Road Seat Assembly' THEN 'Montagem do Assento de Estrada ML'
        WHEN Name = 'ML Road Seat/Saddle' THEN 'Assento de Estrada ML'
        WHEN Name = 'ML Road Tire' THEN 'Pneu de Estrada ML'
        WHEN Name LIKE 'ML Touring Seat%' THEN 'Montagem do Assento de Turismo ML'
        WHEN Name LIKE 'ML Touring Seat/Saddle' THEN 'Assento de Turismo ML'
        WHEN Name = 'Mountain Bottle Cage' THEN 'Gaiola para Garrafa de Montanha'
        WHEN Name = 'Mountain End Caps' THEN 'Tampas de Extremidade de Montanha'
        WHEN Name = 'Mountain Pump' THEN 'Bomba de Montanha'
        WHEN Name = 'Mountain Tire Tube' THEN 'Tubo de Pneu de Montanha'
        WHEN Name = 'Paint - Black' THEN 'Tinta - Preta'
        WHEN Name = 'Paint - Blue' THEN 'Tinta - Azul'
        WHEN Name = 'Paint - Red' THEN 'Tinta - Vermelha'
        WHEN Name = 'Paint - Silver' THEN 'Tinta - Prata'
        WHEN Name = 'Paint - Yellow' THEN 'Tinta - Amarela'
        WHEN Name = 'Patch Kit/8 Patches' THEN 'Kit de Remendos/8 Remendos'
        WHEN Name = 'Pinch Bolt' THEN 'Parafuso de Aperto'
        WHEN Name = 'Rear Brakes' THEN 'Freios Traseiros'
        WHEN Name = 'Rear Derailleur' THEN 'Desviador Traseiro'
        WHEN Name = 'Rear Derailleur Cage' THEN 'Gaiola do Desviador Traseiro'
        WHEN Name = 'Reflector' THEN 'Refletor'
        WHEN Name = 'Road Bottle Cage' THEN 'Gaiola para Garrafa de Estrada'
        WHEN Name = 'Road End Caps' THEN 'Tampas de Extremidade de Estrada'
        WHEN Name = 'Road Tire Tube' THEN 'Tubo de Pneu de Estrada'
        WHEN Name = 'Seat Lug' THEN 'Aba de Selim'
        WHEN Name = 'Seat Post' THEN 'Canote de Selim'
        WHEN Name = 'Seat Stays' THEN 'Tirantes do Selim'
        WHEN Name = 'Seat Tube' THEN 'Tubo do Selim'
        WHEN Name = 'Spokes' THEN 'Raios'
        WHEN Name = 'Sport-100 Helmet, Black' THEN 'Capacete Esportivo-100, Preto'
        WHEN Name = 'Sport-100 Helmet, Blue' THEN 'Capacete Esportivo-100, Azul'
        WHEN Name = 'Sport-100 Helmet, Red' THEN 'Capacete Esportivo-100, Vermelho'
        WHEN Name = 'Steerer' THEN 'Garfo de Direção'
        WHEN Name = 'Stem' THEN 'Avanço'
        WHEN Name = 'Taillights - Battery-Powered' THEN 'Luzes Traseiras - Alimentadas por Bateria'
        WHEN Name = 'Tension Pulley' THEN 'Polia de Tensão'
        WHEN Name = 'Thin-Jam Hex Nut 1' THEN 'Porca Hexagonal de Encaixe Fino 1'
        WHEN Name = 'Top Tube' THEN 'Tubo Superior'
        WHEN Name = 'Touring End Caps' THEN 'Tampas de Extremidade para Turismo'
        WHEN Name = 'Touring Front Wheel' THEN 'Roda Dianteira para Turismo'
        WHEN Name = 'Touring Pedal' THEN 'Pedal para Turismo'
        WHEN Name = 'Touring Rear Wheel' THEN 'Roda Traseira para Turismo'
        WHEN Name = 'Touring Rim' THEN 'Aro para Turismo'
        WHEN Name = 'Touring Tire' THEN 'Pneu para Turismo'
        WHEN Name = 'Touring Tire Tube' THEN 'Tubo do Pneu para Turismo'
        WHEN Name = 'Touring-Panniers, Large' THEN 'Alforjes para Turismo, Grande'
        WHEN Name = 'Water Bottle - 30 oz.' THEN 'Garrafa de Água - 30 oz.'
        WHEN Name = 'Women''s Mountain Shorts, L' THEN 'Bermudas de Montanha para Mulheres, G'
        WHEN Name = 'Women''s Mountain Shorts, M' THEN 'Bermudas de Montanha para Mulheres, M'
        WHEN Name = 'Women''s Mountain Shorts, S' THEN 'Bermudas de Montanha para Mulheres, P'
        WHEN Name = 'Women''s Tights, L' THEN 'Calças Justas para Mulheres, G'
        WHEN Name = 'Women''s Tights, M' THEN 'Calças Justas para Mulheres, M'
        WHEN Name = 'Women''s Tights, S' THEN 'Calças Justas para Mulheres, P'
		ELSE Name
    END AS Nome,
    ProductNumber AS NumeroProduto,
    MakeFlag AS FlagFabricacaoPropria,
    FinishedGoodsFlag AS FlagProdutoAcabado,
    Color AS Cor,
    SafetyStockLevel AS NivelEstoqueSeguranca,
    ReorderPoint AS PontoReposicao,
    StandardCost AS CustoPadrao,
    ListPrice AS PrecoLista,
    Size AS Tamanho,
    SizeUnitMeasureCode AS CodigoUnidadeMedidaTamanho,
    WeightUnitMeasureCode AS CodigoUnidadeMedidaPeso,
    Weight AS Peso,
    DaysToManufacture AS DiasFabricacao,
    ProductLine AS LinhaProduto,
    Class AS Classe,
    Style AS Estilo,
    ProductSubcategoryID AS IDSubcategoriaProduto,
    ProductModelID AS IDModeloProduto,
    SellStartDate AS DataInicioVenda,
    SellEndDate AS DataFimVenda,
    DiscontinuedDate AS DataDescontinuacao,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.Produto
FROM Production.Product

ALTER SCHEMA Producao TRANSFER Produto

SELECT 
    ProductCategoryID AS IDCategoriaProduto,
    CASE 
        WHEN Name = 'Accessories' THEN 'Acessórios'
        WHEN Name = 'Bikes' THEN 'Bicicletas'
        WHEN Name = 'Clothing' THEN 'Vestuário'
        WHEN Name = 'Components' THEN 'Componentes'
    END AS Nome,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.CategoriaProduto
FROM Production.ProductCategory

ALTER SCHEMA Producao TRANSFER CategoriaProduto

SELECT 
    ProductID AS IDProduto,
    StartDate AS DataInicio,
    EndDate AS DataFim,
    StandardCost AS CustoPadrao,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.CustoProduto
FROM Production.ProductCostHistory

ALTER SCHEMA Producao TRANSFER CustoProduto

SELECT 
    ProductDescriptionID AS IDDescricaoProduto,
    Description AS Descricao,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.DescricaoProduto
FROM Production.ProductDescription

ALTER SCHEMA Producao TRANSFER DescricaoProduto

SELECT 
    ProductID AS IDProduto,
    DocumentNode AS NoDocumento,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.DocumentoProduto
FROM Production.ProductDocument

ALTER SCHEMA Producao TRANSFER DocumentoProduto

SELECT 
    ProductID AS IDProduto,
    LocationID AS IDLocalizacao,
    Shelf AS Prateleira,
    Bin AS Caixa,
    Quantity AS Quantidade,
    rowguid AS GUIDRegistro,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.LocalizacaoProduto
FROM Production.ProductInventory

ALTER SCHEMA Producao TRANSFER LocalizacaoProduto

SELECT 
    ProductID AS IDProduto,
    StartDate AS DataInicio,
    EndDate AS DataFim,
    ListPrice AS PrecoLista,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.PrecoListaProduto
FROM Production.ProductListPriceHistory

ALTER SCHEMA Producao TRANSFER PrecoListaProduto

SELECT 
    ProductModelID AS IDModeloProduto,
     CASE Name
           WHEN 'Classic Vest' THEN 'Colete Clássico'
           WHEN 'Cycling Cap' THEN 'Boné de Ciclismo'
           WHEN 'Full-Finger Gloves' THEN 'Luvas de Dedo Inteiro'
           WHEN 'Half-Finger Gloves' THEN 'Luvas de Meio Dedo'
           WHEN 'HL Mountain Frame' THEN 'Quadro de Montanha HL'
           WHEN 'HL Road Frame' THEN 'Quadro de Estrada HL'
           WHEN 'HL Touring Frame' THEN 'Quadro de Turismo HL'
           WHEN 'LL Mountain Frame' THEN 'Quadro de Montanha LL'
           WHEN 'LL Road Frame' THEN 'Quadro de Estrada LL'
           WHEN 'LL Touring Frame' THEN 'Quadro de Turismo LL'
           WHEN 'Long-Sleeve Logo Jersey' THEN 'Camiseta de Manga Longa com Logotipo'
           WHEN 'Men''s Bib-Shorts' THEN 'Bermudas para Homens'
           WHEN 'Men''s Sports Shorts' THEN 'Shorts Esportivos para Homens'
           WHEN 'ML Mountain Frame' THEN 'Quadro de Montanha ML'
           WHEN 'ML Mountain Frame-W' THEN 'Quadro de Montanha ML-W'
           WHEN 'ML Road Frame' THEN 'Quadro de Estrada ML'
           WHEN 'ML Road Frame-W' THEN 'Quadro de Estrada ML-W'
           WHEN 'Mountain Bike Socks' THEN 'Meias para Bicicleta de Montanha'
           WHEN 'Mountain-100' THEN 'Montanha-100'
           WHEN 'Mountain-200' THEN 'Montanha-200'
           WHEN 'Mountain-300' THEN 'Montanha-300'
           WHEN 'Mountain-400-W' THEN 'Montanha-400-W'
           WHEN 'Mountain-500' THEN 'Montanha-500'
           WHEN 'Racing Socks' THEN 'Meias de Corrida'
           WHEN 'Road-150' THEN 'Estrada-150'
           WHEN 'Road-250' THEN 'Estrada-250'
           WHEN 'Road-350-W' THEN 'Estrada-350-W'
           WHEN 'Road-450' THEN 'Estrada-450'
           WHEN 'Road-550-W' THEN 'Estrada-550-W'
           WHEN 'Road-650' THEN 'Estrada-650'
           WHEN 'Road-750' THEN 'Estrada-750'
           WHEN 'Short-Sleeve Classic Jersey' THEN 'Camiseta Clássica de Manga Curta'
           WHEN 'Sport-100' THEN 'Esporte-100'
           WHEN 'Touring-1000' THEN 'Turismo-1000'
           WHEN 'Touring-2000' THEN 'Turismo-2000'
           WHEN 'Touring-3000' THEN 'Turismo-3000'
           WHEN 'Women''s Mountain Shorts' THEN 'Shorts de Montanha para Mulheres'
           WHEN 'Women''s Tights' THEN 'Leggings para Mulheres'
		   WHEN 'Mountain-400' THEN 'Montanha-400'
           WHEN 'Road-550' THEN 'Estrada-550'
           WHEN 'Road-350' THEN 'Estrada-350'
           WHEN 'LL Mountain Front Wheel' THEN 'Roda Dianteira de Montanha LL'
           WHEN 'Touring Rear Wheel' THEN 'Roda Traseira de Turismo'
           WHEN 'Touring Front Wheel' THEN 'Roda Dianteira de Turismo'
           WHEN 'ML Mountain Front Wheel' THEN 'Roda Dianteira de Montanha ML'
           WHEN 'HL Mountain Front Wheel' THEN 'Roda Dianteira de Montanha HL'
           WHEN 'LL Touring Handlebars' THEN 'Guidão de Turismo LL'
           WHEN 'HL Touring Handlebars' THEN 'Guidão de Turismo HL'
           WHEN 'LL Road Front Wheel' THEN 'Roda Dianteira de Estrada LL'
           WHEN 'ML Road Front Wheel' THEN 'Roda Dianteira de Estrada ML'
           WHEN 'HL Road Front Wheel' THEN 'Roda Dianteira de Estrada HL'
           WHEN 'LL Mountain Handlebars' THEN 'Guidão de Montanha LL'
           WHEN 'Touring Pedal' THEN 'Pedal de Turismo'
           WHEN 'ML Mountain Handlebars' THEN 'Guidão de Montanha ML'
           WHEN 'HL Mountain Handlebars' THEN 'Guidão de Montanha HL'
           WHEN 'LL Road Handlebars' THEN 'Guidão de Estrada LL'
           WHEN 'ML Road Handlebars' THEN 'Guidão de Estrada ML'
           WHEN 'HL Road Handlebars' THEN 'Guidão de Estrada HL'
           WHEN 'LL Headset' THEN 'Caixa de Direção de Montanha LL'
           WHEN 'ML Headset' THEN 'Caixa de Direção de Montanha ML'
           WHEN 'HL Headset' THEN 'Caixa de Direção de Montanha HL'
           WHEN 'LL Mountain Pedal' THEN 'Pedal de Montanha LL'
           WHEN 'ML Mountain Pedal' THEN 'Pedal de Montanha ML'
           WHEN 'HL Mountain Pedal' THEN 'Pedal de Montanha HL'
           WHEN 'ML Touring Seat/Saddle' THEN 'Selim de Turismo ML'
           WHEN 'LL Touring Seat/Saddle' THEN 'Selim de Turismo LL'
           WHEN 'HL Touring Seat/Saddle' THEN 'Selim de Turismo HL'
           WHEN 'LL Road Pedal' THEN 'Pedal de Estrada LL'
           WHEN 'ML Road Pedal' THEN 'Pedal de Estrada ML'
           WHEN 'HL Road Pedal' THEN 'Pedal de Estrada HL'
           WHEN 'LL Mountain Seat/Saddle 1' THEN 'Selim de Montanha LL 1'
           WHEN 'ML Mountain Seat/Saddle 1' THEN 'Selim de Montanha ML 1'
           WHEN 'HL Mountain Seat/Saddle 1' THEN 'Selim de Montanha HL 1'
		   WHEN 'LL Road Seat/Saddle 2' THEN 'Selim de Estrada LL 2'
           WHEN 'ML Road Seat/Saddle 1' THEN 'Selim de Estrada ML 1'
           WHEN 'HL Road Seat/Saddle 1' THEN 'Selim de Estrada HL 1'
           WHEN 'ML Road Rear Wheel' THEN 'Roda Traseira de Estrada ML'
           WHEN 'HL Road Rear Wheel' THEN 'Roda Traseira de Estrada HL'
           WHEN 'LL Mountain Seat/Saddle 2' THEN 'Selim de Montanha LL 2'
           WHEN 'ML Mountain Seat/Saddle 2' THEN 'Selim de Montanha ML 2'
           WHEN 'HL Mountain Seat/Saddle 2' THEN 'Selim de Montanha HL 2'
           WHEN 'LL Road Seat/Saddle 1' THEN 'Selim de Estrada LL 1'
           WHEN 'ML Road Seat/Saddle 2' THEN 'Selim de Estrada ML 2'
           WHEN 'HL Road Seat/Saddle 2' THEN 'Selim de Estrada HL 2'
           WHEN 'LL Mountain Tire' THEN 'Pneu de Montanha LL'
           WHEN 'ML Mountain Tire' THEN 'Pneu de Montanha ML'
           WHEN 'HL Mountain Tire' THEN 'Pneu de Montanha HL'
           WHEN 'LL Road Tire' THEN 'Pneu de Estrada LL'
           WHEN 'ML Road Tire' THEN 'Pneu de Estrada ML'
           WHEN 'HL Road Tire' THEN 'Pneu de Estrada HL'
           WHEN 'Touring Tire' THEN 'Pneu de Turismo'
           WHEN 'Mountain Tire Tube' THEN 'Câmara de Ar para Pneu de Montanha'
           WHEN 'Road Tire Tube' THEN 'Câmara de Ar para Pneu de Estrada'
           WHEN 'Touring Tire Tube' THEN 'Câmara de Ar para Pneu de Turismo'
           WHEN 'LL Bottom Bracket' THEN 'Movimento Central de Montanha LL'
           WHEN 'ML Bottom Bracket' THEN 'Movimento Central de Montanha ML'
           WHEN 'HL Bottom Bracket' THEN 'Movimento Central de Montanha HL'
           WHEN 'Chain' THEN 'Corrente'
           WHEN 'LL Crankset' THEN 'Pedivela de Montanha LL'
           WHEN 'ML Crankset' THEN 'Pedivela de Montanha ML'
           WHEN 'HL Crankset' THEN 'Pedivela de Montanha HL'
           WHEN 'Front Brakes' THEN 'Freios Dianteiros'
           WHEN 'Front Derailleur' THEN 'Câmbio Dianteiro'
           WHEN 'LL Fork' THEN 'Garfo de Montanha LL'
		   WHEN 'ML Fork' THEN 'Garfo ML'
           WHEN 'HL Fork' THEN 'Garfo HL'
           WHEN 'Hydration Pack' THEN 'Mochila de Hidratação'
           WHEN 'Taillight' THEN 'Lanterna Traseira'
           WHEN 'Headlights - Dual-Beam' THEN 'Faróis - Duplo Facho'
           WHEN 'Headlights - Weatherproof' THEN 'Faróis - À Prova de Intempéries'
           WHEN 'Water Bottle' THEN 'Garrafa de Água'
           WHEN 'Mountain Bottle Cage' THEN 'Suporte de Garrafa para Montanha'
           WHEN 'Road Bottle Cage' THEN 'Suporte de Garrafa para Estrada'
           WHEN 'Patch kit' THEN 'Kit de Remendos'
           WHEN 'Cable Lock' THEN 'Trava de Cabo'
           WHEN 'Minipump' THEN 'Bomba de Ar Pequena'
           WHEN 'Mountain Pump' THEN 'Bomba de Ar para Montanha'
           WHEN 'Hitch Rack - 4-Bike' THEN 'Rack de Engate - 4 Bicicletas'
           WHEN 'Bike Wash' THEN 'Lavagem de Bicicleta'
           WHEN 'Touring-Panniers' THEN 'Alforjes de Turismo'
           WHEN 'Fender Set - Mountain' THEN 'Conjunto de Para-lamas para Montanha'
           WHEN 'All-Purpose Bike Stand' THEN 'Suporte de Bicicleta Multiuso'
           WHEN 'LL Mountain Rear Wheel' THEN 'Roda Traseira de Montanha LL'
           WHEN 'ML Mountain Rear Wheel' THEN 'Roda Traseira de Montanha ML'
           WHEN 'HL Mountain Rear Wheel' THEN 'Roda Traseira de Montanha HL'
           WHEN 'LL Road Rear Wheel' THEN 'Roda Traseira de Estrada LL'
           WHEN 'Rear Derailleur' THEN 'Câmbio Traseiro'
           WHEN 'Rear Brakes' THEN 'Freios Traseiros'
		   END AS Nome,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.ModeloProduto
FROM Production.ProductModel

ALTER SCHEMA Producao TRANSFER ModeloProduto

SELECT 
    ProductModelID AS IDModeloProduto,
    IllustrationID AS IDIlustracao,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.ModeloProdutoIlustracao
FROM Production.ProductModelIllustration

ALTER SCHEMA Producao TRANSFER ModeloProdutoIlustracao

SELECT 
    ProductModelID AS IDModeloProduto,
    ProductDescriptionID AS IDDescricaoProduto,
    CultureID AS IDCultura,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.ModeloDescricaoProdutoCultural
FROM Production.ProductModelProductDescriptionCulture;

ALTER SCHEMA Producao TRANSFER ModeloDescricaoProdutoCultural

SELECT 
    ProductPhotoID AS IDFotoProduto,
    ThumbNailPhoto AS FotoMiniatura,
    ThumbnailPhotoFileName AS NomeArquivoMiniatura,
    LargePhoto AS FotoGrande,
    LargePhotoFileName AS NomeArquivoGrande,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.FotoProduto
FROM Production.ProductPhoto

ALTER SCHEMA Producao TRANSFER FotoProduto

SELECT 
    ProductID AS IDProduto,
    ProductPhotoID AS IDFotoProduto,
    'Primary' AS Principal,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.FotoPrincipalProduto
FROM Production.ProductProductPhoto

ALTER SCHEMA Producao TRANSFER FotoPrincipalProduto

SELECT 
    ProductReviewID AS IDRevisaoProduto,
    ProductID AS IDProduto,
    ReviewerName AS NomeRevisor,
    ReviewDate AS DataRevisao,
    EmailAddress AS EnderecoEmail,
    Rating AS Avaliacao,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.RevisaoProduto
FROM Production.ProductReview

ALTER SCHEMA Producao TRANSFER RevisaoProduto

SELECT 
    ProductSubcategoryID AS IDSubcategoriaProduto,
    ProductCategoryID AS IDCategoriaProduto,
    CASE Name
           WHEN 'Bib-Shorts' THEN 'Bermudas de Ciclismo'
           WHEN 'Bike Racks' THEN 'Racks para Bicicletas'
           WHEN 'Bike Stands' THEN 'Suportes para Bicicletas'
           WHEN 'Bottles and Cages' THEN 'Garrafas e Suportes'
           WHEN 'Bottom Brackets' THEN 'Movimentos Centrais'
           WHEN 'Brakes' THEN 'Freios'
           WHEN 'Caps' THEN 'Bonés'
           WHEN 'Chains' THEN 'Correntes'
           WHEN 'Cleaners' THEN 'Limpadores'
           WHEN 'Cranksets' THEN 'Pedivelas'
           WHEN 'Derailleurs' THEN 'Câmbios'
           WHEN 'Fenders' THEN 'Para-lamas'
           WHEN 'Forks' THEN 'Garfos'
           WHEN 'Gloves' THEN 'Luvas'
           WHEN 'Handlebars' THEN 'Guidões'
           WHEN 'Headsets' THEN 'Movimentos de Direção'
           WHEN 'Helmets' THEN 'Capacetes'
           WHEN 'Hydration Packs' THEN 'Mochilas de Hidratação'
           WHEN 'Jerseys' THEN 'Camisetas'
           WHEN 'Lights' THEN 'Faróis'
           WHEN 'Locks' THEN 'Travas'
           WHEN 'Mountain Bikes' THEN 'Bicicletas de Montanha'
           WHEN 'Mountain Frames' THEN 'Quadros de Montanha'
           WHEN 'Panniers' THEN 'Alforjes'
           WHEN 'Pedals' THEN 'Pedais'
           WHEN 'Pumps' THEN 'Bomba de Ar'
           WHEN 'Road Bikes' THEN 'Bicicletas de Estrada'
           WHEN 'Road Frames' THEN 'Quadros de Estrada'
           WHEN 'Saddles' THEN 'Selins'
           WHEN 'Shorts' THEN 'Bermudas'
           WHEN 'Socks' THEN 'Meias'
           WHEN 'Tights' THEN 'Leggings'
           WHEN 'Tires and Tubes' THEN 'Pneus e Câmaras de Ar'
           WHEN 'Touring Bikes' THEN 'Bicicletas de Turismo'
           WHEN 'Touring Frames' THEN 'Quadros de Turismo'
           WHEN 'Vests' THEN 'Coletes'
           WHEN 'Wheels' THEN 'Rodas'
	END as Nome,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.SubcategoriaProduto
FROM Production.ProductSubcategory

ALTER SCHEMA Producao TRANSFER SubcategoriaProduto

SELECT 
    ScrapReasonID AS IDMotivoSucata,
    CASE Name
           WHEN 'Brake assembly not as ordered' THEN 'Montagem do freio não conforme ao pedido'
           WHEN 'Color incorrect' THEN 'Cor incorreta'
           WHEN 'Gouge in metal' THEN 'Risco no metal'
           WHEN 'Drill pattern incorrect' THEN 'Padrão de furação incorreto'
           WHEN 'Drill size too large' THEN 'Tamanho da broca muito grande'
           WHEN 'Drill size too small' THEN 'Tamanho da broca muito pequeno'
           WHEN 'Handling damage' THEN 'Danos no manuseio'
           WHEN 'Paint process failed' THEN 'Falha no processo de pintura'
           WHEN 'Primer process failed' THEN 'Falha no processo de primer'
           WHEN 'Seat assembly not as ordered' THEN 'Montagem do assento não conforme ao pedido'
           WHEN 'Stress test failed' THEN 'Teste de estresse falhou'
           WHEN 'Thermoform temperature too high' THEN 'Temperatura de termoformação muito alta'
           WHEN 'Thermoform temperature too low' THEN 'Temperatura de termoformação muito baixa'
           WHEN 'Trim length too long' THEN 'Comprimento do acabamento muito longo'
           WHEN 'Trim length too short' THEN 'Comprimento do acabamento muito curto'
           WHEN 'Wheel misaligned' THEN 'Roda desalinhada'
	END as Nome,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.MotivoSucata
FROM Production.ScrapReason;

ALTER SCHEMA Producao TRANSFER MotivoSucata

SELECT 
    TransactionID AS IDTransacao,
    ProductID AS IDProduto,
    ReferenceOrderID AS IDPedidoReferencia,
    ReferenceOrderLineID AS IDLinhaPedidoReferencia,
    TransactionDate AS DataTransacao,
    TransactionType AS TipoTransacao,
    Quantity AS Quantidade,
    ActualCost AS CustoReal,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.HistoricoTransacao
FROM Production.TransactionHistory

ALTER SCHEMA Producao TRANSFER HistoricoTransacao

SELECT 
    TransactionID AS IDTransacao,
    ProductID AS IDProduto,
    ReferenceOrderID AS IDPedidoReferencia,
    ReferenceOrderLineID AS IDLinhaPedidoReferencia,
    TransactionDate AS DataTransacao,
    TransactionType AS TipoTransacao,
    Quantity AS Quantidade,
    ActualCost AS CustoReal,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.HistoricoTransacaoArquivo
FROM Production.TransactionHistoryArchive

ALTER SCHEMA Producao TRANSFER HistoricoTransacaoArquivo

SELECT 
    UnitMeasureCode AS CodigoUnidadeMedida,
    CASE Name
           WHEN 'Boxes' THEN 'Caixas'
           WHEN 'Bottle' THEN 'Garrafa'
           WHEN 'Celsius' THEN 'Celsius'
           WHEN 'Canister' THEN 'Recipiente'
           WHEN 'Carton' THEN 'Caixa de papelão'
           WHEN 'Cubic meters' THEN 'Metros cúbicos'
           WHEN 'Cubic centimeter' THEN 'Centímetro cúbico'
           WHEN 'Cubic decimeter' THEN 'Decímetro cúbico'
           WHEN 'Centimeter' THEN 'Centímetro'
           WHEN 'Square centimeter' THEN 'Centímetro quadrado'
           WHEN 'Crate' THEN 'Caixa'
           WHEN 'Case' THEN 'Caixa'
           WHEN 'Container' THEN 'Contêiner'
           WHEN 'Decimeter' THEN 'Decímetro'
           WHEN 'Dozen' THEN 'Dúzia'
           WHEN 'Each' THEN 'Cada'
           WHEN 'Cubic foot' THEN 'Pé cúbico'
           WHEN 'Gram' THEN 'Grama'
           WHEN 'Gallon' THEN 'Galão'
           WHEN 'Inch' THEN 'Polegada'
           WHEN 'Kilogram' THEN 'Quilograma'
           WHEN 'Kilogram/cubic meter' THEN 'Quilograma por metro cúbico'
           WHEN 'Kilometer' THEN 'Quilômetro'
           WHEN 'Kiloton' THEN 'Quilotonelada'
           WHEN 'Liter' THEN 'Litro'
           WHEN 'US pound' THEN 'Libra'
           WHEN 'Meter' THEN 'Metro'
           WHEN 'Square meter' THEN 'Metro quadrado'
           WHEN 'Cubic meter' THEN 'Metro cúbico'
           WHEN 'Milligram' THEN 'Miligrama'
           WHEN 'Milliliter' THEN 'Mililitro'
           WHEN 'Millimeter' THEN 'Milímetro'
           WHEN 'Ounces' THEN 'Onças'
           WHEN 'Pack' THEN 'Pacote'
           WHEN 'Pallet' THEN 'Palete'
           WHEN 'Piece' THEN 'Peça'
           WHEN 'Percentage' THEN 'Porcentagem'
           WHEN 'Pint, US liquid' THEN 'Pinta líquida, US'
	END as Nome,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.CodigoUnidadeMedida
FROM Production.UnitMeasure;

ALTER SCHEMA Producao TRANSFER CodigoUnidadeMedida

SELECT 
    WorkOrderID AS IDOrdemTrabalho,
    ProductID AS IDProduto,
    OrderQty AS QuantidadePedido,
    StockedQty AS QuantidadeEstocada,
    ScrappedQty AS QuantidadeDescartada,
    StartDate AS DataInicio,
    EndDate AS DataFim,
    DueDate AS DataLimite,
    ScrapReasonID AS IDMotivoDescarte,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.OrdemTrabalho
FROM Production.WorkOrder;

ALTER SCHEMA Producao TRANSFER OrdemTrabalho

SELECT 
    WorkOrderID AS IDOrdemProducao,
    ProductID AS IDProduto,
    OperationSequence AS SequenciaOperacao,
    LocationID AS IDLocalizacao,
    ScheduledStartDate AS DataInicioPlanejada,
    ScheduledEndDate AS DataFimPlanejada,
    ActualStartDate AS DataInicioReal,
    ActualEndDate AS DataFimReal,
    ActualResourceHrs AS HorasRecursosReais,
    PlannedCost AS CustoPlanejado,
    ActualCost AS CustoReal,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.OrdemProducaoOperacao
FROM Production.WorkOrderRouting

ALTER SCHEMA Producao TRANSFER OrdemProducaoOperacao

SELECT 
    ProductID AS IDProduto,
    BusinessEntityID AS IDEntidadeNegocio,
    AverageLeadTime AS TempoMedioEntrega,
    StandardPrice AS PrecoPadrao,
    LastReceiptCost AS CustoUltimoRecebimento,
    LastReceiptDate AS DataUltimoRecebimento,
    MinOrderQty AS QuantidadeMinimaPedido,
    MaxOrderQty AS QuantidadeMaximaPedido,
    OnOrderQty AS QuantidadePedido,
    UnitMeasureCode AS CodigoUnidadeMedida,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.ProdutoFornecedor
FROM Purchasing.ProductVendor;

EXEC ('CREATE SCHEMA Compras')
ALTER SCHEMA Compras TRANSFER ProdutoFornecedor

SELECT 
    PurchaseOrderID AS IDCompra,
    PurchaseOrderDetailID AS IDDetalheCompra,
    DueDate AS DataPrevistaRecebimento,
    OrderQty AS QuantidadePedido,
    ProductID AS IDProduto,
    UnitPrice AS PrecoUnitario,
    LineTotal AS TotalLinha,
    ReceivedQty AS QuantidadeRecebida,
    RejectedQty AS QuantidadeRejeitada,
    StockedQty AS QuantidadeEstocada,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.DetalhePedidoCompra
FROM Purchasing.PurchaseOrderDetail;		

ALTER SCHEMA Compras TRANSFER DetalhePedidoCompra

SELECT 
    PurchaseOrderID AS IDPedidoCompra,
    RevisionNumber AS NumeroRevisao,
    Status AS Status,
    EmployeeID AS IDEmpregado,
    VendorID AS IDFornecedor,
    ShipMethodID AS IDMetodoEnvio,
    OrderDate AS DataPedido,
    ShipDate AS DataEnvio,
    SubTotal AS Subtotal,
    TaxAmt AS ValorImposto,
    Freight AS Frete,
    TotalDue AS TotalDevido,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.InformacoesPedidoCompra
FROM Purchasing.PurchaseOrderHeader

ALTER SCHEMA Compras TRANSFER InformacoesPedidoCompra

SELECT 
    ShipMethodID AS IDMetodoEnvio,
    Name AS Nome,
    ShipBase AS BaseEnvio,
    ShipRate AS TaxaEnvioPorPeso,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.MetodoEnvio
FROM Purchasing.ShipMethod;

ALTER SCHEMA Compras TRANSFER MetodoEnvio

SELECT 
    BusinessEntityID AS IDFornecedor,
    AccountNumber AS NumeroConta,
    Name AS NomeEmpresa,
    CreditRating AS ClassificacaoCredito,
    PreferredVendorStatus AS StatusFornecedorPreferencial,
    ActiveFlag AS FlagAtivo,
    PurchasingWebServiceURL AS URLWebServiceCompras,
    ModifiedDate AS DataModificacao
INTO AdventureWorksPT.dbo.Fornecedor
FROM Purchasing.Vendor;

ALTER SCHEMA Compras TRANSFER Fornecedor

-- AGORA VAMOS CRIAR OS RELACIONAMENTOS.

ALTER TABLE RecursosHumanos.HistoricoDepartamentoFuncionario
ADD CONSTRAINT PK_HistoricoDepartamentoFuncionario_IDEntidadeNegocio_DataInicio_IDDepartamento PRIMARY KEY (IDEntidadeNegocio,DataInicio,IDDepartamento)

ALTER TABLE RecursosHumanos.HistoricoPagamento
ADD CONSTRAINT PK_HistoricoPagamento_IDEntidadeNegocio_DataAlteracaoSalario PRIMARY KEY (IDEntidadeNegocio,DataAlteracaoSalario)

ALTER TABLE RecursosHumanos.HistoricoPagamento
ADD CONSTRAINT FK_HistoricoPagamento_Funcionario_IDEntidadeNegocio FOREIGN KEY (IDEntidadeNegocio) REFERENCES RecursosHumanos.Funcionario(IDEntidadeNegocio)

ALTER TABLE RecursosHumanos.HistoricoDepartamentoFuncionario
ADD CONSTRAINT PK_HistoricoDepartamentoFuncionario_IDEntidadeNegocio_DataInicio_IDDepartamento_IDTurno PRIMARY KEY (IDEntidadeNegocio,DataInicio,IDDepartamento,IDTurno)

ALTER TABLE RecursosHumanos.CandidatoVaga
ADD CONSTRAINT PK_CandidatoVaga_IDEntidadeNegocio_IDCandidato PRIMARY KEY (IDCandidato)

ALTER TABLE Pessoa.Endereco
ADD CONSTRAINT PK_Endereco_IDEndereco PRIMARY KEY (IDEndereco)

ALTER TABLE Pessoa.EstadoProvincia
ADD CONSTRAINT PK_Endereco_IDEstadoProvincia PRIMARY KEY (IDEstadoProvincia)

ALTER TABLE Pessoa.Endereco
ADD CONSTRAINT FK_Endereco_EstadoProvincia FOREIGN KEY (IDEstadoProvincia) REFERENCES Pessoa.EstadoProvincia(IDEstadoProvincia)

ALTER TABLE Pessoa.TipoEndereco
ADD CONSTRAINT PK_TipoEndereco_IDTipoEndereco PRIMARY KEY (IDTipoEndereco)

ALTER TABLE Pessoa.EntidadeNegocio
ADD CONSTRAINT PK_EntidadeNegocio_IDEntidadeNegocio PRIMARY KEY (IDEntidadeNegocio)

ALTER TABLE Pessoa.EnderecoEntidadeNegocio
ADD CONSTRAINT PK_EnderecoEntidadeNegocio_IDEntidadeNegocio_IDEndereco_IDTipoEndereco PRIMARY KEY (IDEntidadeNegocio,IDEndereco,IDTipoEndereco)

ALTER TABLE Pessoa.EnderecoEntidadeNegocio
ADD CONSTRAINT FK_EnderecoEntidadeNegocio_TipoEndereco_IDTipoEndereco FOREIGN KEY (IDTipoEndereco) REFERENCES Pessoa.TipoEndereco(IDTipoEndereco)

ALTER TABLE Pessoa.EnderecoEntidadeNegocio
ADD CONSTRAINT FK_EnderecoEntidadeNegocio_EntidadeNegocio_IDEntidadeNegocio FOREIGN KEY (IDEntidadeNegocio) REFERENCES Pessoa.EntidadeNegocio(IDEntidadeNegocio)

ALTER TABLE Pessoa.EnderecoEntidadeNegocio
ADD CONSTRAINT FK_EnderecoEntidadeNegocio_Endereco_IDEndereco FOREIGN KEY (IDEndereco) REFERENCES Pessoa.Endereco(IDEndereco)

-- Inicio tabela Pessoa.ContatoEntidadeNegocio --
ALTER TABLE Pessoa.ContatoEntidadeNegocio
ADD CONSTRAINT PK_ContatoEntidadeNegocio_IDEntidadeNegocio_IDPessoa_IDTipoContato PRIMARY KEY (IDEntidadeNegocio,IDPessoa,IDTipoContato)

ALTER TABLE Pessoa.ContatoEntidadeNegocio
ADD CONSTRAINT FK_ContatoEntidadeNegocio_EntidadeNegocio_IDEntidadeNegocio FOREIGN KEY (IDEntidadeNegocio) REFERENCES Pessoa.EntidadeNegocio(IDEntidadeNegocio)

ALTER TABLE Pessoa.ContatoEntidadeNegocio
ADD CONSTRAINT FK_ContatoEntidadeNegocio_TipoContato_IDTipoContato FOREIGN KEY (IDTipoContato) REFERENCES Pessoa.TipoContato(IDTipoContato)

ALTER TABLE Pessoa.ContatoEntidadeNegocio
ADD CONSTRAINT FK_ContatoEntidadeNegocio_Pessoa_IDPessoa FOREIGN KEY (IDPessoa) REFERENCES Pessoa.Pessoa(IDEntidadeNegocio)
-- Fim tabela Pessoa.ContatoEntidadeNegocio --

-- Inicio tabela Pessoa.TipoContato --
ALTER TABLE Pessoa.TipoContato
ADD CONSTRAINT PK_IDTipoContato PRIMARY KEY (IDTipoContato)
-- Fim tabela Pessoa.TipoContato --

-- adicionando chave estrangeira na tabela pessoa.pessoa, relacionando a tabela EntidadeNegocio.
ALTER TABLE Pessoa.Pessoa
ADD CONSTRAINT PK_Pessoa_EntidadeNegocio_IDEntidadeNegocio FOREIGN KEY (IDEntidadeNegocio) REFERENCES Pessoa.EntidadeNegocio(IDEntidadeNegocio)

-- adicionando chave estrangeira na tabela TelefonePessoa, relacionando a tabela TipoNumeroTelefone.
ALTER TABLE Pessoa.TelefonePessoa
ADD CONSTRAINT FK_TelefonePessoa_TipoNumeroTelefone_NumeroID FOREIGN KEY (NumeroID) REFERENCES Pessoa.TipoNumeroTelefone (NumeroID)

ALTER TABLE Pessoa.EstadoProvincia
ADD CONSTRAINT FK_EstadoProvincia_RegiaoPais_CodigoPaisRegiao FOREIGN KEY(CodigoPaisRegiao) REFERENCES Pessoa.RegiaoPais(CodigoPaisRegiao)

-- adicionando chave primária para conseguir referenciar a tabela EstadoProvincia e TerritorioVendas
ALTER TABLE Vendas.TerritorioVendas
ADD CONSTRAINT PK_IdTerritorioVendas PRIMARY KEY (IDTerritorioVendas)

ALTER TABLE Pessoa.EstadoProvincia
ADD CONSTRAINT FK_EstadoProvincia_TerritorioVendas_IDTerritorioVendas FOREIGN KEY(IDTerritorio) REFERENCES Vendas.TerritorioVendas(IDTerritorioVendas)

ALTER TABLE Producao.ListaMateriais
ADD CONSTRAINT PK_IDListaMateriais PRIMARY KEY (IDListaMateriais)

ALTER TABLE Producao.Produto
ADD CONSTRAINT PK_Produto_IDProduto PRIMARY KEY (IDProduto)

ALTER TABLE Producao.ListaMateriais
ADD CONSTRAINT FK_ListaMateriais_Produto_IDComponente FOREIGN KEY(IDComponente) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Producao.ListaMateriais
ADD CONSTRAINT FK_ListaMateriais_Produto_IDProdutoMontagem FOREIGN KEY(IDProdutoMontagem) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Producao.Produto
ADD CONSTRAINT PK_Produto_IDProduto PRIMARY KEY (IDProduto)

ALTER TABLE Producao.ListaMateriais
ADD CONSTRAINT FK_ListaMateriais_Produto_IDProdutoMontagem FOREIGN KEY(IDProdutoMontagem) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Producao.CodigoUnidadeMedida
ADD CONSTRAINT PK_CodigoUnidadeMedida_CodigoUnidadeMedida PRIMARY KEY (CodigoUnidadeMedida)

ALTER TABLE Producao.ListaMateriais
ADD CONSTRAINT FK_ListaMateriais_CodigoUnidadeMedida_CodigoUnidadeMedida FOREIGN KEY(CodigoUnidadeMedida) REFERENCES Producao.CodigoUnidadeMedida(CodigoUnidadeMedida)

ALTER TABLE Producao.Cultura
ADD CONSTRAINT PK_Cultura_IDCultura PRIMARY KEY (IDCultura)

ALTER TABLE Producao.Documento
ADD CONSTRAINT PK_Documento_NoDocumento PRIMARY KEY (NoDocumento)

ALTER TABLE Producao.Documento
ADD CONSTRAINT FK_Documento_Funcionario_Proprietario FOREIGN KEY(Proprietario) REFERENCES RecursosHumanos.Funcionario(IDEntidadeNegocio)

ALTER TABLE Producao.Ilustracao
ADD CONSTRAINT PK_Ilustracao_IDIlustracao PRIMARY KEY (IDIlustracao)

ALTER TABLE Producao.Localizacao
ADD CONSTRAINT PK_Localizacao_IDLocalizacao PRIMARY KEY (IDLocalizacao)

ALTER TABLE Producao.Produto
ADD CONSTRAINT PK_Produto_IDProduto PRIMARY KEY (IDProduto)

ALTER TABLE Producao.SubcategoriaProduto
ADD CONSTRAINT PK_SubcategoriaProduto_IDSubcategoriaProduto PRIMARY KEY (IDSubcategoriaProduto)

ALTER TABLE Producao.ModeloProduto
ADD CONSTRAINT PK_ModeloProduto_IDModeloProduto PRIMARY KEY (IDModeloProduto)

ALTER TABLE Producao.Produto
ADD CONSTRAINT FK_Produto_ModeloProduto_IDModeloProduto FOREIGN KEY(IDModeloProduto) REFERENCES Producao.ModeloProduto(IDModeloProduto),
	CONSTRAINT FK_Produto_SubcategoriaProduto_IDSubcategoriaProduto FOREIGN KEY(IDSubcategoriaProduto) REFERENCES Producao.SubcategoriaProduto(IDSubcategoriaProduto),
	CONSTRAINT FK_Produto_CodigoUnidadeMedida_CodigoUnidadeMedidaTamanho FOREIGN KEY(CodigoUnidadeMedidaTamanho) REFERENCES Producao.CodigoUnidadeMedida(CodigoUnidadeMedida),
	CONSTRAINT FK_Produto_CodigoUnidadeMedida_CodigoUnidadeMedidaPeso FOREIGN KEY(CodigoUnidadeMedidaPeso) REFERENCES Producao.CodigoUnidadeMedida(CodigoUnidadeMedida)

ALTER TABLE Producao.CategoriaProduto
ADD CONSTRAINT PK_CategoriaProduto_IDCategoriaProduto PRIMARY KEY (IDCategoriaProduto)

ALTER TABLE Producao.CustoProduto
ADD CONSTRAINT PK_CustoProduto_IDProduto_DataInicio PRIMARY KEY (IDProduto,DataInicio)

ALTER TABLE Producao.CustoProduto
ADD CONSTRAINT FK_CustoProduto_Produto_IDProduto FOREIGN KEY(IDProduto) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Producao.DescricaoProduto
ADD CONSTRAINT PK_DescricaoProduto_IDDescricaoProduto PRIMARY KEY (IDDescricaoProduto)

ALTER TABLE Producao.DocumentoProduto
ADD CONSTRAINT PK_DocumentoProduto_IDProduto_NoDocumento PRIMARY KEY (IDProduto,NoDocumento)

ALTER TABLE Producao.DocumentoProduto
ADD CONSTRAINT FK_DocumentoProduto_Documento_NoDocumento FOREIGN KEY (NoDocumento) REFERENCES Producao.Documento(NoDocumento),
	CONSTRAINT FK_DocumentoProduto_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Producao.LocalizacaoProduto
ADD CONSTRAINT PK_LocalizacaoProduto_IDProduto_IDLocalizacao PRIMARY KEY (IDProduto,IDLocalizacao)

ALTER TABLE Producao.Localizacao
ADD CONSTRAINT PK_Localizacao_IDLocalizacao PRIMARY KEY (IDLocalizacao)

ALTER TABLE Producao.LocalizacaoProduto
ADD CONSTRAINT FK_LocalizacaoProduto_IDLocalizacao FOREIGN KEY (IDLocalizacao) REFERENCES Producao.Localizacao(IDLocalizacao),
	CONSTRAINT FK_LocalizacaoProduto_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Producao.PrecoListaProduto
ADD CONSTRAINT PK_PrecoListaProduto_IDProduto_DataInicio PRIMARY KEY (IDProduto,DataInicio)

ALTER TABLE Producao.PrecoListaProduto
ADD CONSTRAINT FK_PrecoListaProduto_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Producao.ModeloProduto
ADD CONSTRAINT PK_ModeloProduto_IDModeloProduto PRIMARY KEY (IDModeloProduto)

ALTER TABLE Producao.ModeloProdutoIlustracao
ADD CONSTRAINT PK_ProductModelIllustration_IDModeloProduto_IDIlustracao PRIMARY KEY (IDIlustracao,IDModeloProduto)

ALTER TABLE Producao.Ilustracao
ADD CONSTRAINT PK_Ilustracao_IDIlustracao PRIMARY KEY (IDIlustracao)

ALTER TABLE Producao.ModeloProdutoIlustracao
ADD CONSTRAINT FK_ModeloProdutoIlustracao_Ilustracao_IDIlustracao FOREIGN KEY (IDIlustracao) REFERENCES Producao.Ilustracao(IDIlustracao),
	CONSTRAINT FK_ModeloProdutoIlustracao_ModeloProduto_IDModeloProduto FOREIGN KEY (IDModeloProduto) REFERENCES Producao.ModeloProduto(IDModeloProduto)

ALTER TABLE Producao.ModeloDescricaoProdutoCultural
ADD CONSTRAINT PK_ModeloDescricaoProdutoCultural_IDModeloProduto_IDDescricaoProduto_IDCultura PRIMARY KEY (IDModeloProduto,IDDescricaoProduto,IDCultura)

ALTER TABLE Producao.Cultura
ADD CONSTRAINT PK_Cultura_IDCultura PRIMARY KEY (IDCultura)

ALTER TABLE Producao.ModeloDescricaoProdutoCultural
ADD CONSTRAINT FK_ModeloDescricaoProdutoCultural_ModeloProduto_IDModeloProduto FOREIGN KEY (IDModeloProduto) REFERENCES Producao.ModeloProduto(IDModeloProduto),
	CONSTRAINT FK_ModeloDescricaoProdutoCultural_DescricaoProduto_IDDescricaoProduto FOREIGN KEY (IDDescricaoProduto) REFERENCES Producao.DescricaoProduto(IDDescricaoProduto),
	CONSTRAINT FK_ModeloDescricaoProdutoCultural_Cultura_IDCultura FOREIGN KEY (IDCultura) REFERENCES Producao.Cultura(IDCultura)

ALTER TABLE Producao.FotoProduto
ADD CONSTRAINT PK_FotoProduto_ PRIMARY KEY (IDFotoProduto)

ALTER TABLE Producao.FotoPrincipalProduto
ADD CONSTRAINT PK_FotoPrincipalProduto_IDProduto_IDFotoProduto PRIMARY KEY (IDProduto,IDFotoProduto)

ALTER TABLE Producao.FotoPrincipalProduto
ADD CONSTRAINT FK_FotoPrincipalProduto_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto),
	CONSTRAINT FK_FotoPrincipalProduto_FotoProduto_IDFotoProduto FOREIGN KEY (IDFotoProduto) REFERENCES Producao.FotoProduto(IDFotoProduto)

ALTER TABLE Producao.RevisaoProduto
ADD CONSTRAINT PK_RevisaoProduto_IDRevisaoProduto PRIMARY KEY (IDRevisaoProduto)

ALTER TABLE Producao.RevisaoProduto
ADD CONSTRAINT FK_RevisaoProduto_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Producao.SubcategoriaProduto
ADD CONSTRAINT FK_SubcategoriaProduto_CategoriaProduto_IDCategoriaProduto FOREIGN KEY (IDCategoriaProduto) REFERENCES Producao.CategoriaProduto(IDCategoriaProduto)

ALTER TABLE Producao.MotivoSucata
ADD CONSTRAINT PK_MotivoSucata_IDMotivoSucata PRIMARY KEY (IDMotivoSucata)

ALTER TABLE Producao.HistoricoTransacao
ADD CONSTRAINT PK_HistoricoTransacao_IDTransacao PRIMARY KEY (IDTransacao)

ALTER TABLE Producao.HistoricoTransacao
ADD CONSTRAINT FK_HistoricoTransacao_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Producao.HistoricoTransacaoArquivo
ADD CONSTRAINT PK_HistoricoTransacaoArquivo_IDTransacao PRIMARY KEY (IDTransacao)

ALTER TABLE Producao.OrdemTrabalho
ADD CONSTRAINT PK_OrdemTrabalho_IDOrdemTrabalho PRIMARY KEY (IDOrdemTrabalho)

ALTER TABLE Producao.OrdemTrabalho
ADD CONSTRAINT FK_OrdemTrabalho_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto),
	CONSTRAINT FK_OrdemTrabalho_IDProduto FOREIGN KEY (IDMotivoDescarte) REFERENCES Producao.MotivoSucata(IDMotivoSucata)

ALTER TABLE Producao.OrdemProducaoOperacao
ADD CONSTRAINT PK_IDOrdemProducao_IDProduto_SequenciaOperacao PRIMARY KEY (IDOrdemProducao,IDProduto,SequenciaOperacao)

ALTER TABLE Producao.OrdemProducaoOperacao
ADD CONSTRAINT FK_OrdemProducaoOperacao_Localizacao_IDLocalizacao FOREIGN KEY (IDLocalizacao) REFERENCES Producao.Localizacao(IDLocalizacao),
	CONSTRAINT FK_OrdemProducaoOperacao_OrdemTrabalho_IDOrdemTrabalho FOREIGN KEY (IDOrdemProducao) REFERENCES Producao.OrdemTrabalho(IDOrdemTrabalho)

ALTER TABLE Compras.ProdutoFornecedor
ADD CONSTRAINT PK_ProdutoFornecedor_IDProduto_IDEntidadeNegocio PRIMARY KEY (IDEntidadeNegocio,IDProduto)

ALTER TABLE Compras.Fornecedor
ADD CONSTRAINT PK_Fornecedor_IDFornecedor PRIMARY KEY (IDFornecedor)

ALTER TABLE Compras.ProdutoFornecedor
ADD CONSTRAINT FK_ProdutoFornecedor_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto),
	CONSTRAINT FK_ProdutoFornecedor_CodigoUnidadeMedida_CodigoUnidadeMedida FOREIGN KEY (CodigoUnidadeMedida) REFERENCES Producao.CodigoUnidadeMedida(CodigoUnidadeMedida),
	CONSTRAINT FK_ProdutoFornecedor_Fornecedor_IDEntidadeNegocio FOREIGN KEY (IDEntidadeNegocio) REFERENCES Compras.Fornecedor(IDFornecedor)

ALTER TABLE Compras.DetalhePedidoCompra
ADD CONSTRAINT PK_DetalhePedidoCompra_IDCompra_IDDetalheCompra PRIMARY KEY (IDDetalheCompra,IDCompra)

ALTER TABLE Compras.InformacoesPedidoCompra
ADD CONSTRAINT PK_InformacoesPedidoCompra_IDPedidoCompra PRIMARY KEY (IDPedidoCompra)

ALTER TABLE Compras.DetalhePedidoCompra
ADD CONSTRAINT FK_DetalhePedidoCompra_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto),
	CONSTRAINT FK_DetalhePedidoCompra_InformacoesPedidoCompra_IDCompra FOREIGN KEY (IDCompra) REFERENCES Compras.InformacoesPedidoCompra(IDPedidoCompra)

ALTER TABLE Compras.DetalhePedidoCompra
ADD CONSTRAINT FK_DetalhePedidoCompra_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto),
	CONSTRAINT FK_DetalhePedidoCompra_InformacoesPedidoCompra_IDCompra FOREIGN KEY (IDCompra) REFERENCES Compras.InformacoesPedidoCompra(IDPedidoCompra)

ALTER TABLE Compras.MetodoEnvio
ADD CONSTRAINT PK_MetodoEnvio_IDMetodoEnvio PRIMARY KEY (IDMetodoEnvio)

	ALTER TABLE Compras.InformacoesPedidoCompra
ADD CONSTRAINT FK_InformacoesPedidoCompra_Funcionario_IDEmpregado FOREIGN KEY (IDEmpregado) REFERENCES RecursosHumanos.Funcionario(IDEntidadeNegocio),
	CONSTRAINT FK_InformacoesPedidoCompra_MetodoEnvio_IDMetodoEnvio FOREIGN KEY (IDMetodoEnvio) REFERENCES Compras.MetodoEnvio(IDMetodoEnvio),
	CONSTRAINT FK_InformacoesPedidoCompra_Fornecedor_IDFornecedor FOREIGN KEY (IDFornecedor) REFERENCES Compras.Fornecedor(IDFornecedor)

ALTER TABLE Compras.Fornecedor
ADD CONSTRAINT FK_Fornecedor_EntidadeNegocio_IDFornecedor FOREIGN KEY (IDFornecedor) REFERENCES Pessoa.EntidadeNegocio(IDEntidadeNegocio)

ALTER TABLE Vendas.Moeda
ADD CONSTRAINT PK_Moeda_CodigoMoeda PRIMARY KEY (CodigoMoeda)

ALTER TABLE  Vendas.MoedaRegiaoPais
ADD CONSTRAINT PK_MoedaRegiaoPais_CodigoPaisRegiao_CodigoMoeda PRIMARY KEY (CodigoMoeda,CodigoPaisRegiao),
	CONSTRAINT FK_MoedaRegiaoPais_RegiaoPais_CodigoPaisRegiao FOREIGN KEY (CodigoPaisRegiao) REFERENCES Pessoa.RegiaoPais(CodigoPais),
	CONSTRAINT FK_MoedaRegiaoPais_Moeda_CodigoMoeda FOREIGN KEY (CodigoMoeda) REFERENCES Vendas.Moeda(CodigoMoeda),
	CONSTRAINT FK_MoedaRegiaoPais_RegiaoPais_CodigoPaisRegiao FOREIGN KEY (CodigoPaisRegiao) REFERENCES Pessoa.RegiaoPais(CodigoPaisRegiao)

ALTER TABLE Vendas.CartaoCredito
ADD CONSTRAINT PK_CartaoCredito_IDCreditCard PRIMARY KEY (IDCreditCard)

ALTER TABLE Vendas.TaxaCambio
ADD CONSTRAINT PK_TaxaCambio_IDTaxaCambio PRIMARY KEY (IDTaxaCambio),
	CONSTRAINT FK_TaxaCambio_CodigoMoedaOrigem FOREIGN KEY (CodigoMoedaOrigem) REFERENCES Vendas.Moeda(CodigoMoeda),
	CONSTRAINT FK_TaxaCambio_CodigoMoedaDestino FOREIGN KEY (CodigoMoedaDestino) REFERENCES Vendas.Moeda(CodigoMoeda)

ALTER TABLE Vendas.Cliente
ADD CONSTRAINT PK_Cliente_IDCliente PRIMARY KEY (IDCliente)

ALTER TABLE Vendas.TerritorioVendas
ADD CONSTRAINT PK_TerritorioVendas_IDTerritorioVendas PRIMARY KEY (IDTerritorioVendas)

ALTER TABLE Vendas.Loja
ADD CONSTRAINT PK_Loja_IDEntidadeNegocio PRIMARY KEY (IDEntidadeNegocio)

ALTER TABLE Vendas.Cliente
ADD CONSTRAINT FK_Cliente_IDPessoa FOREIGN KEY (IDPessoa) REFERENCES Pessoa.Pessoa(IDEntidadeNegocio),
	CONSTRAINT FK_Cliente_IDTerritorio FOREIGN KEY (IDTerritorio) REFERENCES Vendas.TerritorioVendas(IDTerritorioVendas),
	CONSTRAINT FK_Cliente_IDLoja FOREIGN KEY (IDLoja) REFERENCES Vendas.Loja(IDEntidadeNegocio)

ALTER TABLE Vendas.EntidadeCartaoCredito
ADD CONSTRAINT PK_EntidadeCartaoCredito_IDEntidadeNegocio_IDCreditCard PRIMARY KEY (IDCreditCard,IDEntidadeNegocio),
	CONSTRAINT FK_EntidadeCartaoCredito_IDCreditCard FOREIGN KEY (IDCreditCard) REFERENCES Vendas.CartaoCredito(IDCreditCard),
	CONSTRAINT FK_EntidadeCartaoCredito_Pessoa_IDEntidadeNegocio FOREIGN KEY (IDEntidadeNegocio) REFERENCES Pessoa.Pessoa(IDEntidadeNegocio)

ALTER TABLE Vendas.DetalhePedidoVenda
ADD CONSTRAINT PK_DetalhePedidoVenda_IDPedidoVenda_IDDetalhePedidoVenda PRIMARY KEY (IDDetalhePedidoVenda,IDPedidoVenda)

ALTER TABLE Vendas.PedidoVenda
ADD CONSTRAINT PK_PedidoVenda_IDPedidoVenda PRIMARY KEY (IDPedidoVenda)

ALTER TABLE Vendas.OfertaEspecial
ADD CONSTRAINT PK_OfertaEspecial_IDOfertaEspecial PRIMARY KEY (IDOfertaEspecial)

ALTER TABLE Vendas.OfertaEspecialProduto
ADD CONSTRAINT PK_OfertaEspecialProduto_IDOfertaEspecial_IDProduto PRIMARY KEY (IDOfertaEspecial,IDProduto)

ALTER TABLE Vendas.OfertaEspecialProduto
ADD CONSTRAINT FK_OfertaEspecialProduto_OfertaEspecial_IDOfertaEspecial FOREIGN KEY (IDOfertaEspecial) REFERENCES Vendas.OfertaEspecial(IDOfertaEspecial),
	CONSTRAINT FK_OfertaEspecialProduto_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Vendas.DetalhePedidoVenda
ADD CONSTRAINT FK_DetalhePedidoVenda_PedidoVenda_IDPedidoVenda FOREIGN KEY (IDPedidoVenda) REFERENCES Vendas.PedidoVenda(IDPedidoVenda),
	CONSTRAINT FK_DetalhePedidoVenda_OfertaEspecialProduto_IDOfertaEspecial_IDProduto FOREIGN KEY (IDOfertaEspecial,IDProduto) REFERENCES Vendas.OfertaEspecialProduto(IDOfertaEspecial,IDProduto)

ALTER TABLE Vendas.Vendedor
ADD CONSTRAINT PK_Vendedor_IDEntidadeNegocio PRIMARY KEY (IDEntidadeNegocio)

ALTER TABLE Vendas.PedidoVenda
ADD CONSTRAINT FK_PedidoVenda_Endereco_IDEndereco FOREIGN KEY (IDEnderecoFaturamento) REFERENCES Pessoa.Endereco(IDEndereco),
	CONSTRAINT FK_PedidoVenda_EnderecoIDEndereco FOREIGN KEY (IDEnderecoEntrega) REFERENCES Pessoa.Endereco(IDEndereco),
	CONSTRAINT FK_PedidoVenda_CartaoCredito FOREIGN KEY (IDCreditCard) REFERENCES Vendas.CartaoCredito(IDCreditCard),
	CONSTRAINT FK_PedidoVenda_TaxaCambio_IDTaxaCambio FOREIGN KEY (IDTaxaCambio) REFERENCES Vendas.TaxaCambio(IDTaxaCambio),
	CONSTRAINT FK_PedidoVenda_Cliente_IDCliente FOREIGN KEY (IDCliente) REFERENCES Vendas.Cliente(IDCliente),
	CONSTRAINT FK_PedidoVenda_Vendedor_IDSolicitanteVenda FOREIGN KEY (IDSolicitanteVenda) REFERENCES Vendas.Vendedor(IDEntidadeNegocio),
	CONSTRAINT FK_PedidoVenda_TerritorioVendas_IDTerritorioVendas FOREIGN KEY (IDTerritorio) REFERENCES Vendas.TerritorioVendas(IDTerritorioVendas),
	CONSTRAINT FK_PedidoVenda_MetodoEnvio_IDMetodoEntrega FOREIGN KEY (IDMetodoEntrega) REFERENCES Compras.MetodoEnvio(IDMetodoEnvio)

ALTER TABLE Vendas.MotivoVenda
ADD CONSTRAINT PK_MotivoVenda_IDMotivoVenda PRIMARY KEY (IDMotivoVenda)

ALTER TABLE Vendas.MotivoPedidoVenda
ADD CONSTRAINT PK_MotivoPedidoVenda_IDPedidoVenda_IDMotivoPedidoVenda PRIMARY KEY (IDMotivoPedidoVenda,IDPedidoVenda)

ALTER TABLE Vendas.MotivoPedidoVenda
ADD CONSTRAINT FK_MotivoPedidoVenda_PedidoVenda_IDPedidoVenda FOREIGN KEY (IDPedidoVenda) REFERENCES Vendas.PedidoVenda(IDPedidoVenda),
	CONSTRAINT FK_MotivoPedidoVenda_MotivoVenda_IDMotivoPedidoVenda FOREIGN KEY (IDMotivoPedidoVenda) REFERENCES Vendas.MotivoVenda(IDMotivoVenda)

ALTER TABLE Vendas.Vendedor
ADD CONSTRAINT FK_Vendedor_Funcionario_IDEntidadeNegocio FOREIGN KEY(IDEntidadeNegocio) REFERENCES RecursosHumanos.Funcionario(IDEntidadeNegocio),
	CONSTRAINT FK_Vendedor_TerritorioVendas_IDTerritorio FOREIGN KEY(IDTerritorio) REFERENCES Vendas.TerritorioVendas(IDTerritorioVendas)

ALTER TABLE Vendas.CotaVendas
ADD CONSTRAINT PK_CotaVendas_IDVendedor_DataCotaVendas PRIMARY KEY (IDVendedor,DataCotaVendas)

ALTER TABLE Vendas.CotaVendas
ADD CONSTRAINT FK_CotaVendas_Vendedor_IDVendedor FOREIGN KEY (IDVendedor) REFERENCES Vendas.Vendedor(IDEntidadeNegocio)

ALTER TABLE Vendas.TaxaImpostoVenda
ADD CONSTRAINT PK_TaxaImpostoVenda_IDTaxaImpostoVenda PRIMARY KEY (IDTaxaImpostoVenda),
CONSTRAINT FK_TaxaImpostoVenda_EstadoProvincia_IDEstadoProvincia FOREIGN KEY (IDEstadoProvincia) REFERENCES Pessoa.EstadoProvincia(IDEstadoProvincia)

ALTER TABLE Vendas.TerritorioVendas
ADD CONSTRAINT FK_TerritorioVendas_RegiaoPais_IDTerritorioVendas FOREIGN KEY (CodigoPaisRegiao) REFERENCES Pessoa.RegiaoPais(CodigoPaisRegiao)

ALTER TABLE Vendas.RepresentanteTerritorio
ADD CONSTRAINT PK_RepresentanteTerritorio PRIMARY KEY (IDRepresentanteVendas,IDTerritorio,DataInicio),
	CONSTRAINT FK_RepresentanteTerritorio_Vendedor_IDRepresentanteVendas FOREIGN KEY (IDRepresentanteVendas) REFERENCES Vendas.Vendedor(IDEntidadeNegocio),
	CONSTRAINT FK_RepresentanteTerritorio_TerritorioVendas_IDTerritorio FOREIGN KEY (IDTerritorio) REFERENCES Vendas.TerritorioVendas(IDTerritorioVendas)

ALTER TABLE Vendas.ItemCarrinhoCompras
ADD CONSTRAINT PK_ItemCarrinhoCompras_IDItemCarrinhoCompras PRIMARY KEY (IDItemCarrinhoCompras),
	CONSTRAINT FK_ItemCarrinhoCompras_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto)

ALTER TABLE Vendas.OfertaEspecialProduto
ADD CONSTRAINT FK_OfertaEspecialProduto_Produto_IDProduto FOREIGN KEY (IDProduto) REFERENCES Producao.Produto(IDProduto),
	CONSTRAINT FK_OfertaEspecialProduto_OfertaEspecial_IDOfertaEspecial FOREIGN KEY (IDOfertaEspecial) REFERENCES Vendas.OfertaEspecial(IDOfertaEspecial)

ALTER TABLE Vendas.Loja
ADD CONSTRAINT FK_Loja_EntidadeNegocio_IDEntidadeNegocio FOREIGN KEY (IDEntidadeNegocio) REFERENCES Pessoa.EntidadeNegocio(IDEntidadeNegocio),
	CONSTRAINT FK_Loja_Vendedor_IDPessoaVendas FOREIGN KEY (IDPessoaVendas) REFERENCES Vendas.Vendedor(IDEntidadeNegocio)
