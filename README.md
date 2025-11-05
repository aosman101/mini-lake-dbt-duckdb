# mini-lake-dbt-duckdb

[![Build Status](https://img.shields.io/github/actions/workflow/status/<your-username>/mini-lake-dbt-duckdb/dbt.yml?branch=main)](https://github.com/<your-username>/mini-lake-dbt-duckdb/actions)
[![License](https://img.shields.io/github/license/<your-username>/mini-lake-dbt-duckdb)](./LICENSE)
[![dbt](https://img.shields.io/badge/dbt-compatible-1.8%2B-informational)](https://docs.getdbt.com/)
[![DuckDB](https://img.shields.io/badge/DuckDB-local-first-brightgreen)](https://duckdb.org/)

**Portable, local-first mini lakehouse** utilising **dbt Core + DuckDB**. It features versioned CSV seeds, models from staging to marts, schema tests, documentation, and an example of GitHub Actions CI — ideal for learning, prototyping, and portfolio demonstrations.

---

## What this project demonstrates (detailed)

- **Local-first reproducible analytics**: use DuckDB files for fast local analytics and dbt for model-driven transformations.
- **Seed-driven testing**: versioned CSV seeds provide deterministic datasets for CI and demos (`dbt seed`).
- **Layered architecture**:
  - *Seeds*: small, versioned CSVs (source of truth for demos).
  - *Staging*: `stg_` models to clean and type source data.
  - *Marts / Facts*: aggregated tables for analytics (materialised as tables).
- **Data quality**: dbt schema tests (`not_null`, `unique`, `accepted_values`) — fast feedback loop during development and in CI.
- **Docs & lineage**: `dbt docs generate` + `dbt docs serve` produce an interactive website with lineage graphs and column docs.

## Project structure

mini-lake-dbt-duckdb/

├─ README.md

├─ .github/

│  └─ workflows/dbt.yml           # CI (GitHub Actions).

├─ mini_lake/

│  ├─ dbt_project.yml

│  ├─ profiles.yml Example(not committed).
│  ├─ models/

│  │  ├─ staging/stg_orders.sql

│  │  ├─ marts/fct_daily_sales.sql

│  │  └─ schema.yml

│  └─ seeds/

│     └─ orders.csv

├─ .gitignore

└─ LICENSE

## QuickStart

## 1 — clone & virtualenv
bash
git clone https://github.com/<your-username>/mini-lake-dbt-duckdb.git
cd mini-lake-dbt-duckdb

# create & activate venv
python -m venv .venv

# macOS/Linux
source .venv/bin/activate

# Windows (PowerShell)
# .\.venv\Scripts\Activate.ps1

# Install dbt + DuckDB adapter

python -m pip install --upgrade pip
python -m pip install dbt-core dbt-duckdb duckdb

# Seed, build, test, and document.

cd mini_lake
# load seeds
dbt seed

# build models + tests (or run individual commands)
dbt build

# generate & serve docs (interactive)
dbt docs generate
dbt docs serve
