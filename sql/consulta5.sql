--- Consulta 5: Disponibilidade e Alocação de Equipamentos
--- Objetivo: Apresenta o inventário de equipamentos, indicando se estão atualmente alocados em alguma missão ou disponíveis no estoque.
SELECT 
    eq.nome AS equipamento,
    eq.numero_serie,
    eq.estado_conservacao,
    COALESCE(m.titulo, 'SEM MISSAO ATIVA') AS missao_atual,
    COALESCE(d.nome, 'DISPONIVEL EM ESTOQUE') AS detetive_responsavel
FROM EQUIPAMENTO eq
LEFT JOIN UTILIZACAO_EQUIPAMENTO ue ON eq.id_equipamento = ue.id_equipamento AND ue.data_fim IS NULL
LEFT JOIN MISSAO m ON ue.id_missao = m.id_missao
LEFT JOIN DETETIVE d ON ue.id_detetive = d.id_detetive;