--- Consulta 3: Investigações Ativas com Suspeitos Confirmados
--- Objetivo: Lista as investigações que estão ativas e possuem pelo menos uma pessoa registrada com o papel de 'Suspeito'.
SELECT 
    i.id_investigacao,
    i.titulo AS investigacao,
    i.status,
    c.nome AS cliente
FROM INVESTIGACAO i
INNER JOIN CLIENTE c ON i.id_cliente = c.id_cliente
WHERE EXISTS (
    SELECT 1 
    FROM ENVOLVIMENTO e 
    WHERE e.id_investigacao = i.id_investigacao 
      AND e.papel = 'SUSPEITO'
);