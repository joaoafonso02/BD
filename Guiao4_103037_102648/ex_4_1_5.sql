CREATE TABLE Conferencias_Conferencia(
	 [id] [INT] NOT NULL PRIMARY KEY,
)
GO

CREATE TABLE Conferencias_Instituicao(
	[nome] [varchar](30) NOT NULL PRIMARY KEY,
	[endereco] [varchar](40) NOT NULL,
)
GO

CREATE TABLE Conferencias_Artigo(
	[no_registo] [INT] NOT NULL primary key,
	[titulo] [varchar](40) NOT NULL,
)
GO

CREATE TABLE Conferencias_Apresenta(
	[Conferencia_id] [INT] NOT NULL PRIMARY KEY REFERENCES Conferencias_Conferencia([id]),
	[Artigo_no_registo] [INT] NOT NULL REFERENCES Conferencias_Artigo([no_registo]),
)
GO

CREATE TABLE Conferencias_Autor(
	[email] [varchar](40) NOT NULL PRIMARY KEY,
	[nome] [varchar](40) NOT NULL,
	[Instituicao_nome] [varchar](30) NOT NULL REFERENCES Conferencias_Instituicao([nome]),
)
GO

CREATE TABLE Conferencias_Tem(
	[Autor_email] [varchar](40) NOT NULL PRIMARY KEY REFERENCES Conferencias_Autor([email]),
	[Artigo_no_registo] [INT] NOT NULL REFERENCES Conferencias_Artigo([no_registo]),
)
GO

CREATE TABLE Conferencias_Participante(
	[email] [varchar](40) NOT NULL PRIMARY KEY,
	[data_inscr] [DATE] NOT NULL,
	[morada] [varchar](40) NOT NULL,
	[nome] [varchar](40) NOT NULL,
	[Conferencia_id] [INT] NOT NULL REFERENCES Conferencias_Conferencia([id]), 
)
GO

CREATE TABLE Conferencias_Nao_Estudante(
	[email] [varchar](40) NOT NULL PRIMARY KEY REFERENCES Conferencias_Participante([emain]),
	[ref_trans] [date] NOT NULL,
)
GO

CREATE TABLE Conferencias_Estudante(
	[email] [varchar](40) NOT NULL PRIMARY KEY REFERENCES Conferencias_Participante([email]),
	[Instituicao_nome] [varchar](30) NOT NULL REFERENCES Conferencias_Instituicao([nome]),
)
GO