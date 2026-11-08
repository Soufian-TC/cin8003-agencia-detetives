# 02. Modelo Conceitual (MER / DER)

## 1. Descrição do Modelo
O Modelo Entidade-Relacionamento (MER) abaixo representa a estrutura abstrata do domínio da Agência de Detetives Privados, identificando as entidades, seus atributos principais, identifiadores e as cardinalidades mínimas e máximas de cada relacionamento.

## 2. Entidades, Atributos e Identificadores (PK Conceptuais)

* **`CLIENTE`**
  * **Identificador:** `id_cliente`
  * **Atributos:** `nome`, `tipo_cliente` (`PF`/`PJ`), `cpf_cnpj`, `telefone`, `email`, `endereco`
* **`DETETIVE`**
  * **Identificador:** `id_detetive`
  * **Atributos:** `nome`, `cpf`, `telefone`, `email`, `status_ativo`
* **`ESPECIALIDADE`**
  * **Identificador:** `id_especialidade`
  * **Atributos:** `nome_especialidade`, `descricao`
* **`INVESTIGACAO`**
  * **Identificador:** `id_investigacao`
  * **Atributos:** `titulo`, `descricao`, `data_abertura`, `data_encerramento`, `status`, `nivel_confidencialidade`
* **`MISSAO`**
  * **Identificador:** `id_missao`
  * **Atributos:** `titulo`, `descricao`, `data_inicio`, `data_fim`, `status`
* **`PESSOA`**
  * **Identificador:** `id_pessoa`
  * **Atributos:** `nome`, `cpf`, `descricao_fisica`, `observacoes`
* **`ENTREVISTA`**
  * **Identificador:** `id_entrevista`
  * **Atributos:** `data_hora`, `transcricao_resumo`
* **`EVIDENCIA`**
  * **Identificador:** `id_evidencia`
  * **Atributos:** `tipo`, `descricao`, `data_coleta`, `origem`
* **`LOCAL`**
  * **Identificador:** `id_local`
  * **Atributos:** `endereco_completo`, `cidade`, `estado`, `coordenadas_gps`
* **`RELATORIO`**
  * **Identificador:** `id_relatorio`
  * **Atributos:** `titulo`, `conteudo`, `data_emissao`, `tipo_relatorio`
* **`CONTRATO`**
  * **Identificador:** `id_contrato`
  * **Atributos:** `numero_contrato`, `data_assinatura`, `valor_total`, `termos`
* **`PAGAMENTO`**
  * **Identificador:** `id_pagamento`
  * **Atributos:** `data_pagamento`, `valor`, `status`
* **`EQUIPAMENTO`**
  * **Identificador:** `id_equipamento`
  * **Atributos:** `nome`, `numero_serie`, `estado_conservacao`
* **`HISTORICO`**
  * **Identificador:** `id_historico`
  * **Atributos:** `data_hora`, `acao_realizada`, `usuario_sistema`

---

## 3. Mapeamento de Relacionamentos e Cardinalidades (Min, Max)

* **CLIENTE (1,1) <--- SOLICITA ---> (1,N) INVESTIGACAO**
* **CLIENTE (1,1) <--- CELEBRA ---> (0,N) CONTRATO**
* **CONTRATO (1,1) <--- VINCULA ---> (0,1) INVESTIGACAO**
* **CONTRATO (1,1) <--- GERA ---> (0,N) PAGAMENTO**
* **INVESTIGACAO (1,N) <--- ATRIBUI ---> (0,N) DETETIVE**
  * *Atributos da Relação:* `eh_responsavel_principal`, `data_inicio`, `data_fim`
* **DETETIVE (1,N) <--- POSSUI ---> (0,N) ESPECIALIDADE**
* **INVESTIGACAO (1,1) <--- DIVIDIDA ---> (0,N) MISSAO**
* **MISSAO (1,N) <--- EXECUTA ---> (0,N) DETETIVE**
* **MISSAO (0,N) <--- ALOCA ---> (0,N) EQUIPAMENTO**
  * *Atributos da Relação:* `data_inicio`, `data_fim`
* **INVESTIGACAO (0,N) <--- ENVOLVE ---> (1,N) PESSOA**
  * *Atributos da Relação:* `papel`
* **INVESTIGACAO (1,1) <--- REGISTRA ---> (0,N) ENTREVISTA**
* **ENTREVISTA (1,N) <--- CONDUZ ---> (0,N) DETETIVE**
* **ENTREVISTA (1,1) <--- OUVE ---> (1,N) PESSOA**
* **INVESTIGACAO (1,1) <--- GERA ---> (0,N) EVIDENCIA**
* **EVIDENCIA (1,1) <--- COLETA ---> (0,N) DETETIVE**
* **EVIDENCIA (0,N) <--- RELACIONA ---> (0,N) PESSOA**
* **EVIDENCIA (0,N) <--- OCORRE ---> (0,N) LOCAL**
* **INVESTIGACAO (1,1) <--- EMITE ---> (0,N) RELATORIO**
* **INVESTIGACAO (1,1) <--- REGISTRA ---> (0,N) HISTORICO**