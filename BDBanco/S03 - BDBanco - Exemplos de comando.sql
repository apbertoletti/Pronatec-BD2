/*************************************************************
* PRONATEC/UNIMEP 
* CURSO: T�cnico em Inform�tica para Internet
* PROFESSOR: Andr� Bertoletti (apbertolet@unimep.br)
* DISPCIPLINA: Banco de Dados II 
* SCRIPT: Exemplo de scripts transacionais do BDBanco
**************************************************************/

/*********************
* AULA 11: Transa��o de banco de dados
*********************/

-----------------------------------------------------------------------------------
-- 1) Exemplo da transfer�ncias de saldos entre correntistas
-----------------------------------------------------------------------------------

--INICIO DA TRANSA��O
--Abertura expl�cita da transa��o
BEGIN TRAN

--Abertura do bloco TRY (tente executar os comandos abaixo) 
BEGIN TRY
	--Declara��o das vari�veis
	DECLARE @ValorTransferido DECIMAL(18,2) 
	DECLARE @SaldoAtualDoDebito DECIMAL(18,2)
	DECLARE @IDCorrentistaOrigem INT
	DECLARE @IDCorrentistaDestino INT
	
	--Preenchimento das vari�veis
	SET @ValorTransferido = 250
	SET @IDCorrentistaOrigem = 3
	SET @IDCorrentistaDestino = 1
	
	--Verifica se o ID do Correntista de origem existe na tabela
	IF (SELECT COUNT(*) FROM Correntista WHERE ID = @IDCorrentistaOrigem) = 0
	BEGIN
		--For�a a ocorr�ncia de um erro, enviando uma mensagem coerente ao motivo
		RAISERROR('O Correntista de origem n�o existe na base de dados', 14, 1)
	END	
	
	--Preenche a vari�vel @SaldoAtualDoDebito com o saldo atual do correntista de origem
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
		--For�a a ocorr�ncia de um erro, enviando uma mensagem coerente ao motivo
		RAISERROR('O saldo do corrente � insuficiente para esta transfer�ncia.', 14, 1)
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
		--For�a a ocorr�ncia de um erro, enviando uma mensagem coerente ao motivo
		RAISERROR('O Correntista de destino n�o existe na base de dados', 14, 1)
	END
	
	--Credita o correntista de destino no valor a ser transferido
	UPDATE 
		Correntista
	SET
		SaldoAtual = SaldoAtual + @ValorTransferido
	WHERE
		ID = @IDCorrentistaDestino
		
	--FIM DA TRANSA��O
	--Grava todas as opera��es cobertas pela transa��o atual
	COMMIT TRAN
	
	--Mostra uma mensagem dizendo que deu tudo certo
	SELECT 'Transfer�ncia realizada com sucesso!'	
END TRY
--Abertura do bloco CATCH (se der algum erro no bloco de tentativa, o fluxo ser� desviado para o bloco Catch)
BEGIN CATCH
	--FIM DA TRANSA��O
	--Desfaz toda a transa��o atual
	ROLLBACK TRAN
	
	--Mostra uma mensagem com o motivo do erro
	SELECT ERROR_MESSAGE() AS Retorno
END CATCH

