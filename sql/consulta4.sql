--- Consulta 4: Clientes com Pagamentos Pendentes
--- Objetivo: Retorna a lista de clientes que possuem contratos assinados, mas cujos pagamentos ainda constam como 'PENDENTE'.
SELECT 
    c.nome AS cliente,
    ct.numero_contrato,
    COALESCE(SUM(p.valor), 0.00) AS total_pendente
FROM CLIENTE c
INNER JOIN CONTRATO ct ON c.id_cliente = ct.id_cliente
LEFT JOIN PAGAMENTO p ON ct.id_contrato = p.id_contrato AND p.status = 'PENDENTE'
GROUP BY c.id_cliente, c.nome, ct.numero_contrato
HAVING total_pendente > 0;