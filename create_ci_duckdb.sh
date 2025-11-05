#!/bin/bash
set -e

echo "Creating mini_lake/data and ci.duckdb (if needed)"
mkdir -p mini_lake/data

echo "Checking for python duckdb package..."
if ! python -c "import duckdb" >/dev/null 2>&1; then
  echo "Installing duckdb Python package..."
  python -m pip install --user duckdb
fi

echo "Creating the DuckDB file and adding a tiny init table"
python - <<'PY'
import duckdb, os
os.makedirs('mini_lake/data', exist_ok=True)
con = duckdb.connect('mini_lake/data/ci.duckdb')
con.execute("CREATE TABLE IF NOT EXISTS _init(x INT);")
con.execute("INSERT INTO _init VALUES (1);")
con.close()
print('Created mini_lake/data/ci.duckdb')
PY

echo "Adding and committing the DB file"
git add mini_lake/data/ci.duckdb
if git diff --staged --quiet; then
  echo "No staged changes (ci.duckdb may be unchanged)."
else
  git commit -m "ci: add CI DuckDB database file"
  echo "Attempting to push to origin HEAD..."
  git push origin HEAD || {
    echo "git push failed (likely lack of credentials). The DB was created locally but not pushed." >&2
    exit 0
  }
fi

echo "Done."
