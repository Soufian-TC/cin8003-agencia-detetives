--- Consulta 9: Transação Segura de Novo Contrato e Pagamento
--- Objetivo: Simula o registro de um novo contrato e seu pagamento inicial dentro de uma transação segura (SAVEPOINT/COMMIT).
BEGIN TRANSACTION;
SAVEPOINT sp_pagamento;

UPDATE PAGAMENTO 
SET status = 'CONFIRMADO' 
WHERE id_pagamento = 2;

INSERT INTO HISTORICO (id_investigacao, acao_realizada, usuario_sistema) 
VALUES (1, 'Pagamento ID 2 confirmado manualmente via transacao', 'financeiro_user');

RELEASE SAVEPOINT sp_pagamento;
COMMIT;