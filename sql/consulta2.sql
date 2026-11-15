--- Consulta 2: Detetives com Carga de Liderança Acima da Média
--- Objetivo: Identifica os detetives responsáveis cujo número de investigações lideradas é igual ou superior à média de investigações por detetive responsável na agência (subconsulta escalar).
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
