# 01. Levantamento e Análise de Requisitos

## 1. Descrição do Domínio
O projeto consiste no desenvolvimento de um banco de dados para gerenciar de forma centralizada e segura todas as operações de uma agência de detetives privados. O sistema é responsável por registrar o ciclo de vida completo de uma investigação (da abertura ao encerramento), controlando clientes, contratos, pagamentos, detetives, especialidades, missões, depoimentos, pessoas envolvidas, evidências, locais de atuação, relatórios técnicos, equipamentos utilizados e histórico de auditoria.

## 2. Stakeholders e Suas Responsabilidades
| Stakeholder | Responsabilidade Principal |
| :--- | :--- |
| **Cliente** | Solicita investigações, fornece informações iniciais, assina contratos e efetua pagamentos. |
| **Detetive** | Executa missões em campo, realiza entrevistas, coleta evidências e redige relatórios parciais. |
| **Detetive Responsável** | Coordena a equipe investigativa, aloca missões e supervisiona a elaboração dos relatórios. |
| **Gestor da Agência** | Administra a alocação global de recursos, equipamentos e desempenho operacional. |
| **Responsável Financeiro** | Emite contratos, controla parcelas, verifica recebimentos e confirma quitações financeiras. |
| **Administrador do Sistema** | Gerencia perfis de usuários, permissões de acesso (confidencialidade) e auditoria de histórico. |

## 3. Necessidades por Stakeholder
* **Cliente:** Acompanhar o status da investigação, consultar o contrato e visualizar relatórios finais autorizados.
* **Detetive:** Consultar missões atribuídas, registrar dados de depoimentos, vincular evidências e solicitar equipamentos.
* **Detetive Responsável:** Atribuir detetives aos casos, consolidar evidências e aprovar relatórios parciais/finais.
* **Gestor da Agência:** Monitorar indicadores operacionais (tempo médio de caso, taxa de resolução, disponibilidade de equipamentos).
* **Responsável Financeiro:** Validar se os valores de contrato cobrem custos e registrar pagamentos efetuados.
* **Administrador do Sistema:** Manter o controle estrito de confidencialidade (RB34/RB35) e rastrear alterações de dados via histórico.

## 4. Informações que Precisam ser Mantidas (Categorias de Informação)
* **Dados de Identificação de Clientes e Pessoas:** Nome, CPF/CNPJ, contatos, características físicas e papéis na investigação.
* **Dados Operacionais de Investigação:** Título, status, nível de confidencialidade, datas de abertura e término.
* **Dados de Equipe e Atribuições:** Detetives, suas especialidades e histórico de participação por caso.
* **Dados de Atividades de Campo:** Missões, entrevistas, transcrições e locais associados.
* **Dados de Provas e Evidências:** Tipo de prova, origem, data de coleta, coletor e vínculos com suspeitos/locais.
* **Dados Administrativos e Financeiros:** Contratos, valores contratados, parcelas de pagamento e seus status.
* **Dados de Recursos Materiais:** Cadastro de equipamentos, estado de conservação e períodos de alocação.
* **Dados de Auditoria:** Registros imutáveis de ações realizadas pelos usuários no sistema.

## 5. Regras de Negócio Selecionadas (RB01 - RB36)
* **RB01:** Um cliente pode solicitar uma ou várias investigações.
* **RB02:** Cada investigação deve estar associada a um único cliente.
* **RB03:** Cada investigação possui um identificador único, título, descrição, data de abertura e status.
* **RB04:** Uma investigação pode assumir os status `ABERTA`, `EM_ANDAMENTO`, `SUSPENSA`, `ENCERRADA` ou `CANCELADA`.
* **RB05:** Uma investigação deve possuir pelo menos um detetive atribuído antes de entrar em andamento.
* **RB06:** Uma investigação deve possuir um detetive responsável principal.
* **RB07:** Um detetive pode participar de várias investigações e uma investigação pode contar com vários detetives.
* **RB08:** Uma investigação pode ser dividida em várias missões.
* **RB09:** Cada missão pertence a uma única investigação.
* **RB10:** Uma missão possui status e deve registrar suas datas quando aplicável.
* **RB11:** Uma missão pode ser realizada por um ou mais detetives.
* **RB12:** Uma pessoa pode estar relacionada a várias investigações, e uma investigação pode envolver várias pessoas.
* **RB13:** O papel de uma pessoa deve ser registrado no contexto da investigação (`SUSPEITO`, `VITIMA`, `TESTEMUNHA`, `PESSOA_PROCURADA` ou `PESSOA_DE_INTERESSE`).
* **RB14:** Um detetive pode realizar várias entrevistas e uma pessoa pode participar de várias entrevistas.
* **RB15:** Cada entrevista deve estar associada a uma investigação, a uma data e a pelo menos um detetive.
* **RB16:** Uma investigação pode gerar várias evidências.
* **RB17:** Cada evidência deve registrar seu tipo, data de coleta, origem e detetive responsável pela coleta.
* **RB18:** Uma evidência pode estar relacionada a uma ou várias pessoas e a um ou vários locais.
* **RB19:** Uma investigação pode possuir vários relatórios.
* **RB20:** Uma investigação pode possuir no máximo um relatório final.
* **RB21:** Um relatório deve registrar a investigação, o detetive autor, a data e o tipo do relatório (`INTERMEDIARIO` ou `FINAL`).
* **RB22:** Uma investigação deve possuir um contrato antes do início das atividades faturáveis.
* **RB23:** Um contrato pertence a um único cliente e está associado a uma única investigação; uma investigação possui no máximo um contrato.
* **RB24:** Um contrato deve possuir um valor total superior a zero.
* **RB25:** Um contrato pode gerar vários pagamentos.
* **RB26:** Cada pagamento pertence a um único contrato e possui data, valor e status.
* **RB27:** A soma dos pagamentos confirmados não pode ultrapassar o valor contratado.
* **RB28:** Um equipamento pode ser utilizado por vários detetives ao longo do tempo, mas não pode ser atribuído simultaneamente a dois detetives no mesmo período.
* **RB29:** Um equipamento em estado defeituoso não pode ser atribuído a uma missão.
* **RB30:** Uma missão não pode ser criada para uma investigação encerrada ou cancelada.
* **RB31:** A data de uma missão não pode ser anterior à abertura da investigação.
* **RB32:** A data de coleta de uma evidência não pode ser anterior à abertura da investigação.
* **RB33:** A data de encerramento da investigação não pode ser anterior à sua data de abertura.
* **RB34:** As informações de uma investigação são confidenciais e devem possuir um nível de acesso adequado.
* **RB35:** Um detetive só pode acessar normalmente as investigações às quais está atribuído, salvo autorização específica.
* **RB36:** As principais ações realizadas sobre uma investigação devem poder ser registradas no histórico do sistema.

## 6. Estimativas de Volume e Frequência
* **Investigações ativas:** Aproximadamente 50 a 100 investigações por ano.
* **Missões de campo:** Cerca de 3 a 10 missões por investigação (volume médio de 500 missões/ano).
* **Evidências registradas:** Média de 10 a 30 evidências por caso (frequência diária de inserção).
* **Consultas ao sistema:** Acessos diários simultâneos por cerca de 15 detetives e gestores.

## 7. Casos de Uso Críticos
1. **Abertura, Contratação e Atribuição Inicial:** Registro do cliente, emissão do contrato financeiro (> R$ 0,00) e atribuição obrigatória do detetive responsável antes de alterar o status da investigação para `EM_ANDAMENTO`.
2. **Coleta de Evidência com Restrição de Equipamento:** Alocação de equipamento em missão (verificando estado não defeituoso) e posterior registro da evidência associando-a ao detetive coletor, local e pessoas envolvidas.

## 8. Restrições Legais, Privacidade e Segurança
* **Conformidade com a LGPD (Lei nº 13.709/2018):** Dados de suspeitos e vítimas possuem tratamento restrito e finalidade específica de investigação.
* **Regulamentação Profissional (Lei nº 13.432/2017):** Garantia do dever de sigilo profissional do detetive privado.
* **Controle de Acesso Funcional (RB34/RB35):** Restrição estrita de visualização de casos apenas a detetives explicitamente atribuídos à investigação.

## 9. Dúvidas para o Cliente Esclarecer
1. Qual é o procedimento adotado caso um cliente cancele o contrato antes do encerramento da investigação?
2. Existe um limite máximo de detetives atribuídos simultaneamente a uma única missão?
3. Como deve ser tratada a transferência de responsabilidade de uma evidência caso o detetive coletor seja desligado da agência?
4. Os relatórios intermediários precisam de aprovação formal do cliente antes de serem arquivados?
5. Qual o tempo de retenção obrigatório dos registros de histórico após o encerramento da investigação?

## 10. Referências das Fontes Utilizadas
* BRASIL. **Lei nº 13.432, de 11 de abril de 2017**. Dispõe sobre o exercício da profissão de detetive particular.
* BRASIL. **Lei nº 13.709, de 14 de agosto de 2018**. Lei Geral de Proteção de Dados Pessoais (LGPD).
* Material didático da disciplina CIN 8003 (Bancos de Dados e Aplicações - UFSC, Prof. Moisés Lima Dutra).

