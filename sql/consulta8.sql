--- Consulta 8: Auditoria de Ações no Sistema
--- Objetivo: Conta o número de ações registradas no histórico, agrupadas por usuário do sistema e por investigação, indicando a data da última ação.
SELECT 
    h.usuario_sistema,
    i.titulo AS investigacao,
    COUNT(h.id_historico) AS total_acoes,
    MAX(h.data_hora) AS ultima_acao
FROM HISTORICO h
INNER JOIN INVESTIGACAO i ON h.id_investigacao = i.id_investigacao
GROUP BY h.usuario_sistema, i.titulo
ORDER BY h.usuario_sistema ASC, total_acoes DESC;
