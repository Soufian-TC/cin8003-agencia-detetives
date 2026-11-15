--- Consulta 9: Transação de Confirmação de Pagamento com Registro no Histórico
--- Objetivo: Confirma o pagamento pendente (ID 2) do contrato CT-2026-001 e registra a ação no histórico dentro de uma única transação.
--- O SAVEPOINT isola o registro de auditoria; o COMMIT torna as duas alterações permanentes. O SELECT final exibe o resultado.
BEGIN TRANSACTION;

UPDATE PAGAMENTO 
SET status = 'CONFIRMADO' 
WHERE id_pagamento = 2 
  AND status = 'PENDENTE';

SAVEPOINT sp_historico;

INSERT INTO HISTORICO (id_investigacao, acao_realizada, usuario_sistema) 
VALUES (1, 'Pagamento ID 2 confirmado manualmente via transacao', 'financeiro_user');

RELEASE SAVEPOINT sp_historico;
COMMIT;

SELECT id_pagamento, id_contrato, valor, status 
FROM PAGAMENTO 
WHERE id_contrato = 1;
