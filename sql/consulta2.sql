--- Consulta 2: Avaliação de Detetives por Valor de Contrato
--- Objetivo: Identifica os detetives cujo valor médio dos contratos em que estão envolvidos é superior à média geral da agência.
SELECT 
    d.nome AS detetive,
    COUNT(i.id_investigacao) AS investigacoes_lideradas
FROM DETETIVE d
INNER JOIN INVESTIGACAO i ON d.id_detetive = i.id_detetive_responsavel
GROUP BY d.id_detetive, d.nome
HAVING COUNT(i.id_investigacao) >= (
    SELECT AVG(qtd) 
    FROM (
        SELECT COUNT(id_investigacao) AS qtd 
        FROM INVESTIGACAO 
        GROUP BY id_detetive_responsavel
    )
);