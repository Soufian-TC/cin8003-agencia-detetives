import os
import sqlite3

import pandas as pd

# 1. Definição dos caminhos relativos à raiz do repositório
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_DIR = os.path.join(BASE_DIR, "database")
DB_PATH = os.path.join(DB_DIR, "agencia_detetives.db")
SQL_DIR = os.path.join(BASE_DIR, "sql")

DDL_PATH = os.path.join(SQL_DIR, "script_ddl.sql")
DML_PATH = os.path.join(SQL_DIR, "script_dml.sql")

TOTAL_CONSULTAS = 10


def executar_projeto():
    """Recria o banco de dados: executa o DDL e, em seguida, o DML."""
    # Garante que a pasta database/ existe
    os.makedirs(DB_DIR, exist_ok=True)

    # Remove o banco anterior, se existir (o DDL também faz DROP TABLE IF EXISTS,
    # portanto o script funciona mesmo se o arquivo estiver bloqueado no Windows)
    if os.path.exists(DB_PATH):
        try:
            os.remove(DB_PATH)
            print(f"[INFO] Banco de dados anterior removido: {DB_PATH}")
        except PermissionError:
            print(f"[AVISO] Não foi possível remover {DB_PATH} (arquivo em uso). O banco existente será reutilizado.")

    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    # No SQLite, a verificação de chaves estrangeiras precisa ser ativada a cada conexão
    cursor.execute("PRAGMA foreign_keys = ON;")

    print("\n" + "=" * 60)
    print(" 1. CRIAÇÃO E POVOAMENTO DO BANCO DE DADOS ")
    print("=" * 60)

    # 2. Execução do DDL (criação das tabelas)
    if os.path.exists(DDL_PATH):
        print(f"[DDL] Executando {os.path.basename(DDL_PATH)}...")
        with open(DDL_PATH, "r", encoding="utf-8") as f:
            cursor.executescript(f.read())
        print(" -> Tabelas criadas com sucesso.")
    else:
        print(f"[ERRO] Arquivo não encontrado: {DDL_PATH}")
        conn.close()
        return

    # 3. Execução do DML (inserção dos dados)
    if os.path.exists(DML_PATH):
        print(f"[DML] Executando {os.path.basename(DML_PATH)}...")
        with open(DML_PATH, "r", encoding="utf-8") as f:
            cursor.executescript(f.read())
        print(" -> Dados inseridos com sucesso.")
    else:
        print(f"[ATENÇÃO] Arquivo DML não encontrado ({DML_PATH}).")

    conn.commit()
    conn.close()

    print("\n" + "=" * 60)
    print(" BANCO DE DADOS CRIADO COM SUCESSO ")
    print("=" * 60)


def _separar_comandos(script_sql: str):
    """Divide um script SQL em comandos individuais (terminados por ';')."""
    comandos, atual = [], ""
    for linha in script_sql.splitlines(keepends=True):
        atual += linha
        if sqlite3.complete_statement(atual):
            if atual.strip():
                comandos.append(atual.strip())
            atual = ""
    if atual.strip():
        comandos.append(atual.strip())
    return comandos


def executar_consulta(numero_consulta: int):
    """Executa consultaX.sql e retorna um DataFrame com o resultado do último SELECT.

    Os comandos são executados um a um, na ordem do arquivo. Assim, as consultas
    9 e 10 (BEGIN / SAVEPOINT / ROLLBACK / COMMIT) controlam a própria transação
    e o SELECT final de cada uma também é exibido.
    """
    sql_path = os.path.join(SQL_DIR, f"consulta{numero_consulta}.sql")
    if not os.path.exists(sql_path):
        print(f"[ERRO] Arquivo não encontrado: {sql_path}")
        return None

    with open(sql_path, "r", encoding="utf-8") as f:
        conteudo = f.read()

    # Ignora as linhas de comentário (cabeçalho e observações)
    codigo_sql = "\n".join(
        linha for linha in conteudo.splitlines() if not linha.strip().startswith("--")
    )

    # isolation_level=None: o Python não abre transações implícitas;
    # quem controla a transação é o próprio script SQL.
    conn = sqlite3.connect(DB_PATH, isolation_level=None)
    conn.execute("PRAGMA foreign_keys = ON;")

    resultado = None
    try:
        for comando in _separar_comandos(codigo_sql):
            cursor = conn.execute(comando)
            if cursor.description is not None:
                colunas = [coluna[0] for coluna in cursor.description]
                resultado = pd.DataFrame(cursor.fetchall(), columns=colunas)
        return resultado
    except sqlite3.Error as e:
        if conn.in_transaction:
            conn.execute("ROLLBACK;")
        print(f"[ERRO SQL] consulta{numero_consulta}.sql: {e}")
        return None
    finally:
        conn.close()


def executar_todas_consultas():
    """Executa as 10 consultas em sequência e exibe os resultados no terminal."""
    print("\n" + "=" * 60)
    print(" 2. EXECUÇÃO DAS CONSULTAS SQL ")
    print("=" * 60)

    for numero in range(1, TOTAL_CONSULTAS + 1):
        sql_path = os.path.join(SQL_DIR, f"consulta{numero}.sql")
        titulo = f"consulta{numero}.sql"
        if os.path.exists(sql_path):
            with open(sql_path, "r", encoding="utf-8") as f:
                primeira_linha = f.readline().strip()
            if primeira_linha.startswith("---"):
                titulo = primeira_linha.lstrip("- ").strip()

        print(f"\n--- {titulo} ---")
        df = executar_consulta(numero)
        if df is None:
            print("(sem resultado para exibir)")
        elif df.empty:
            print("(nenhuma linha retornada)")
        else:
            print(df.to_string(index=False))


if __name__ == "__main__":
    executar_projeto()
    executar_todas_consultas()
