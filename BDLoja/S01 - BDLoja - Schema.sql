--Criando o banco de dados
CREATE DATABASE BDLoja

GO

--Selecionando o banco de Dados BDLoja
USE BDLoja

GO

--Criando a tabela Cliente
CREATE TABLE Cliente
(
	ID INT IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	Email VARCHAR(200),
	Sexo CHAR(1) NOT NULL,
	CPF CHAR(11),
	
	CONSTRAINT PK_Cliente PRIMARY KEY(ID)
)

--Criando a tabela Categoria
CREATE TABLE Categoria 
(
	ID INT IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	
	CONSTRAINT PK_Categoria PRIMARY KEY(ID)
)

--Criando a tabela Loja
CREATE TABLE Loja
(
	CNPJ CHAR(14),
	Endereco VARCHAR(200) NOT NULL,
	Telefone VARCHAR(20) NOT NULL,
	
	CONSTRAINT PK_Loja PRIMARY KEY(CNPJ)
)

--Criando a tabela Produto
CREATE TABLE Produto 
(
	ID INT IDENTITY,
	Descricao VARCHAR(100) NOT NULL,
	Valor NUMERIC(16,2) NOT NULL,--(14 casas inteiras e 2 decimais)
	IDCategoria INT NOT NULL,
	
	CONSTRAINT PK_Produto PRIMARY KEY(ID),
	CONSTRAINT FK_Categoria FOREIGN KEY(IDCategoria) REFERENCES Categoria(ID)
)

--Criando a tabela Venda
CREATE TABLE Venda 
(
	ID INT IDENTITY,
	IDCliente INT NOT NULL,
	CNPJLoja CHAR(14) NOT NULL,
	DataHora SMALLDATETIME NOT NULL,
	
	CONSTRAINT PK_Venda PRIMARY KEY(ID),
	CONSTRAINT FK_Cliente FOREIGN KEY(IDCliente) REFERENCES Cliente(ID),
	CONSTRAINT FK_Loja FOREIGN KEY(CNPJLoja) REFERENCES Loja(CNPJ)
)

--Criando a tabela VendaProduto
CREATE TABLE VendaProduto
(
	ID INT IDENTITY,
	IDProduto INT NOT NULL,
	IDVenda INT NOT NULL
	
	CONSTRAINT PK_VendaProduto PRIMARY KEY(ID),
	CONSTRAINT FK_Produto FOREIGN KEY(IDProduto) REFERENCES Produto(ID),
	CONSTRAINT FK_Venda FOREIGN KEY(IDVenda) REFERENCES Venda(ID)
)

--Corrigindo a estrutura da tabela Loja, alterando sua PK para NOT NULL
ALTER TABLE Loja ALTER COLUMN CNPJ CHAR(14) NOT NULL;
