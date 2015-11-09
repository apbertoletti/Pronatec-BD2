
BEGIN TRAN
BEGIN TRY
	DECLARE @IDCorrentistaOrigem INT = 3
	DECLARE @IDCorrentistaDestino INT = 1
	DECLARE @ValorMovimentado DECIMAL(18,2) = 250
	
	IF ((SELECT COUNT(*) FROM Correntista WHERE ID = @IDCorrentistaOrigem) > 0)
		UPDATE Correntista SET SaldoAtual = SaldoAtual - @ValorMovimentado WHERE ID = @IDCorrentistaOrigem

	IF ((SELECT COUNT(*) FROM Correntista WHERE ID = @IDCorrentistaDestino) > 0)
		UPDATE Correntista SET SaldoAtual = SaldoAtual + @ValorMovimentado WHERE ID = @IDCorrentistaDestino
	
	SELECT 'Transferencia efetuada com sucesso!' AS Retorno
	
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS Retorno
END CATCH

