# Sistema de Gestão de uma Agência de Detetives Privados

**Disciplina:** CIN 8003 – Bancos de Dados e Aplicações  
**Instituição:** Universidade Federal de Santa Catarina (UFSC)  
**Professor:** Prof. Moisés Lima Dutra  
**Estudante:** Soufian Lebbat  
**Sistema Gerenciador de Banco de Dados:** SQLite 3  

---

## 1. Apresentação do Projeto

Este projeto consiste no desenvolvimento de um sistema de banco de dados para o gerenciamento das atividades operacionais e administrativas de uma agência de detetives privados.

A solução foi desenvolvida no âmbito da disciplina **CIN 8003 – Bancos de Dados e Aplicações**, da Universidade Federal de Santa Catarina (UFSC).

O sistema foi concebido para centralizar e organizar as informações relacionadas ao funcionamento da agência, contemplando as diferentes etapas do processo investigativo, desde o primeiro contato com o cliente até a conclusão da investigação.

Entre as principais funcionalidades e áreas contempladas pelo banco de dados, destacam-se:

- Cadastro e gerenciamento de clientes;
- Registro e acompanhamento de contratos;
- Gerenciamento de detetives e equipes de investigação;
- Planejamento e execução de missões;
- Controle de equipamentos utilizados nas operações;
- Registro de suspeitos, depoimentos e evidências;
- Elaboração e armazenamento de relatórios investigativos;
- Gerenciamento de pagamentos e controle financeiro;
- Registro de atividades e auditoria de acessos.

O objetivo principal é aplicar os conceitos de modelagem, normalização, implementação e manipulação de bancos de dados relacionais em um cenário prático e coerente.

## 2. Tecnologias e Ferramentas Utilizadas

As seguintes tecnologias e ferramentas foram utilizadas durante o desenvolvimento do projeto:

| Tecnologia | Utilização |
|---|---|
| SQLite 3 | Sistema gerenciador de banco de dados |
| SQL | Criação, manipulação e consulta dos dados |
| Python 3 | Automação da execução dos scripts |
| Jupyter Notebook | Ambiente interativo de desenvolvimento e demonstração |
| Markdown | Documentação técnica do projeto |

O SQLite foi escolhido por sua simplicidade, portabilidade e capacidade de implementar os principais recursos de um banco de dados relacional.

## 3. Estrutura do Repositório

A organização do projeto segue uma estrutura modular, separando a documentação, os scripts SQL, a base de dados e os arquivos de execução.

```text
.
├── README.md
├── links.txt
├── executar_projeto.py
├── notebook_projeto.ipynb
│
├── apresentacao/
│   └── slides_apresentacao.pdf
│
├── database/
│   └── agencia_detetives.db
│
├── docs/
│   ├── 01_requisitos.md
│   ├── 02_modelo_conceitual.md
│   └── 03_esquema_relacional.md
│
└── sql/
    ├── script_ddl.sql
    ├── script_dml.sql
    ├── consulta1.sql
    ├── consulta2.sql
    ├── consulta3.sql
    ├── consulta4.sql
    ├── consulta5.sql
    ├── consulta6.sql
    ├── consulta7.sql
    ├── consulta8.sql
    ├── consulta9.sql
    └── consulta10.sql
```

### Descrição dos diretórios e arquivos

- **`docs/`**: contém a documentação das etapas de análise e modelagem do banco de dados.
- **`sql/`**: reúne os scripts de criação, inserção de dados e consultas SQL.
- **`database/`**: armazena o banco de dados SQLite.
- **`apresentacao/`**: contém os materiais utilizados na apresentação final.
- **`executar_projeto.py`**: automatiza a criação, alimentação e execução das consultas no banco de dados.
- **`notebook_projeto.ipynb`**: disponibiliza uma alternativa interativa para explorar e executar o projeto.
- **`links.txt`**: reúne referências e recursos externos utilizados durante o desenvolvimento.

## 4. Documentação e Etapas do Projeto

A documentação foi dividida em três arquivos principais, correspondentes às etapas fundamentais da construção de um banco de dados relacional.

| Arquivo | Conteúdo |
|---|---|
| `01_requisitos.md` | Levantamento e análise dos requisitos do sistema |
| `02_modelo_conceitual.md` | Modelo Entidade-Relacionamento (MER), utilizando a notação de Chen |
| `03_esquema_relacional.md` | Esquema relacional, normalização e dicionário de dados |

Essa divisão permite acompanhar a evolução do projeto, desde a identificação das necessidades do sistema até a definição de sua estrutura relacional.

## 5. Implementação SQL

A implementação do banco de dados está organizada em scripts SQL independentes.

### 5.1. Criação da estrutura – DDL

O arquivo `sql/script_ddl.sql` contém os comandos responsáveis pela criação das tabelas e pela definição das restrições de integridade do banco de dados.

São utilizados recursos como:

- `CREATE TABLE`: criação das tabelas;
- `PRIMARY KEY`: definição das chaves primárias;
- `FOREIGN KEY`: estabelecimento dos relacionamentos;
- `UNIQUE`: garantia de unicidade;
- `CHECK`: validação de valores e regras de domínio;
- `DEFAULT`: definição de valores padrão;
- `ON DELETE` e `ON UPDATE`: controle do comportamento das chaves estrangeiras.

### 5.2. Inserção de dados – DML

O arquivo `sql/script_dml.sql` realiza a inserção dos dados utilizados para testar e demonstrar o funcionamento do sistema.

Os registros permitem representar diferentes situações operacionais e financeiras da agência.

### 5.3. Consultas SQL

O projeto contém dez consultas destinadas à exploração e à validação das funcionalidades do banco de dados.

| Arquivo | Objetivo |
|---|---|
| `consulta1.sql` | Análise do faturamento por cliente e situação dos pagamentos |
| `consulta2.sql` | Identificação de detetives com média superior à média geral |
| `consulta3.sql` | Consulta de investigações com suspeitos registrados |
| `consulta4.sql` | Identificação de clientes com pagamentos pendentes |
| `consulta5.sql` | Análise da alocação de equipamentos, incluindo valores nulos |
| `consulta6.sql` | Análise dos valores mínimos e máximos relacionados às missões |
| `consulta7.sql` | Utilização de CTE para calcular o percentual de quitação financeira |
| `consulta8.sql` | Consulta do histórico de atividades por usuário |
| `consulta9.sql` | Demonstração de transação com utilização de SAVEPOINT |
| `consulta10.sql` | Demonstração de transação com tratamento de erros e ROLLBACK |

As consultas exploram diferentes recursos da linguagem SQL, incluindo agregações, subconsultas, junções, expressões condicionais, CTEs e controle transacional.

## 6. Como Executar o Projeto

### 6.1. Pré-requisitos

Antes de executar o projeto, é necessário possuir:

- Python 3.x instalado;
- SQLite 3.x;
- Um terminal ou ambiente de desenvolvimento compatível.

Não é necessário instalar uma biblioteca externa para utilizar SQLite com Python, pois o módulo `sqlite3` já faz parte da biblioteca padrão da linguagem.

### 6.2. Execução automatizada com Python

A maneira recomendada de executar o projeto é utilizando o script de automação localizado na raiz do repositório.

No terminal, execute:

```bash
python executar_projeto.py
```

O script é responsável por automatizar as etapas de execução do projeto, incluindo:

1. Inicialização e preparação do banco de dados;
2. Execução dos comandos DDL;
3. Inserção dos dados por meio dos comandos DML;
4. Execução sequencial das dez consultas SQL;
5. Exibição dos resultados no terminal.

**Observação:** a execução automatizada pode recriar o banco de dados. Portanto, eventuais alterações realizadas manualmente na base devem ser preservadas antes de uma nova execução.

### 6.3. Execução manual utilizando SQLite

Também é possível executar os scripts diretamente pelo terminal, utilizando o cliente SQLite.

**Etapa 1 – Abrir o banco de dados**

```bash
sqlite3 database/agencia_detetives.db
```

**Etapa 2 – Ativar as chaves estrangeiras**

```sql
PRAGMA foreign_keys = ON;
```

**Etapa 3 – Criar a estrutura do banco de dados**

```sql
.read sql/script_ddl.sql
```

**Etapa 4 – Inserir os dados**

```sql
.read sql/script_dml.sql
```

**Etapa 5 – Executar uma consulta específica**

Por exemplo:

```sql
.read sql/consulta1.sql
```

Para executar outra consulta, basta substituir o nome do arquivo correspondente.

## 7. Integridade e Regras de Negócio

A estrutura do banco de dados foi projetada para garantir a consistência, a confiabilidade e a integridade das informações armazenadas.

Para isso, são utilizadas diferentes restrições e mecanismos disponibilizados pelo SQLite.

Entre os principais recursos implementados, destacam-se:

- **Integridade de entidade:** identificação única dos registros por meio de chaves primárias;
- **Integridade referencial:** manutenção dos relacionamentos entre tabelas por meio de chaves estrangeiras;
- **Integridade de domínio:** validação de valores utilizando restrições `CHECK`;
- **Unicidade:** prevenção de registros duplicados em campos específicos;
- **Valores padrão:** utilização de `DEFAULT` para inicialização de determinados atributos;
- **Controle transacional:** utilização de `COMMIT`, `ROLLBACK` e `SAVEPOINT` para demonstrar o gerenciamento de transações.

O projeto também contempla a organização dos dados de acordo com os princípios de normalização, buscando reduzir redundâncias e evitar anomalias de inserção, atualização e exclusão.

## 8. Objetivos Acadêmicos

O desenvolvimento deste projeto tem como finalidade consolidar os conhecimentos adquiridos na disciplina CIN 8003, por meio da aplicação prática dos principais conceitos de bancos de dados relacionais.

Os principais objetivos são:

- Realizar o levantamento e a análise de requisitos de um sistema;
- Desenvolver um Modelo Entidade-Relacionamento;
- Transformar o modelo conceitual em um esquema relacional;
- Aplicar técnicas de normalização;
- Implementar estruturas relacionais utilizando SQL;
- Inserir, atualizar e consultar informações;
- Aplicar restrições de integridade;
- Explorar consultas SQL de diferentes níveis de complexidade;
- Demonstrar o controle de transações e a recuperação de erros.

## 9. Considerações Finais

O projeto apresenta uma solução estruturada para o gerenciamento de uma agência de detetives privados, utilizando os conceitos fundamentais de bancos de dados relacionais.

A implementação integra as etapas de análise de requisitos, modelagem conceitual, modelagem relacional, criação da estrutura física, inserção de dados e elaboração de consultas SQL.

Além de atender aos objetivos acadêmicos da disciplina, o projeto demonstra como os conhecimentos de banco de dados podem ser aplicados à resolução de problemas de organização, armazenamento e gerenciamento de informações em um contexto operacional.

---

**Desenvolvido por:** Soufian Lebbat  
**Disciplina:** CIN 8003 – Bancos de Dados e Aplicações  
**Universidade:** Universidade Federal de Santa Catarina (UFSC)  
**Professor:** Prof. Moisés Lima Dutra