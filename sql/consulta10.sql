--- Consulta 10: Tratamento de Erro e Rollback
--- Objetivo: Simula uma falha durante o processo de pagamento e utiliza ROLLBACK para garantir a integridade do banco de dados.
SAVEPOINT sp_teste_erro;

INSERT INTO HISTORICO (id_investigacao, acao_realizada, usuario_sistema) 
VALUES (1, 'Tentativa de alteracao temporaria', 'test_user');

-- Simulação de cancelamento / rollback consciente
ROLLBACK TO SAVEPOINT sp_teste_erro;

SELECT COUNT(*) AS total_historicos_apos_rollback FROM HISTORICO WHERE usuario_sistema = 'test_user';