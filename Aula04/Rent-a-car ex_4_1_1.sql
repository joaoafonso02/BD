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
 	[Codigo] [int] NOT NULL PRIMARY KEY,
	[Arcondicionado] [varchar](256) NOT NULL,
	[Designacao] [varchar](256) NOT NULL,
	[NumLugares] [int] NOT NULL,
	[Portas][int] NOT NULL,
	[Combustivel][varchar](256) NOT NULL
)
GO

CREATE TABLE RentACar_Pesado (
 	[Codigo] [int] NOT NULL PRIMARY KEY,
	[Arcondicionado] [varchar](256) NOT NULL,
	[Designacao] [varchar](256) NOT NULL,
	[Peso] [int] NOT NULL,
	[Passageiros] [int] NOT NULL
)
GO





