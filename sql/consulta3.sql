--- Consulta 3: Investigações Ativas com Suspeitos Confirmados
--- Objetivo: Lista as investigações ativas (status ABERTA ou EM_ANDAMENTO) que possuem pelo menos uma pessoa registrada com o papel de 'SUSPEITO' (subconsulta correlacionada com EXISTS).
SELECT 
    i.id_investigacao,
    i.titulo AS investigacao,
    i.status,
    c.nome AS cliente
FROM INVESTIGACAO i
INNER JOIN CLIENTE c ON i.id_cliente = c.id_cliente
WHERE i.status IN ('ABERTA', 'EM_ANDAMENTO')
  AND EXISTS (
    SELECT 1 
    FROM ENVOLVIMENTO e 
    WHERE e.id_investigacao = i.id_investigacao 
      AND e.papel = 'SUSPEITO'
);
