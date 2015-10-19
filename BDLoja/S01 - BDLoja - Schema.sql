/*************************************************************
* PRONATEC/UNIMEP 
* CURSO: Técnico em Informática para Internet
* PROFESSOR: André Bertoletti (apbertolet@unimep.br)
* DISPCIPLINA: Banco de Dados II 
* SCRIPT: Criação do banco de dados e estrutura das tabelas 
**************************************************************/

--Criando o banco de dados
CREATE DATABASE BDLoja

GO

--Selecionando o banco de Dados BDLoja
USE BDLoja

GO

--Criando a tabela Loja
CREATE TABLE Estabelecimento
(
	CNPJ CHAR(14) NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Endereco VARCHAR(200) NOT NULL,
	Telefone VARCHAR(20) NOT NULL,
	
	CONSTRAINT PK_Estabelecimento PRIMARY KEY(CNPJ)
)

--Criando a tabela Grupo de Cliente
CREATE TABLE GrupoCliente
(
	Sigla CHAR(3) NOT NULL,
	Descricao VARCHAR(30) NOT NULL
	
	CONSTRAINT PK_GrupoCliente PRIMARY KEY(Sigla)
)


--Criando a tabela Cliente
CREATE TABLE Cliente
(
	ID INT IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	Email VARCHAR(200),
	Sexo CHAR(1) NOT NULL,
	CPF CHAR(11),
	SiglaGrupo CHAR(3)
	
	CONSTRAINT PK_Cliente PRIMARY KEY(ID)
	CONSTRAINT FK_GrupoCliente FOREIGN KEY(SiglaGrupo) REFERENCES GrupoCliente(Sigla)
)

--Criando a tabela Marca
CREATE TABLE Marca
(
	ID INT IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	
	CONSTRAINT PK_Marca PRIMARY KEY(ID)
)

--Criando a tabela Categoria
CREATE TABLE Categoria 
(
	ID INT IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	
	CONSTRAINT PK_Categoria PRIMARY KEY(ID)
)

--Criando a tabela Produto
CREATE TABLE Produto 
(
	ID INT IDENTITY,
	Descricao VARCHAR(100) NOT NULL,
	Valor NUMERIC(16,2) NOT NULL,--(14 casas inteiras e 2 decimais)
	IDCategoria INT NOT NULL,
	IDMarca INT NULL,
	
	CONSTRAINT PK_Produto PRIMARY KEY(ID),
	CONSTRAINT FK_Categoria FOREIGN KEY(IDCategoria) REFERENCES Categoria(ID),
	CONSTRAINT FK_Marca FOREIGN KEY(IDMarca) REFERENCES Marca(ID)
)

--Criando a tabela Venda
CREATE TABLE Venda 
(
	ID INT IDENTITY,
	IDCliente INT NOT NULL,
	CNPJEstabelecimento CHAR(14) NOT NULL,
	DataHora SMALLDATETIME NOT NULL,
	
	CONSTRAINT PK_Venda PRIMARY KEY(ID),
	CONSTRAINT FK_Cliente FOREIGN KEY(IDCliente) REFERENCES Cliente(ID),
	CONSTRAINT FK_Estabelecimento FOREIGN KEY(CNPJEstabelecimento) REFERENCES Estabelecimento(CNPJ)
)

--Criando a tabela VendaProduto
CREATE TABLE VendaProduto
(
	ID INT IDENTITY,
	IDVenda INT NOT NULL,
	IDProduto INT NOT NULL,
	ValorUnitario NUMERIC(15, 4) NOT NULL,
	Quantidade NUMERIC(15, 4) NOT NULL,
	ValorTotal NUMERIC(12, 2) NOT NULL
	
	CONSTRAINT PK_VendaProduto PRIMARY KEY(ID),
	CONSTRAINT FK_Produto FOREIGN KEY(IDProduto) REFERENCES Produto(ID),
	CONSTRAINT FK_Venda FOREIGN KEY(IDVenda) REFERENCES Venda(ID)
)
