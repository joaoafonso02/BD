CREATE TABLE Encarregado_de_Edu(
	[CC] [int] NOT NULL PRIMARY KEY CHECK(CC > 0),
	[Name] [varchar](32) NOT NULL,
	[Email] [varchar](64) NOT NULL,
	[Address] [varchar](128) NOT NULL,
	[Phone] [int] NOT NULL CHECK(Phone > 0),
	[Bday] [date] NOT NULL
)
GO

CREATE TABLE Aluno(
	[CC] [int] NOT NULL PRIMARY KEY CHECK(CC > 0),
	[Name] [varchar](32) NOT NULL,
	[Email] [varchar](64) NOT NULL,
	[Address] [varchar](128) NOT NULL,
	[Bday] [date] NOT NULL,
	FOREIGN KEY(CC) REFERENCES Encarregado_de_Edu([CC])
)
GO

CREATE TABLE Pessoa_Aut(
	[CC] [int] NOT NULL PRIMARY KEY CHECK(CC > 0),
	[Name] [varchar](32) NOT NULL,
	[Email] [varchar](64) NOT NULL,
	[Address] [varchar](128) NOT NULL,
	[Phone] [int] NOT NULL CHECK(Phone > 0),
	[Bday] [date] NOT NULL
)
GO

CREATE TABLE Entrega_Levanta(
	[CCa] [int] NOT NULL REFERENCES Aluno([CC]),
	[CCp] [int] NOT NULL REFERENCES Pessoa_Aut([CC]),

	PRIMARY KEY(CCa, CCp )
)
GO

CREATE TABLE Atividade(
	[ID] [int] NOT NULL PRIMARY KEY,
	[Designation] [varchar](128) NOT NULL,
	[Cost] [money] NOT NULL CHECK(Cost >= 0),
) 
GO

CREATE TABLE Frequenta(
	[CCa] [int] NOT NULL REFERENCES Aluno([CC]),
	[ID] [int] NOT NULL REFERENCES Atividade([ID]),
	PRIMARY KEY(CCa, ID)
)
GO

CREATE TABLE ATL_Professor(
	[CCp] [int] NOT NULL,
	[IDp] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Email] [varchar](64) NOT NULL,
	[Address] [varchar](128) NOT NULL,
	[Phone] [int] NOT NULL CHECK(Phone > 0),
	[Bday] [date] NOT NULL,
	PRIMARY KEY(CCp, IDp)
)
GO

CREATE TABLE Turma(
	[ID] [int] NOT NULL PRIMARY KEY,
	[Designation] [varchar](128) NOT NULL,
	[Max_Students] [int] NOT NULL CHECK(Max_Students > 0),
	[CCp] [int] NOT NULL,
	[IDp] [int] NOT NULL,
	FOREIGN KEY(CCp, IDp) REFERENCES ATL_Professor(CCp, IDp)
)
GO

CREATE TABLE Inclui(
	[CCa] [int] NOT NULL REFERENCES Aluno([CC]),
	[IDt] [int] NOT NULL REFERENCES Turma([ID]),
	PRIMARY KEY(CCa, IDt)
)
GO

CREATE TABLE Ano_Letivo(
	[ID] [int] NOT NULL REFERENCES Turma(ID),
	[Yy] [date] NOT NULL,
	PRIMARY KEY(ID, Yy)
)
GO

