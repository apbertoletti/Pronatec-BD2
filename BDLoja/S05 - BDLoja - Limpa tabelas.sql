/*************************************************************
* PRONATEC/UNIMEP 
* CURSO: Técnico em Informática para Internet
* PROFESSOR: André Bertoletti (apbertolet@unimep.br)
* DISPCIPLINA: Banco de Dados II 
* SCRIPT: Limpeza das tabelas (BDLoja)
**************************************************************/

--1) Exclui todos os registros da tabel a VendaProduto
DELETE FROM VendaProduto

--2) Exclui todos os registros da tabel a Venda
DELETE FROM Venda

--3) Exclui todos os registros da tabel a Cliente 
DELETE FROM Cliente

--4) Exclui todos os registros da tabel a Produto 
DELETE FROM Produto

--5) Exclui todos os registros da tabel a Loja 
DELETE FROM Estabelecimento

--6) Exclui todos os registros da tabel a Categoria 
DELETE FROM Categoria

--6) Exclui todos os registros da tabel a Marca
DELETE FROM Marca

--6) Exclui todos os registros da tabel a Grupo de clientes
DELETE FROM GrupoCliente

-- Scripts para zerar novamente os campos de Autoincremento
DBCC CHECKIDENT ('Cliente', RESEED, 0)
DBCC CHECKIDENT ('Produto', RESEED, 0)
DBCC CHECKIDENT ('Categoria', RESEED, 0)
DBCC CHECKIDENT ('Marca', RESEED, 0)
DBCC CHECKIDENT ('VendaProduto', RESEED, 0)
DBCC CHECKIDENT ('Venda', RESEED, 0)

