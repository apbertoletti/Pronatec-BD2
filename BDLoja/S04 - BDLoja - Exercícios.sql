/****************************************************/
/************** EXERCÍCOS - Aula 4 ******************/
/****************************************************/

--E1) Selecione o nome e o sexo dos clientes que começam com as iniciais "Ma"
SELECT 
	Nome, 
	Sexo 
FROM 
	Cliente 
WHERE 
	Nome LIKE 'Ma%'

--E2) Selecione todos os produtos que tenha alguma referencia ao esporte futebol em sua descricao
SELECT 
	* 
FROM 
	Produto 
WHERE 
	Descricao LIKE '%futebol%'

--E3) Selecione todas as colunas dos homens que possuam conta de email no yahoo
SELECT 
	* 
FROM 
	Cliente 
WHERE 
	Sexo = 'M' AND Email LIKE '%yahoo%'

--E4) Mostre quantos produtos da categoria bola custam entre 100 e 150 reais
SELECT 
	COUNT(*) AS 'Total de produtos'
FROM 
	Produto
WHERE
	(IDCategoria = 3) AND (Valor BETWEEN 100 AND 150)
	
--E5) Exclua todos os produtos que custam menos do que 50 reais
DELETE FROM 
	Produto
WHERE
	Valor < 50

--E6) Limpe todos os emails de clientes que possuam conta no gmail
UPDATE 
	Cliente
SET
	Email = ''
WHERE 
	Email LIKE '%gmail%'
	
	

/****************************************************/
/************** EXERCÍCOS - Aula 5 ******************/
/****************************************************/


--E7) Selecione a quantidade total de clientes que começam com as iniciais "Ma"
SELECT 
	COUNT(*)
FROM 
	Cliente
WHERE 
	Nome LIKE 'Ma%'

--E8) Selecione o valor total de produtos que possam ser utilizados para vestir os pés
--Primeiro verificamos quais os IDs 
--das categorias que vestem os pés
SELECT * FROM Categoria

--Em seguida, fazemos query utilizando 
--os IDs das categorias correspondentes
SELECT 
	SUM(Valor)
FROM
	Produto
WHERE
	IDCategoria = 1 OR IDCategoria = 5
	
--E9) Selecione somente os dois primeiros homens da sua lista de clientes que comecem com a letra "A"
SELECT
	TOP 2 *
FROM 
	Cliente
WHERE
	Nome LIKE 'A%'

--E10) Selecione o valor médio dos produtos que custam entre 200 e 300 reais
SELECT 
	AVG(Valor)
FROM 
	Produto
WHERE 
	Valor BETWEEN 200 AND 300
	
--E11) Seleciona quantos clientes NÃO possuem e-mail cadastrado na sua base de dados
SELECT 
	COUNT(*)
FROM 
	Cliente
WHERE
	(Email IS NULL) OR (Email = '')
