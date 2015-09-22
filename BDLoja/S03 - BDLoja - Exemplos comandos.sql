/*************************************************************
* PRONATEC/UNIMEP 
* CURSO: Técnico em Informática para Internet
* PROFESSOR: André Bertoletti (apbertolet@unimep.br)
* DISPCIPLINA: Banco de Dados II 
* SCRIPT: Exemplos dos comandos SQL
**************************************************************/

-- 1) Seleciona todas as colunas de todas as lojas
SELECT * FROM Loja

-- 2) Seleciona todas as colunas dos clientes femininos
SELECT * FROM Cliente WHERE Sexo = 'F'

-- 3) Seleciona todas as colunas de todas as categorias
SELECT * FROM Categoria

-- 4) Seleciona a descrição e o valor de todos os produtos
SELECT Descricao, Valor FROM Produto

-- 5) Seleciona somente os produtos da categoria camiseta
-----> 5.1) Primeiro, encontra qual é o ID da categoria desejada (camiseta)
SELECT * FROM Categoria
-----> 5.2) Depois, faz a seleção filtrando pelo ID desta categoria
SELECT 
	* 
FROM 
	Produto 
WHERE 
	IDCategoria = 2

-- 6) Seleciona todas as colunas somente dos produtos mais 
-- caros do que 100 
SELECT 
	* 
FROM 	
	Produto  
WHERE 	
	Valor > 100 
	

-- 7) Seleciona todas as colunas somente dos produtos mais 
-- caros do que 100 e da categoria "Equipamento musculação" 
-----> 7.1) Primeiro, encontra qual é o ID da categoria desejada 
SELECT * FROM Categoria
-----> 7.2) Depois, faz a seleção filtrando pelo ID desta categoria
SELECT 
	* 
FROM 	
	Produto  
WHERE 	
	Valor > 100 AND IDCategoria = 4

-- 8) Limpa o telefone de todas as lojas 
UPDATE Loja SET Telefone = ''

-- 9) Altera o telefone da Loja do Centro para "3241-5587"
UPDATE Loja SET Telefone = '3241-5587' WHERE CNPJ = '98754124541001'

-- 10) Aumenta o valor de todos os produtos em 10%
UPDATE Produto SET Valor = Valor * 1.10

-- 11) Aumenta o valor de todas as camisetas em 30%
----- CUIDADO!!! NÃO ESQUEÇA DE SELECIONAR A CLAUSULA O WHERE
UPDATE Produto SET Valor = Valor * 1.30 WHERE IDCategoria = 2

-- 12) Aumenta o preço de todas as camisetas em 30%,
-- arredondando para 0 (zero) casas decimais
----- CUIDADO!!! NÃO ESQUEÇA DE SELECIONAR A CLAUSULA O WHERE
UPDATE Produto SET Valor = ROUND(Valor * 1.30, 0) WHERE IDCategoria = 2


-- 13) acrescentar uma nova categoria chamada "Calçados"
-- e trocar todos produtos da categoria "Tenis" para esta nova
-- categoria chamada "Calçado"

-----> 13.1) Incluir as nova categoria
INSERT INTO Categoria VALUES ('Calçado')

-----> 13.2) Mostrar a nova categoria criada
SELECT * FROM Categoria
--- ID: 6 - Calçado
--- ID: 1 - Tenis

-----> 13.3) Verifica quais/quantos produtos são "Tenis"
SELECT
	*
FROM 
	Produto
WHERE
	IDCategoria = 1
	
-----> 13.4) Alterar os produtos "Tenis" para "Calçado"
UPDATE 
	Produto 
SET
	IDCategoria = 6
WHERE
	IDCategoria = 1
	
-----> 13.5) Conferir se a alterção foi bem sucessida
SELECT * FROM Produto WHERE IDCategoria = 6
SELECT * FROM Produto WHERE IDCategoria = 1
SELECT * FROM Produto



-- 14) Deletando a categoria "Tenis"
-----> CUIDADO!!! Não esquecer de selecionar a clausula WHERE
DELETE FROM Categoria WHERE ID = 1

-- 15) Excluindo todos os produtos mais caros do que 500
-----> CUIDADO!!! Não esquecer de selecionar a clausula WHERE
DELETE FROM Produto WHERE Valor > 500




-- 15) Ordernar por nome de cliente
SELECT 
	*
FROM
	Cliente
ORDER BY
	Nome DESC

	
-- 16) Order por duas colunas, uma ascendente e outra descendente
SELECT 
	*
FROM
	Cliente
ORDER BY
	Sexo ASC, Nome DESC


-- 17) Contar quantos clientes homens estão cadastrados
SELECT 
	COUNT(*) AS 'TotalDeHomens'
FROM
	Cliente
WHERE
	Sexo = 'M'


-- 18) Trazer todas as colunas dos produtos 
-- que começam com "Meia"
SELECT 
    *
FROM
    Produto
WHERE
    Descricao LIKE 'Meia%'

-- 19) Trazer todas as colunas dos produtos 
-- que custam entre 200 e 300 reais
SELECT 
    *
FROM
    Produto
WHERE
    Valor BETWEEN 200 AND 300


-- 20) Selecionar todas as colunas somente 
-- dos 2 primeiros clientes
SELECT TOP 2 * FROM Cliente

-- 21) Selecionar o CPF, Nome e Sexo 
-- dos 3 primeiros clientes
SELECT TOP 2 CPF, Nome, Sexo FROM Cliente 

-- 22) Selecionar o CPF, Nome e Sexo dos 3 
--ultimos clientes ordernados pelo nome
SELECT TOP 3 CPF, Nome, Sexo 
FROM Cliente 
ORDER BY Nome DESC


-- 23) Selecione quantos cliente tem ao todo na sua tabela
SELECT COUNT(*) AS TotalDeClientes FROM Cliente

-- 24) Selecione quantas mulheres tem na sua base de clientes
SELECT COUNT(*) FROM Cliente WHERE Sexo = 'F'


-- 25) Selecione o valor total dos produtos 
SELECT SUM(Valor) FROM Produto

-- 26) Selecione o valor total dos produtos da categoria Meia
-----> 26.1) Primeiro encontra qual é o ID da categoria desejada (meias)
SELECT * FROM Categoria

-----> 26.2) Faz a seleção filtrando pelo ID desta categoria
SELECT SUM(Valor) FROM Produto WHERE IDCategoria = 5


-- 30) Selecionar a media de valores dos produtos
----->Sem arrendodamento
SELECT AVG(Valor) FROM Produto 
----->Com arredondamento
SELECT ROUND(AVG(Valor), 2) FROM Produto 

-- 31) Selecione o valor médito dos produtos da categoria Meia,
-- arredondando o resultado para 2 casas decimais
-----> 31.1) Primeiro encontra qual é o ID da categoria desejada (meias)
SELECT * FROM Categoria

-----> 31.2) Faz a seleção filtrando pelo ID desta categoria
SELECT ROUND(AVG(Valor), 2) FROM Produto WHERE IDCategoria = 5


-- 32) Traz somente a coluna sexo removendo as duplicadas
-----> 32.1) Trazendo somente a coluna sexo de todos os registros
SELECT Sexo FROM Cliente
-----> 32.2) Trazendo somente a coluna sexo de todos os registros,
-----  porém, removendo as duplicadas.
SELECT DISTINCT Sexo FROM Cliente

-- 33) Traz somente as 5 primeiras letras do nome e a coluna sexo 
-- removendo as duplicadas
SELECT DISTINCT SUBSTRING(Nome, 1, 5), Sexo FROM Cliente


-- 34) Agupar os sexos iguais dos clientes
SELECT
	Sexo
FROM 
	Cliente
GROUP BY
	Sexo

	
-- 35) Agupar os sexos iguais dos clientes,
-- mostrando quantos registros tem de cada um
SELECT
	Sexo, COUNT(*)
FROM 
	Cliente
GROUP BY
	Sexo


-- 36) Agrupar as categorias iguais dos produtos 
-----> 36.1) Verificando antes como estão os registros da tabela produto
SELECT * FROM Produto


-----> 36.2) Agrupando as categorias iguais dos produtos
SELECT IDCategoria FROM Produto GROUP BY IDCategoria	


-- 37) Agrupando as categorias iguais dos produtos e contando cada uma delas
SELECT IDCategoria, COUNT(*) FROM Produto GROUP BY IDCategoria	


-- 38) Agrupando as categorias iguais dos produtos, contando e somando cada uma delas
SELECT 
	IDCategoria, 
	COUNT(*) AS 'Contagem', 
	SUM(Valor) AS 'Total'
 FROM 
	Produto 
 GROUP BY 
	IDCategoria	
