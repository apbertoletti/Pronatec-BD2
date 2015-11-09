/*************************************************************
* PRONATEC/UNIMEP 
* CURSO: Técnico em Informática para Internet
* PROFESSOR: André Bertoletti (apbertolet@unimep.br)
* DISPCIPLINA: Banco de Dados II 
* SCRIPT: Criação do banco de dados e estrutura das tabelas do BDBanco
**************************************************************/

--Criando o banco de dados
CREATE DATABASE BDBanco

GO

--Selecionando o banco de Dados BDLoja
USE BDBanco

GO

--Criando a tabela Loja
CREATE TABLE Correntista
(
	ID INT IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	SaldoAtual DECIMAL(18, 2)
	
	CONSTRAINT PK_Correntista PRIMARY KEY(ID)
)
