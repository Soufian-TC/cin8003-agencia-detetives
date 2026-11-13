-- CLIENTES
INSERT INTO CLIENTE (nome, tipo_cliente, cpf_cnpj, telefone, email, endereco) VALUES 
('Empresa Alfa Ltda', 'PJ', '12.345.678/0001-99', '4833331111', 'contato@alfa.com', 'Av. Beira Mar, 100'),
('Roberto Santos', 'PF', '123.456.789-00', '48999992222', 'roberto@gmail.com', 'Rua das Palmeiras, 45'),
('TechCorp Brasil', 'PJ', '98.765.432/0001-11', '4832224444', 'admin@techcorp.com', 'Rodovia SC-401, 5000'),
('Luciana Lima', 'PF', '987.654.321-99', '48988887777', 'luciana@hotmail.com', 'Rua Felipe Schmidt, 200');

-- DETETIVES
INSERT INTO DETETIVE (nome, cpf, telefone, email, status_ativo) VALUES
('Carlos Mendes', '111.222.333-44', '48977771111', 'carlos@agencia.com', 1),
('Mariana Rocha', '222.333.444-55', '48977772222', 'mariana@agencia.com', 1),
('Fernando Oliveira', '333.444.555-66', '48977773333', 'fernando@agencia.com', 1),
('Beatriz Costa', '444.555.666-77', '48977774444', 'beatriz@agencia.com', 0);

-- ESPECIALIDADES
INSERT INTO ESPECIALIDADE (nome_especialidade, descricao) VALUES
('Cibersegurança e Fraudes Digitais', 'Investigação de crimes cibernéticos e vazamentos'),
('Vigilância Espionagem Industrial', 'Acompanhamento de alvos e proteção corporativa'),
('Localização de Pessoas', 'Busca de desaparecidos e devedores');

-- DETETIVE_ESPECIALIDADE
INSERT INTO DETETIVE_ESPECIALIDADE (id_detetive, id_especialidade) VALUES
(1, 1), (1, 2), (2, 2), (3, 3);

-- EQUIPAMENTOS
INSERT INTO EQUIPAMENTO (nome, numero_serie, estado_conservacao) VALUES
('Câmera Térmica HD', 'SN-CAM-001', 'OPERACIONAL'),
('Rastreador GPS Magnético', 'SN-GPS-002', 'OPERACIONAL'),
('Escuta Direcional de Longo Alcance', 'SN-ESC-003', 'DEFEITUOSO');

-- INVESTIGAÇÕES
INSERT INTO INVESTIGACAO (id_cliente, id_detetive_responsavel, titulo, descricao, data_abertura, data_encerramento, status, nivel_confidencialidade) VALUES
(1, 1, 'Vazamento de Segredo Industrial', 'Suspeita de espionagem de concorrente', '2026-01-10', NULL, 'EM_ANDAMENTO', 'CONFIDENCIAL'),
(2, 2, 'Investigação Conjugal', 'Verificação de conduta e rotina', '2026-01-15', NULL, 'EM_ANDAMENTO', 'RESTRITO'),
(3, 1, 'Auditoria Interna Antifraude', 'Verificação de desvios em contas', '2026-02-01', NULL, 'ABERTA', 'SECRETO'),
(4, 3, 'Localização de Devedor', 'Busca por bens e paradeiro', '2026-02-05', '2026-02-10', 'ENCERRADA', 'PUBLICO');

-- ATRIBUIÇÃO
INSERT INTO ATRIBUICAO (id_investigacao, id_detetive, data_inicio, eh_responsavel_principal) VALUES
(1, 1, '2026-01-10', 1),
(1, 2, '2026-01-12', 0),
(2, 2, '2026-01-15', 1),
(3, 1, '2026-02-01', 1),
(4, 3, '2026-02-05', 1);

-- MISSÃO
INSERT INTO MISSAO (id_investigacao, titulo, descricao, data_inicio, data_fim, status) VALUES
(1, 'Campana Sede Concorrente', 'Monitorar entrada e saída de executivos', '2026-01-11', '2026-01-14', 'CONCLUIDA'),
(1, 'Varredura Eletrônica', 'Análise de redes e dispositivos da sala da diretoria', '2026-01-15', NULL, 'EM_ANDAMENTO'),
(2, 'Vigilância Noturna', 'Seguir veículo do alvo', '2026-01-16', '2026-01-17', 'CONCLUIDA'),
(3, 'Levantamento de Extratos Bancários', 'Coleta e conferência dos extratos das contas auditadas', '2026-02-10', NULL, 'PLANEJADA');

-- MISSAO_DETETIVE
INSERT INTO MISSAO_DETETIVE (id_missao, id_detetive) VALUES
(1, 1), (1, 2), (2, 1), (3, 2), (4, 1);

-- UTILIZACAO_EQUIPAMENTO
INSERT INTO UTILIZACAO_EQUIPAMENTO (id_equipamento, id_missao, id_detetive, data_inicio, data_fim) VALUES
(1, 1, 1, '2026-01-11', '2026-01-14'),
(2, 3, 2, '2026-01-16', '2026-01-17'),
(1, 2, 1, '2026-01-15', NULL);

-- PESSOA
INSERT INTO PESSOA (nome, cpf, descricao_fisica, observacoes) VALUES
('Marcos Souza', '555.666.777-88', 'Homem, 1.80m, cabelos escuros', 'Ex-funcionário da Alfa Ltda'),
('Juliana Paes', '666.777.888-99', 'Mulher, 1.65m, loira', 'Frequentadora habitual do local X'),
('Pedro Mendes', NULL, 'Homem, 1.75m, barba rala', 'Suspeito de intermediar pagamentos');

-- ENVOLVIMENTO
INSERT INTO ENVOLVIMENTO (id_investigacao, id_pessoa, papel, data_registro) VALUES
(1, 1, 'SUSPEITO', '2026-01-11'),
(1, 3, 'PESSOA_DE_INTERESSE', '2026-01-12'),
(2, 2, 'PESSOA_DE_INTERESSE', '2026-01-16');

-- ENTREVISTA
INSERT INTO ENTREVISTA (id_investigacao, id_pessoa, data_hora, transcricao_resumo) VALUES
(1, 1, '2026-01-13 14:00', 'Interrogado declarou não possuir acesso aos servidores centrais.'),
(2, 2, '2026-01-17 10:30', 'Depoimento informal sobre contatos do alvo.');

-- ENTREVISTA_DETETIVE
INSERT INTO ENTREVISTA_DETETIVE (id_entrevista, id_detetive) VALUES
(1, 1), (2, 2);

-- EVIDENCIA
INSERT INTO EVIDENCIA (id_investigacao, id_detetive_coletor, tipo, descricao, data_coleta, origem) VALUES
(1, 1, 'REGISTRO_DIGITAL', 'Log de acesso do servidor com IP externo', '2026-01-12', 'Servidor Central'),
(1, 2, 'FOTOGRAFIA', 'Foto de reunião entre suspeito e concorrente', '2026-01-13', 'Campana Restaurante'),
(2, 2, 'FOTOGRAFIA', 'Registro de presença em local privado', '2026-01-16', 'Campana Externa');

-- EVIDENCIA_PESSOA
INSERT INTO EVIDENCIA_PESSOA (id_evidencia, id_pessoa) VALUES
(1, 1), (2, 1), (2, 3);

-- LOCAL
INSERT INTO LOCAL (id_missao, id_entrevista, endereco_completo, cidade, estado, coordenadas_gps) VALUES
(1, NULL, 'Av. Paulista, 1000 - Bela Vista', 'São Paulo', 'SP', '-23.561,-46.655'),
(NULL, 1, 'Rua Bocaiúva, 212 - Centro', 'Florianópolis', 'SC', '-27.585,-48.552'),
(3, NULL, 'Rua Lauro Linhares, 589 - Trindade', 'Florianópolis', 'SC', NULL);

-- EVIDENCIA_LOCAL
INSERT INTO EVIDENCIA_LOCAL (id_evidencia, id_local) VALUES
(2, 1), (3, 3);

-- RELATORIO
INSERT INTO RELATORIO (id_investigacao, id_autor, titulo, conteudo, data_emissao, tipo_relatorio) VALUES
(1, 1, 'Relatório Parcial de Campana', 'Resumo das observações dos dias 11 a 14 de janeiro.', '2026-01-15', 'INTERMEDIARIO'),
(4, 3, 'Relatório Final de Encerramento', 'Localização do devedor confirmada no endereço Y.', '2026-02-10', 'FINAL');

-- CONTRATO
INSERT INTO CONTRATO (id_cliente, id_investigacao, numero_contrato, data_assinatura, valor_total, termos) VALUES
(1, 1, 'CT-2026-001', '2026-01-10', 15000.00, 'Pagamento 50% ato, 50% na entrega do relatório final.'),
(2, 2, 'CT-2026-002', '2026-01-15', 5000.00, 'Pagamento integral em duas parcelas.'),
(3, 3, 'CT-2026-003', '2026-02-01', 25000.00, 'Contrato de auditoria especial.'),
(4, 4, 'CT-2026-004', '2026-02-05', 3500.00, 'Pagamento único na entrega do relatório final.');

-- PAGAMENTO
INSERT INTO PAGAMENTO (id_contrato, data_pagamento, valor, status) VALUES
(1, '2026-01-10', 7500.00, 'CONFIRMADO'),
(1, '2026-02-01', 7500.00, 'PENDENTE'),
(2, '2026-01-15', 2500.00, 'CONFIRMADO'),
(2, '2026-02-15', 2500.00, 'PENDENTE'),
(3, '2026-02-01', 10000.00, 'CONFIRMADO'),
(4, '2026-02-10', 3500.00, 'CONFIRMADO');

-- HISTORICO
INSERT INTO HISTORICO (id_investigacao, data_hora, acao_realizada, usuario_sistema) VALUES
(1, '2026-01-10 09:00:00', 'Abertura de Investigação e emissão de contrato CT-2026-001', 'admin_sys'),
(1, '2026-01-12 11:30:00', 'Inclusão de Evidência Digital ID 1', 'detetive_carlos'),
(2, '2026-01-15 14:20:00', 'Abertura de caso e alocação da detetive Mariana', 'admin_sys'),
(4, '2026-02-10 17:00:00', 'Encerramento da investigação e emissão do relatório final', 'detetive_fernando');
