/*************************************************************
* PRONATEC/UNIMEP 
* CURSO: Técnico em Informática para Internet
* PROFESSOR: André Bertoletti (apbertolet@unimep.br)
* DISPCIPLINA: Banco de Dados II 
* SCRIPT: Exemplos dos comandos SQL (BDLoja)
**************************************************************/

/***************************************************************************************
* AULA 3: Seleção de registros (SELECT), Atualização de registro (UPDATE), Deleção de registros (DELETE)
***************************************************************************************/

-- 1) Seleciona todas as colunas de todos os Estabelecimentos
SELECT * FROM Estabelecimento

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

-- 8) Limpa o telefone de todas as Estabelecimentos 
UPDATE Estabelecimento SET Telefone = ''

-- 9) Altera o telefone do Estabelecimento do Centro para "3241-5587"
UPDATE Estabelecimento SET Telefone = '3241-5587' WHERE CNPJ = '98754124541001'

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

-- 14.1) Excluindo todos os produtos mais caros do que 500
-----> CUIDADO!!! Não esquecer de selecionar a clausula WHERE
DELETE FROM Produto WHERE Valor > 500


/***************************************************************************************
* AULA 4: Ordenação (ORDER BY), Busca aproximada (LIKE) e Busca de intervalos (BETWEEN)
***************************************************************************************/

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


/***************************************************************************************
* AULA 5: Soma (SUM), Média (AVG), Contagem (COUNT) e Limitação de registro (TOP)
****************************************************************************************/

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


/***************************************************************************************
* AULA 6: Distinct e Group By
****************************************************************************************/

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

/***************************************************************************************
* AULA 7: Apresentação dos exercícios práticos de cada aluno
****************************************************************************************/


/***************************************************************************************
* AULA 8: Sub-consultas (sub-querys)
****************************************************************************************/

-- 39) Trazer todas as colunas dos produtos da categoria meia, 
-- através de sub-query
SELECT * FROM Produto WHERE IDCategoria IN (SELECT ID FROM Categoria WHERE Nome = 'Meias')


-- 40) Trazer todas as colunas dos produtos das categorias que
-- podem vestir os pés, através de sub-query
SELECT 
	* 
FROM 
	Produto
WHERE 
	IDCategoria IN (SELECT ID FROM Categoria WHERE Nome = 'Tenis' OR Nome = 'Meias')

	
-- 41) Trazer todas as colunas dos produtos das categorias que
-- NÃO podem vestir os pés, através de sub-query
SELECT 
	* 
FROM 
	Produto
WHERE 
	IDCategoria NOT IN (SELECT ID FROM Categoria WHERE Nome = 'Tenis' OR Nome = 'Meias')


-- 42) Trazer todas as colunas dos produtos, e também uma outra
-- que mostre o nome da categoria a qual pertence
SELECT 
	ID, -- Primeira coluna (ID)
	Descricao, -- Segunda coluna (Descricao)
	(SELECT Nome FROM Categoria WHERE ID = Produto.IDCategoria) AS NomeCategoria -- Terceira coluna (NomeCategoria)
FROM 
	Produto
	
	
-- 43) Trazer todas as colunas dos produtos e também uma coluna a 
-- mais que mostre o total de vendas realizadas de cada produto,
-- através de sub-query
SELECT 
	ID,
	Descricao,
	(SELECT 
		SUM(ValorTotal) 
	 FROM 
		VendaProduto 
	 WHERE 
		IDProduto = Produto.ID) AS ValorTotal
FROM
	Produto

	
-- 44) Trazer todas as colunas dos produtos, uma coluna que mostre 
-- o total de vendas realizadas de cada produto e também uma outra
-- que mostre o nome da categoria a qual pertence
SELECT 
	ID, -- Primeira coluna (ID)
	Descricao, -- Segunda coluna (Descricao)
	(SELECT SUM(ValorTotal) FROM VendaProduto WHERE IDProduto = Produto.ID) AS ValorTotal, -- Terceira coluna (ValorTotal)
	(SELECT Nome FROM Categoria WHERE ID = Produto.IDCategoria) AS NomeCategoria -- Quarta coluna (NomeCategoria)
FROM 
	Produto


/******************************************************************************************************************
* AULA 9: Junção de tabelas, através de duas técnicas com sintaxes diferentes mas resultados iguais: WHERE e JOIN
*******************************************************************************************************************/

/*********** Exemplos utilizando junção de tabelas com WHERE **********************/
/*********** Esta é uma ténica mais antiga e pouco utilizada hoje em dia **********/

-- 45) Mostrando o ID e Descrição do produto e também o nome de sua categoria
-- O resultado é o mesmo da sub-query do exemplo nº42, 
-- porém agora usando a técnica da junção de tabelas, cuja execução é bem mais rápida
SELECT 
	Produto.ID,
	Produto.Descricao,	
	Categoria.Nome AS NomeCategioria
FROM
	Produto, Categoria
WHERE
    Produto.IDCategoria = Categoria.ID
    

-- 46) Mostrando o CPF, Nome, Email e o nome do Grupo a qual o cliente faz parte.
SELECT 
	Cliente.CPF,
	Cliente.Nome,
	Cliente.Email,
	GrupoCliente.Descricao
FROM
	Cliente, GrupoCliente
WHERE
	Cliente.SiglaGrupo = GrupoCliente.Sigla	

--47) Mostrando a descrição, valor, nome da categoria e nome da marca de todos os produtos.
SELECT 
	Produto.Descricao,
	Produto.Valor,
	Categoria.Nome,
	Marca.Nome
FROM
	Produto, Categoria, Marca
WHERE
    Produto.IDCategoria = Categoria.ID AND
    Produto.IDMarca = Marca.ID
    
    
-- 48) Mostrando a descrição do produto, nome de sua categoria, valor e nome da sua marca.
-- Nesta query é exemplificado o uso da clausula 'AS' a fim de apelidar colunas e tabelas, 
-- passando a valer estes apeldidos no SELECT e no WHERE
SELECT 
	prod.Descricao AS [Nome do Produto],
	c.Nome AS [Nome da Categoria],
	prod.Valor,
	m.Nome AS [Nome da Marca]
FROM
	Produto AS prod, Categoria AS c, Marca as m
WHERE
	c.ID = prod.IDCategoria AND
	m.ID = prod.IDMarca

/*********** Exemplos utilizando junção de tabelas com JOIN **********************/
/*********** Esta é uma ténica mais recente e mais recomendada para uso **********/
/*********** Dê preferência para utilizar esta segunda técnica, pois o código fica mais limpo **********/
    
--49) Resolvendo a mesmo junção do exemplo nº 45, porém agora com INNER JOIN
SELECT     
	Produto.ID, 
	Produto.Descricao, 
	Categoria.Nome AS NomeCategioria
FROM         
	Produto 
	INNER JOIN Categoria ON Produto.IDCategoria = Categoria.ID
    
--50) Resolvendo a mesmo junção do exemplo nº 46, porém agora com INNER JOIN
SELECT     
	Cliente.CPF, 
	Cliente.Nome, 
	Cliente.Email, 
	GrupoCliente.Descricao
FROM         
	Cliente 
	INNER JOIN GrupoCliente ON Cliente.SiglaGrupo = GrupoCliente.Sigla
	
--51) Resolvendo a mesmo junção do exemplo nº 47, porém agora com INNER JOIN	    
SELECT     
	Produto.Descricao, 
	Produto.Valor, 
	Categoria.Nome, 
	Marca.Nome 
FROM         
	Produto 
	INNER JOIN Categoria ON Produto.IDCategoria = Categoria.ID 
	INNER JOIN Marca ON Produto.IDMarca = Marca.ID

--52) Resolvendo a mesmo junção do exemplo nº 48, porém agora com INNER JOIN	    
SELECT     
	prod.Descricao AS [Nome do Produto], 
	c.Nome AS [Nome da Categoria], 
	prod.Valor, 
	m.Nome AS [Nome da Marca]
FROM 
    Produto AS prod 
    INNER JOIN Categoria AS c ON prod.IDCategoria = c.ID 
    INNER JOIN Marca AS M ON prod.IDMarca = M.ID
    
    
/******************************************************************************************************************
* AULA 10: Junção de tabelas: INNER JOIN, LEFT JOIN, RIGTH JOIN e FULL JOIN
*******************************************************************************************************************/

--53) Juntando Produto e Marca através de INNER JOIN, ou seja, 
--mostra somente os produtos que tenham a coluna marca definida 
--na tabela relacionada de Marca
SELECT 
	*
FROM
	Produto
	INNER JOIN Marca ON Produto.IDMarca = Marca.ID


--54) Juntando Produto e Marca através de LEFT JOIN, ou seja, 
--mostra todos os produtos, indpendende se possuem ou definição de marca
--OBS: Na cláusula FROM, a tabela Produto está definida antes da tabela Marca, 
--por isso, Produto está a esquerda (LEFT) da Marca
SELECT 
	*
FROM
	Produto
	LEFT JOIN Marca ON Produto.IDMarca = Marca.ID
	
	
--55) Juntando Produto e Marca através de RIGHT JOIN, ou seja, 
--mostra somente os produtos que tenham a coluna marca definida 
--na tabela relacionada de Marca, e também as Marcas que não 
--possuem produtos relacionados a ela.
--OBS: Na cláusula FROM, a tabela Marca está definida depois da tabela Produto, 
--por isso, Marca está a direita (RIGHT) da Produto
SELECT 
	*
FROM
	Produto
	RIGHT JOIN Marca ON Produto.IDMarca = Marca.ID

--56) Juntando Produto e Marca através de RIGHT JOIN, ou seja, 
-- mostra todos os registros de ambas as tabelas, havendo ou não relação entre elas
SELECT 
	*
FROM
	Produto
	FULL JOIN Marca ON Produto.IDMarca = Marca.ID


/******************************************************************************************************************
* AULA 11: Transações de banco de dados
*******************************************************************************************************************/

BEGIN TRAN
BEGIN TRY
	DECLARE @Nome VARCHAR(100)
	DECLARE @Email VARCHAR(200)
	DECLARE @Sexo CHAR(1)
	DECLARE @CPF CHAR(11)
	DECLARE @Residencial VARCHAR(15)
	DECLARE @Celular VARCHAR(15)
	DECLARE @Logradouro VARCHAR(200)
	DECLARE @Numero VARCHAR(10)
	DECLARE @Complemento VARCHAR(100)
	DECLARE @Bairro VARCHAR(100)
	DECLARE @CEP CHAR(8)
	
	SET @Nome = 'Juvenal Santana 2'
	SET @Email = 'juju2@teste.com.br'
	SET @Sexo = 'M'
	SET @CPF = '45477888772'
	SET @Residencial = '19-3574.5412'
	SET @Celular = '19-3574.5412'
	SET @Logradouro = 'Av. Independencia'
	SET @Numero = '2340'
	SET @Complemento = ''
	SET @Bairro = 'Centro'
	SET @CEP = '13500240'

	INSERT INTO Cliente (Nome, Email, Sexo, CPF) 
	VALUES (@Nome, @Email, @Sexo, @CPF)

	--Obtém o valor do último ID sequencial gerado pelo SQL Server
	DECLARE @IdClienteGerado INT
	SELECT @IdClienteGerado = @@IDENTITY
	
	IF (@Residencial = @Celular)
	BEGIN
		RAISERROR('Não é possivel cadastrar fones iguais para o mesmo cliente', 14, 1)
	END
	
	INSERT INTO ClienteTelefone (IDCliente, Telefone)
	VALUES(@IdClienteGerado, @Residencial)
	
	INSERT INTO ClienteTelefone (IDCliente, Telefone)
	VALUES(@IdClienteGerado, @Celular)
	
	INSERT INTO ClienteEndereco (IDCliente, Logradouro, Numero, Complemento, Bairro, CEP)
	VALUES(@IdClienteGerado, @Logradouro, @Numero, @Complemento, @Bairro, @CEP)
	
	COMMIT TRAN
	
	SELECT 'Cliente cadastrado como sucesso!'
END TRY
BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS Retorno
END CATCH