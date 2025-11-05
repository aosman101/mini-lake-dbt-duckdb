# Running dbt in this repo

If you want to run dbt commands from the repo root, either change into the project folder or point dbt at the project directory.

Examples:

```bash
# change into the project and run normally
cd mini_lake
source ../.venv-1/bin/activate   # if you are using the project's venv
dbt seed
dbt build

# — OR — run from repo root by specifying the project dir
dbt --project-dir mini_lake seed
dbt --project-dir mini_lake build
```

Tip: the project's seed file is `mini_lake/seeds/orders.csv` and the project expects the seed name `orders` (so the filename must be `orders.csv`).

If you prefer a short wrapper script, you can create `./dbt.sh` in the repo root with:

```bash
#!/usr/bin/env bash
exec .venv-1/bin/dbt --project-dir mini_lake "$@"
```

Make it executable: `chmod +x dbt.sh` and run `./dbt.sh test` from repo root.

If you're using Codespaces or a devcontainer, add the install steps to `devcontainer.json` `postCreateCommand` so dbt is available automatically.

## Important note about DBT_PROJECT_DIR and compiled artifacts

Avoid setting DBT_PROJECT_DIR to a relative path in your shell startup files (for example, `export DBT_PROJECT_DIR=mini_lake`). If that variable is set to a relative path and you change directories (for example `cd mini_lake`), dbt may try to resolve seeds and models against an incorrect path (like `mini_lake/mini_lake/...`).

If you do need to set a project dir in an environment variable, use an absolute path instead:

```bash
# good: absolute path
export DBT_PROJECT_DIR=/workspaces/mini-lake-dbt-duckdb/mini_lake

# avoid: relative path
# export DBT_PROJECT_DIR=mini_lake
```

If you change DBT_PROJECT_DIR or move files, clean the compiled artifacts so dbt recompiles with correct paths:

```bash
rm -rf target
dbt seed --project-dir .
dbt build --project-dir .
```
