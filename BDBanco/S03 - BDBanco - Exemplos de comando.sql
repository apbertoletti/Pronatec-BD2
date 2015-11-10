/*************************************************************
* PRONATEC/UNIMEP 
* CURSO: Técnico em Informática para Internet
* PROFESSOR: André Bertoletti (apbertolet@unimep.br)
* DISPCIPLINA: Banco de Dados II 
* SCRIPT: Exemplo de scripts transacionais do BDBanco
**************************************************************/

/*********************
* AULA 11: Transação de banco de dados
*********************/

-----------------------------------------------------------------------------------
-- 1) Exemplo da transferências de saldos entre correntistas
-----------------------------------------------------------------------------------

--INICIO DA TRANSAÇÃO
--Abertura explícita da transação
BEGIN TRAN

--Abertura do bloco TRY (tente executar os comandos abaixo) 
BEGIN TRY
	--Declaração das variáveis
	DECLARE @ValorTransferido DECIMAL(18,2) 
	DECLARE @SaldoAtualDoDebito DECIMAL(18,2)
	DECLARE @IDCorrentistaOrigem INT
	DECLARE @IDCorrentistaDestino INT
	
	--Preenchimento das variáveis
	SET @ValorTransferido = 250
	SET @IDCorrentistaOrigem = 3
	SET @IDCorrentistaDestino = 1
	
	--Verifica se o ID do Correntista de origem existe na tabela
	IF (SELECT COUNT(*) FROM Correntista WHERE ID = @IDCorrentistaOrigem) = 0
	BEGIN
		--Força a ocorrência de um erro, enviando uma mensagem coerente ao motivo
		RAISERROR('O Correntista de origem não existe na base de dados', 14, 1)
	END	
	
	--Preenche a variável @SaldoAtualDoDebito com o saldo atual do correntista de origem
	SELECT 
		@SaldoAtualDoDebito = SaldoAtual 
	FROM 
		Correntista 
	WHERE 
		ID = @IDCorrentistaOrigem	
		
	--Verificar se o correntista de origem possui saldo suficiente para debito,
	--a fim de 
	IF (@ValorTransferido > @SaldoAtualDoDebito)
	BEGIN
		--Força a ocorrência de um erro, enviando uma mensagem coerente ao motivo
		RAISERROR('O saldo do corrente é insuficiente para esta transferência.', 14, 1)
	END
	
	--Debita o correntista de origem no valor a ser transferido
	UPDATE 
		Correntista 
	SET 
		SaldoAtual = SaldoAtual - @ValorTransferido
	WHERE
		ID = @IDCorrentistaOrigem
	
	--Verifica se o ID do Correntista de destino existe na tabela
	IF (SELECT COUNT(*) FROM Correntista WHERE ID = @IDCorrentistaDestino) = 0
	BEGIN
		--Força a ocorrência de um erro, enviando uma mensagem coerente ao motivo
		RAISERROR('O Correntista de destino não existe na base de dados', 14, 1)
	END
	
	--Credita o correntista de destino no valor a ser transferido
	UPDATE 
		Correntista
	SET
		SaldoAtual = SaldoAtual + @ValorTransferido
	WHERE
		ID = @IDCorrentistaDestino
		
	--FIM DA TRANSAÇÃO
	--Grava todas as operações cobertas pela transação atual
	COMMIT TRAN
	
	--Mostra uma mensagem dizendo que deu tudo certo
	SELECT 'Transferência realizada com sucesso!'	
END TRY
--Abertura do bloco CATCH (se der algum erro no bloco de tentativa, o fluxo será desviado para o bloco Catch)
BEGIN CATCH
	--FIM DA TRANSAÇÃO
	--Desfaz toda a transação atual
	ROLLBACK TRAN
	
	--Mostra uma mensagem com o motivo do erro
	SELECT ERROR_MESSAGE() AS Retorno
END CATCH

