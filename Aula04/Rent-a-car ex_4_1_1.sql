CREATE TABLE RentACar_Balcao (
	[Numero] [int] NOT NULL PRIMARY KEY,
	[Nome] [varchar](256)NOT NULL,
	[Endereco] [varchar](1024)NOT NULL,
)
GO

CREATE TABLE RentACar_Cliente (
  	[Nif] [int] NOT NULL PRIMARY KEY,
  	[Nome] [varchar](256) NOT NULL,
  	[Endereco] [varchar](1024)NOT NULL,
  	[num_carta] [varchar](32 )NOT NULL,
)
GO

CREATE TABLE RentACar_Ligeiro (
 	[Codigo] [int] NOT NULL PRIMARY KEY REFERENCES RentACar_Tipo_Veiculo([codigo]),
	[NumLugares] [int] NOT NULL,
	[Portas][int] NOT NULL,
	[Combustivel][varchar](256) NOT NULL
)
GO

CREATE TABLE RentACar_Pesado (
 	[Codigo] [int] NOT NULL PRIMARY KEY REFERENCES RentACar_Tipo_Veiculo([codigo]),
	[Peso] [int] NOT NULL,
	[Passageiros] [int] NOT NULL
)
GO

CREATE TABLE RentACar_Tipo_Veiculo (
	[Codigo] [int] NOT NULL IDENTITY PRIMARY KEY,
	[Designacao] [varchar](256) NOT NULL,
	[ArCondicionado] [bit] NOT NULL
)
GO

CREATE TABLE RentACar_Veiculo (
 	[Matricula] [varchar](16) NOT NULL PRIMARY KEY,
	[Ano] [int] NOT NULL,
	[Marca] [varchar](256) NOT NULL,
	[Tipo_Veiculo_Codigo] [int] NOT NULL REFERENCES RentACar_Tipo_Veiculo([codigo])
)
GO

CREATE TABLE RentACar_Aluguer (
 	[Matricula] [varchar](16) NOT NULL PRIMARY KEY,
	[Ano] [int] NOT NULL,
	[Marca] [varchar](256) NOT NULL,
	[Tipo_Veiculo_Codigo] [int] NOT NULL REFERENCES RentACar_Tipo_Veiculo([codigo]),
	[Cliente_Nif] [int] NOT NULL REFERENCES RentACar_Cliente([Nif]),
	[Balcao_Numero] [int] NOT NULL REFERENCES RentACar_Balcao([Numero]),
)
GO

CREATE TABLE RentACar_Similaridade (
	[Codigo1] [int] NOT NULL REFERENCES RentACar_Tipo_Veiculo([Numero]),
	[Codigo2] [int] NOT NULL REFERENCES RentACar_Tipo_Veiculo([Numero]),
)
GO






