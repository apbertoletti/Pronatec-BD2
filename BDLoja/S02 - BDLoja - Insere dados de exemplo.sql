/*************************************************************
* PRONATEC/UNIMEP 
* CURSO: Técnico em Informática para Internet
* PROFESSOR: André Bertoletti (apbertolet@unimep.br)
* DISPCIPLINA: Banco de Dados II 
* SCRIPT: Inserção dos dados de exemplo
**************************************************************/

-- Selecionando o BDLoja
USE BDLoja

GO

-- Inserindo dados na tabela de Estabelecimento
INSERT INTO Estabelecimento VALUES ('12345678912345', 'Matriz', 'Av. Matarazzo, 345', '3544-1145')
INSERT INTO Estabelecimento VALUES ('01234568874512', 'Filial 02', 'Rua Trinta e Dois, 1254', '3524-1145')
INSERT INTO Estabelecimento VALUES ('98754124541001', 'Filial 03', 'Av. Independecia, 1355', '3534-1145')

-- Inserindo dados na tabela de Grupos Clientes
INSERT INTO GrupoCliente VALUES ('ACA', 'Academia')
INSERT INTO GrupoCliente VALUES ('BAL', 'Balcão')
INSERT INTO GrupoCliente VALUES ('VIP', 'Clientes VIP')

-- Inserindo dados na tabela de Clientes
INSERT INTO Cliente VALUES ('José da Silva', 'jose@gmail.com', 'M', '54485765914', 'VIP')
INSERT INTO Cliente VALUES ('Fernanda de Oliveira', 'fer@gmail.com', 'F', '99878542163', 'VIP')
INSERT INTO Cliente VALUES ('Manuel Brandão', 'manub@gmail.com', 'M', '12225401224', 'ACA')
INSERT INTO Cliente VALUES ('Adriano Santos', 'dri@yahoo.com.br', 'M', '47112458810', NULL)
INSERT INTO Cliente VALUES ('Mariana Silva', 'mari_35@hotmail.com', 'F', '00124587433', NULL)
INSERT INTO Cliente VALUES ('Jonatas Cerrado', NULL, 'M', '65854521774', NULL)
INSERT INTO Cliente VALUES ('Teneci Fernandes', 'tenecifernandes@gmail.com', 'F', '25487741514', 'ACA')
INSERT INTO Cliente VALUES ('Andre Silva', 'andre@gmail.com', 'M', '23487741514', 'ACA')
INSERT INTO Cliente VALUES ('Andre Uldam', 'andre@gmail.com', 'M', '23487741514', NULL)
INSERT INTO Cliente VALUES ('Adriano Marin', 'drim@yahoo.com.br', 'M', '41231124580', NULL)
INSERT INTO Cliente VALUES ('Maria Silva', 'mari5@outlook.com', 'F', '45124587433', 'VIP')


-- Inserndo dados na tabel ade Categoria
INSERT INTO Categoria VALUES ('Tenis')
INSERT INTO Categoria VALUES ('Camiseta')
INSERT INTO Categoria VALUES ('Bola')
INSERT INTO Categoria VALUES ('Equipamento musculação')
INSERT INTO Categoria VALUES ('Meias')


-- Inserndo dados na tabela de Marcas
INSERT INTO Marca VALUES ('Nike')
INSERT INTO Marca VALUES ('Adidas')
INSERT INTO Marca VALUES ('Penalty')
INSERT INTO Marca VALUES ('Iron')
INSERT INTO Marca VALUES ('Pulma')
INSERT INTO Marca VALUES ('Lupo')
INSERT INTO Marca VALUES ('Reebok')

-- Inserindo dados na tabel ade Produto
INSERT INTO Produto VALUES ('Camiseta cavada', 150.00, 2, 2)
INSERT INTO Produto VALUES ('Nike air 350', 300.00, 1, 1)
INSERT INTO Produto VALUES ('Bola de basquete', 200.00, 3, 3)
INSERT INTO Produto VALUES ('Bola de futebol', 100.00, 3, 3)
INSERT INTO Produto VALUES ('Meia para futebol de salão (preta)', 50.00, 5, 6)
INSERT INTO Produto VALUES ('Meia para futebol de salão (amarela)', 50.00, 5, 6)
INSERT INTO Produto VALUES ('Meia para futebol de salão (branca)', 30.00, 5, NULL)
INSERT INTO Produto VALUES ('Barra para supino 1m50', 355.30, 4, 4)
INSERT INTO Produto VALUES ('Peso 50kg para supino', 220.40, 4, 4)
INSERT INTO Produto VALUES ('Meia para futebol de campo (branca)', 45.00, 5, 6)
INSERT INTO Produto VALUES ('Meia para futebol de campo (verde)', 45.00, 5, 6)
INSERT INTO Produto VALUES ('Meia para futebol de campo (azul)', 45.00, 5, 6)
INSERT INTO Produto VALUES ('Tenis de corrida profissional', 750.00, 1, 5)
INSERT INTO Produto VALUES ('Tenis de corrida genérico', 440.00, 1, NULL)


-- Inserindo dados na tabel ade Venda
INSERT INTO Venda VALUES (1, '12345678912345', '20150102 10:20')
INSERT INTO Venda VALUES (2, '12345678912345', '20150102 11:25')
INSERT INTO Venda VALUES (1, '12345678912345', '20150103 10:00')
INSERT INTO Venda VALUES (4, '12345678912345', '20150103 11:25')
INSERT INTO Venda VALUES (3, '12345678912345', '20150103 15:00')
INSERT INTO Venda VALUES (5, '12345678912345', '20150315 15:00')
INSERT INTO Venda VALUES (1, '98754124541001', '20150422 14:00')
INSERT INTO Venda VALUES (4, '98754124541001', '20150423 12:25')
INSERT INTO Venda VALUES (2, '98754124541001', '20150422 14:00')
INSERT INTO Venda VALUES (6, '01234568874512', '20150502 20:25')

           
-- Inserindo dados na tabel ade VendaProduto
INSERT INTO [VendaProduto] VALUES (1, 3, 200, 10, 2000)
INSERT INTO [VendaProduto] VALUES (1, 1, 150, 2, 300)
INSERT INTO [VendaProduto] VALUES (1, 6, 50, 3, 150)
INSERT INTO [VendaProduto] VALUES (1, 7, 355.30, 1, 355.30)
INSERT INTO [VendaProduto] VALUES (2, 3, 180, 20, 3600)
INSERT INTO [VendaProduto] VALUES (3, 1, 150, 2, 300)
INSERT INTO [VendaProduto] VALUES (4, 11, 45, 1, 45)
INSERT INTO [VendaProduto] VALUES (5, 7, 355.30, 1, 355.30)
INSERT INTO [VendaProduto] VALUES (5, 10, 30, 10, 300)
INSERT INTO [VendaProduto] VALUES (6, 3, 200, 10, 2000)
INSERT INTO [VendaProduto] VALUES (6, 6, 50, 3, 150)
INSERT INTO [VendaProduto] VALUES (7, 1, 150, 2, 300)
INSERT INTO [VendaProduto] VALUES (7, 3, 200, 2, 400)
INSERT INTO [VendaProduto] VALUES (7, 5, 50, 3, 150)
INSERT INTO [VendaProduto] VALUES (7, 9, 45, 2, 90)
INSERT INTO [VendaProduto] VALUES (7, 12, 750, 1, 750)
INSERT INTO [VendaProduto] VALUES (8, 2, 300, 1, 300)
INSERT INTO [VendaProduto] VALUES (8, 12, 750, 1, 750)
INSERT INTO [VendaProduto] VALUES (9, 5, 50, 2, 100)
INSERT INTO [VendaProduto] VALUES (10, 2, 300, 1, 300)
INSERT INTO [VendaProduto] VALUES (10, 3, 200, 1, 200)





