--- Consulta 6: Análise de Tempo de Duração das Missões
--- Objetivo: Calcula a duração (em dias) da missão mais curta, da mais longa e a duração média das missões, agrupadas por investigação.
SELECT 
    i.status,
    COUNT(DISTINCT i.id_investigacao) AS total_investigacoes,
    MIN(qtd_missoes) AS min_missoes,
    MAX(qtd_missoes) AS max_missoes,
    ROUND(AVG(qtd_missoes), 2) AS media_missoes
FROM INVESTIGACAO i
LEFT JOIN (
    SELECT id_investigacao, COUNT(id_missao) AS qtd_missoes 
    FROM MISSAO 
    GROUP BY id_investigacao
) m_sub ON i.id_investigacao = m_sub.id_investigacao
GROUP BY i.status;