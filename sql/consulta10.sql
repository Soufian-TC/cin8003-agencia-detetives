--- Consulta 10: Tratamento de Erro com SAVEPOINT e ROLLBACK
--- Objetivo: Simula uma alteração indevida no histórico durante uma transação e a desfaz com ROLLBACK TO SAVEPOINT.
--- O SELECT final comprova que nenhum registro temporário permaneceu no banco (resultado esperado: 0).
BEGIN TRANSACTION;
SAVEPOINT sp_teste_erro;

INSERT INTO HISTORICO (id_investigacao, acao_realizada, usuario_sistema) 
VALUES (1, 'Tentativa de alteracao temporaria', 'test_user');

-- Simulação de cancelamento / rollback consciente
ROLLBACK TO SAVEPOINT sp_teste_erro;
RELEASE SAVEPOINT sp_teste_erro;
COMMIT;

SELECT COUNT(*) AS total_historicos_apos_rollback 
FROM HISTORICO 
WHERE usuario_sistema = 'test_user';
