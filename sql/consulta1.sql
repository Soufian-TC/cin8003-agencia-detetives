--- Consulta 1: Faturamento por Cliente
--- Objetivo: Retorna o número total de contratos, o faturamento total e o valor médio dos contratos para cada cliente (filtrando faturamento > 4000).
SELECT 
    c.nome AS cliente,
    COUNT(ct.id_contrato) AS total_contratos,
    SUM(ct.valor_total) AS faturamento_total,
    ROUND(AVG(ct.valor_total), 2) AS media_contrato
FROM CLIENTE c
INNER JOIN CONTRATO ct ON c.id_cliente = ct.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING SUM(ct.valor_total) > 4000.00
ORDER BY faturamento_total DESC;