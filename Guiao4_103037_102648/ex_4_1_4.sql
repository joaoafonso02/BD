

-- Paciente - numSNS endereco dataNascimento nome
CREATE TABLE Prescricao_Paciente (
	[numSNS][varchar](32) NOT NULL PRIMARY KEY,
	[endereco][varchar](512) NOT NULL,
	[dataNascimento][date] NOT NULL,
	[nome][varchar](256) NOT NULL,
)
GO

-- Medico - IDSNS nome especialidade
CREATE TABLE Prescricao_Medico (
	[IDSNS][int] NOT NULL PRIMARY KEY,
	[nome][varchar](256) NOT NULL,
	[especialidade][varchar](256),
)
GO

-- Farmaceutica - numRegistoNacional nome
CREATE TABLE Prescricao_Farmaceutica (
	[numRegistoNacional][int] NOT NULL PRIMARY KEY,
	[nome][varchar](256) NOT NULL,
)
GO

-- Farmacia - NIF nome endereco telefone
CREATE TABLE Prescricao_Farmacia (
	[NIF][varchar](32) NOT NULL PRIMARY KEY,
	[nome][varchar](256) NOT NULL,
	[endereco][varchar](256) NOT NULL,
	[telefone][varchar](32) NOT NULL,
)
GO

-- farmaco - Formula nome farmaceutica_numRegistoNacional farmacia_NIF
CREATE TABLE Prescricao_Farmaco (
	[formula][varchar](256) NOT NULL PRIMARY KEY,
	[farmaceutica_numRegistoNacional][int] NOT NULL REFERENCES Prescricao_Farmaceutica([numRegistoNacional]),
	[farmacia_NIF][varchar](32) NOT NULL REFERENCES Prescricao_Farmacia([NIF]),
)
GO

-- Prescricao - ID data processa_Data Paciente_numSNS Medico_IDSNS farmacia_NIF
CREATE TABLE Prescricao_Prescricao (
	[ID][int] NOT NULL PRIMARY KEY,
	[data][date] NOT NULL,
	[processa_data][date] NOT NULL,
	[paciente_numSNS][varchar](32) NOT NULL REFERENCES Prescricao_Paciente([numSNS]),
	[Medico_IDSNS][int] NOT NULL REFERENCES Prescricao_Medico([IDSNS]),
	[farmacia_NIF][varchar](32) NOT NULL REFERENCES Prescricao_Farmacia([NIF]),
)
GO