--- Consulta 7: Taxa de Recebimento Financeiro por Contrato
--- Objetivo: Calcula a porcentagem do valor já pago em relação ao valor total acordado para cada contrato.
WITH ResumoFinanceiro AS (
    SELECT 
        ct.id_contrato,
        ct.numero_contrato,
        ct.valor_total,
        COALESCE(SUM(CASE WHEN p.status = 'CONFIRMADO' THEN p.valor ELSE 0 END), 0) AS valor_pago
    FROM CONTRATO ct
    LEFT JOIN PAGAMENTO p ON ct.id_contrato = p.id_contrato
    GROUP BY ct.id_contrato, ct.numero_contrato, ct.valor_total
)
SELECT 
    numero_contrato,
    valor_total,
    valor_pago,
    ROUND((valor_pago / valor_total) * 100, 2) AS percentual_quitado
FROM ResumoFinanceiro
ORDER BY percentual_quitado ASC;