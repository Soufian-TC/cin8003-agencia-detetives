import os
import glob
import sqlite3
import pandas as pd

# 1. Définition dynamique des chemins relatifs à la racine du dépôt
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_DIR = os.path.join(BASE_DIR, "database")
DB_PATH = os.path.join(DB_DIR, "agencia_detetives.db")
SQL_DIR = os.path.join(BASE_DIR, "sql")

DDL_PATH = os.path.join(SQL_DIR, "script_ddl.sql")
DML_PATH = os.path.join(SQL_DIR, "script_dml.sql")


def executar_projeto():
    # S'assurer que le dossier database/ existe
    os.makedirs(DB_DIR, exist_ok=True)

    # Réinitialisation propre de la base SQLite si elle existe déjà (avec gestion du verrouillage Windows)
    if os.path.exists(DB_PATH):
        try:
            os.remove(DB_PATH)
            print(f"[INFO] Ancien fichier de base de données supprimé : {DB_PATH}")
        except PermissionError:
            print(f"[AVIS] Impossible de supprimer {DB_PATH} (fichier en cours d'utilisation). Réutilisation de la base existante.")

    # Connexion à la base SQLite
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    # Activation obligatoire de la gestion des clés étrangères dans SQLite[cite: 5]
    cursor.execute("PRAGMA foreign_keys = ON;")

    print("\n" + "=" * 60)
    print(" 1. CRÉATION ET POPULATION DE LA BASE DE DONNÉES ")
    print("=" * 60)

    # 2. Exécution du DDL (Création des tables)
    if os.path.exists(DDL_PATH):
        print(f"[DDL] Exécution de {os.path.basename(DDL_PATH)}...")
        with open(DDL_PATH, "r", encoding="utf-8") as f:
            cursor.executescript(f.read())
        print(" -> Tables créées avec succès.")
    else:
        print(f"[ERREUR] Fichier introuvable : {DDL_PATH}")
        conn.close()
        return

    # 3. Exécution du DML (Insertion des données)
    if os.path.exists(DML_PATH):
        print(f"[DML] Exécution de {os.path.basename(DML_PATH)}...")
        with open(DML_PATH, "r", encoding="utf-8") as f:
            cursor.executescript(f.read())
        print(" -> Données insérées avec succès.")
    else:
        print(f"[ATTENTION] Fichier DML non trouvé ({DML_PATH}).")

    conn.commit()

    conn.close()
    print("\n" + "=" * 60)
    print(" TRAITEMENT COMPLÉTÉ AVEC SUCCÈS ")
    print("=" * 60)


def executar_consulta(numero_consulta: int):
    """Exécute une requête spécifique (consultaX.sql) et retourne un DataFrame Pandas."""
    sql_path = os.path.join(SQL_DIR, f"consulta{numero_consulta}.sql")
    if not os.path.exists(sql_path):
        print(f"[ERREUR] Fichier introuvable : {sql_path}")
        return None
        
    with open(sql_path, "r", encoding="utf-8") as f:
        content = f.read()
        
    # Isoler le code SQL en ignorant les commentaires d'en-tête
    code_sql = "\n".join([line for line in content.splitlines() if not line.strip().startswith("--")])
    
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    cursor.execute("PRAGMA foreign_keys = ON;")
    
    try:
        # Si c'est une transaction ou mise à jour (9 ou 10)
        if any(kw in code_sql.upper() for kw in ["SAVEPOINT", "ROLLBACK", "COMMIT", "UPDATE", "INSERT"]):
            cursor.executescript(code_sql)
            conn.commit()
            print(f"Transaction / Commande de consulta{numero_consulta}.sql exécutée avec succès.")
            return None
        else:
            df = pd.read_sql_query(code_sql, conn)
            return df
    except sqlite3.Error as e:
        print(f"[ERREUR SQL] {e}")
        return None
    finally:
        conn.close()


if __name__ == "__main__":
    executar_projeto()