
-- Empresa - nif nome
CREATE TABLE Stocks_Empresa (
	[nif] [char](9) NOT NULL PRIMARY KEY,
	[nome] [varchar](256) NOT NULL,
)
GO

-- Produto - codigo nome preco taxa de IVA empresa(fk)
CREATE TABLE Stocks_Produto (
	[codigo] [int] NOT NULL PRIMARY KEY,
	[nome] [varchar](256) NOT NULL,
	[preco] [money] NOT NULL,
	[taxaIVA] [float](24) NOT NULL,
	[Empresa_nif] [char](9) NOT NULL REFERENCES Stocks_Empresa([nif]),
)
GO

-- Tipo de Fornecedor - codigo
CREATE TABLE Stocks_TipoFornecedor (
	[codigo] [int] NOT NULL PRIMARY KEY,
	[designacao] [varchar](256) NOT NULL,
)
GO

-- Fornecedor - codigo nome nif endereco numFax condicoesPagamento TipoFornecedor(fk)
CREATE TABLE Stocks_Fornecedor (
	[codigo] [int] NOT NULL PRIMARY KEY,
	[nome] [varchar](256) NOT NULL,
	[nif] [char](9) NOT NULL,
	[endereco] [varchar](256) NOT NULL,
	[numFax] [char](15) NOT NULL,
	[condicoesPagamento] [varchar](256),
	[TipoFornecedor_codigo] [int] NOT NULL REFERENCES Stocks_TipoFornecedor([codigo])
)
GO

-- Encomenda - numEncomenda data preco
CREATE TABLE Stocks_Encomenda (
	[numEncomenda] [int] NOT NULL PRIMARY KEY,
	[data] [date] NOT NULL,
	[preco] [money],
	[Fornecedor_codigo] [int] NOT NULL REFERENCES Stocks_Fornecedor([codigo]),
)
GO

-- Contem EncomendaProduto - Produto(fk) Encomenda(fk) Quantidade
CREATE TABLE Stocks_EncomendaProduto (
	[Produto_codigo] [int] NOT NULL REFERENCES Stocks_Produto([codigo]),
	[Encomenda_codigo] [int] NOT NULL REFERENCES Stocks_Encomenda([numEncomenda]),
	[Quantidade] [int] NOT NULL,
	PRIMARY KEY(Produto_codigo, Encomenda_codigo)
)
GO