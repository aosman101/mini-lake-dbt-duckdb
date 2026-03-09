# mini-lake-dbt-duckdb

[![dbt build](https://github.com/aosman101/mini-lake-dbt-duckdb/actions/workflows/dbt.yml/badge.svg?branch=main)](https://github.com/aosman101/mini-lake-dbt-duckdb/actions/workflows/dbt.yml)
[![Python 3.12](https://img.shields.io/badge/Python-3.12-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![dbt Core](https://img.shields.io/badge/dbt%20Core-compatible-FF694B?logo=dbt&logoColor=white)](https://docs.getdbt.com/docs/core)
[![DuckDB](https://img.shields.io/badge/DuckDB-local%20warehouse-FECD3E)](https://duckdb.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)

Compact local-first analytics project built with dbt Core + DuckDB. It uses versioned CSV seeds, staging and mart models, schema tests, and GitHub Actions CI for reproducible transformations.

## What this project includes

- dbt project at `mini_lake/` with a layered model structure:
  - `seeds/orders.csv`
  - `models/staging/stg_orders.sql`
  - `models/marts/fct_daily_sales.sql`
  - `models/schema.yml` tests (`not_null`, `unique`, `accepted_values`)
- CI workflow: `.github/workflows/dbt.yml` running `dbt build` on pushes/PRs to `main`
- Running notes: `RUNNING_DBT.md`

## Quick start

From the repository root:

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install dbt-core dbt-duckdb duckdb

dbt --project-dir mini_lake seed
dbt --project-dir mini_lake build
dbt --project-dir mini_lake test
```

Optional docs:

```bash
dbt --project-dir mini_lake docs generate
dbt --project-dir mini_lake docs serve
```

## CI behavior

The CI workflow installs dbt + DuckDB, creates a file-backed DuckDB database, writes `.ci/profiles.yml`, then runs:

```bash
cd mini_lake
dbt build --profiles-dir ../.ci
```

## License

This project is licensed under the MIT License. See [LICENSE](./LICENSE).
