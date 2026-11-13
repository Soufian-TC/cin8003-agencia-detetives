--- Consulta 6: Análise de Tempo de Duração das Missões
--- Objetivo: Para cada investigação que já possui evidências coletadas (subconsulta com IN), calcula a quantidade de missões e a duração (em dias) da missão mais curta, da mais longa e a duração média das missões finalizadas.
--- Observação: missões ainda sem data_fim (NULL) são contadas em total_missoes, mas ignoradas no cálculo das durações.
SELECT 
    i.titulo AS investigacao,
    COUNT(m.id_missao) AS total_missoes,
    COUNT(m.data_fim) AS missoes_finalizadas,
    MIN(JULIANDAY(m.data_fim) - JULIANDAY(m.data_inicio)) AS menor_duracao_dias,
    MAX(JULIANDAY(m.data_fim) - JULIANDAY(m.data_inicio)) AS maior_duracao_dias,
    ROUND(AVG(JULIANDAY(m.data_fim) - JULIANDAY(m.data_inicio)), 2) AS duracao_media_dias
FROM INVESTIGACAO i
INNER JOIN MISSAO m ON i.id_investigacao = m.id_investigacao
WHERE i.id_investigacao IN (
    SELECT e.id_investigacao 
    FROM EVIDENCIA e
)
GROUP BY i.id_investigacao, i.titulo
ORDER BY duracao_media_dias DESC;
