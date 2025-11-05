# mini-lake-dbt-duckdb

![Build Status](https://img.shields.io/github/actions/workflow/status/<your-username>/mini-lake-dbt-duckdb/dbt.yml?branch=main)
![dbt](https://img.shields.io/badge/dbt-compatible-1.8%2B-informational)
![DuckDB](https://img.shields.io/badge/DuckDB-local-first-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)

A portable, local-first mini lakehouse using **dbt + DuckDB**: seeds, staging, marts models, tests, documentation, and continuous integration. Ideal for learning, prototyping, and portfolio demonstrations.

---

## ⚡ Features

- Lightweight local-first analytics with **DuckDB** and **dbt Core**  
- Versioned CSV seeds for deterministic test data (`dbt seed`)
- Clean staging models & mart/fact tables (star schema example)  
- Schema tests + basic CI (GitHub Actions) to keep data quality high
- Auto-generated docs you can `dbt docs generate` and serve locally.

---
## Project Structure

mini-lake-dbt-duckdb/
├─ README.md

├─ .github/

│  └─ workflows/dbt.yml          # CI (GitHub Actions)

├─ mini_lake/

│  ├─ dbt_project.yml

│  ├─ profiles.yml (example / not committed)

│  ├─ models/

│  │  ├─ staging/stg_orders.sql

│  │  ├─ marts/fct_daily_sales.sql

│  │  └─ schema.yml

│  └─ seeds/

│     └─ orders.csv

├─ .gitignore

└─ LICENSE



## Quickstart (copy-paste)

bash
# 1. Clone repo
git clone https://github.com/<your-username>/mini-lake-dbt-duckdb.git
cd mini-lake-dbt-duckdb

# 2. Create + activate venv
python -m venv .venv
# macOS / Linux
source .venv/bin/activate
# Windows (PowerShell)
# .\.venv\Scripts\Activate.ps1

# 3. Install dbt + DuckDB adapter
python -m pip install --upgrade pip
python -m pip install dbt-core dbt-duckdb duckdb

# 4. Place seeds & config (already provided)
seeds: mini_lake/seeds/orders.csv
ensure your ~/.dbt/profiles.yml points to the project profile (see Profiles below)

# 5. Quick run
cd mini_lake
dbt debug
dbt seed

dbt build      # runs models + tests

dbt docs generate
dbt docs serve   #You can view the documentation at http://localhost:8080.
