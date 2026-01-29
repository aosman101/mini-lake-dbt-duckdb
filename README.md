# mini-lake-dbt-duckdb

**Portable, local-first mini lakehouse** using **dbt Core + DuckDB**. It features versioned CSV seeds, models from staging to marts, schema tests, documentation, and an example of GitHub Actions CI — ideal for learning, prototyping, and portfolio demonstrations.

---

## What this project demonstrates

- **Local-first reproducible analytics**: Use DuckDB files for effective local analytics and utilise dbt for model-driven transformations.
- **Seed-driven testing**: Versioned CSV seed files offer consistent datasets for continuous integration and demonstrations (`dbt seed`).
- **Layered architecture**:
  - *Seeds*: small, versioned CSVs (source of truth for demos).
  - *Staging*: `stg_` models to clean and type source data.
  - *Marts / Facts*: aggregated tables for analytics (materialised as tables).
- **Data quality**: dbt schema tests (`not_null`, `unique`, `accepted_values`) — fast feedback loop during development and in CI.
- **Docs & lineage**: `dbt docs generate` + `dbt docs serve` produce an interactive website with lineage graphs and column docs.

 # mini-lake-dbt-duckdb

[![dbt build](https://github.com/aosman101/mini-lake-dbt-duckdb/actions/workflows/dbt.yml/badge.svg)](https://github.com/aosman101/mini-lake-dbt-duckdb/actions/workflows/dbt.yml)


Compact, local-first mini lakehouse designed with dbt Core and DuckDB. This repository showcases a reproducible analytics workflow using versioned CSV seeds, staging models, marts (aggregations), and dbt schema tests—perfect for learning, demonstrations, and portfolio projects.

---

## Highlights

- Local-first analytics with DuckDB (fast, file-based, zero infra).
- Deterministic seeds for reliable tests and CI.
- Layered project structure: seeds → staging → marts.
- Built-in data quality with dbt schema tests (not_null, unique, accepted_values).
- GitHub Actions CI to run `dbt build` on push and PR to `main`.

## Repository layout

mini-lake-dbt-duckdb/

- .github/workflows/dbt.yml  — CI workflow (dbt build)
- mini_lake/                 — the dbt project
  - dbt_project.yml
  - models/
    - staging/stg_orders.sql
    - marts/fct_daily_sales.sql
    - schema.yml
  - seeds/
    - orders.csv
- RUNNING_DBT.md             — tips for running locally and troubleshooting.
- LICENSE

## Quick start — run locally (interactive)

These commands will help you set up a local development environment. Execute them from the repository root.

```bash
# create & activate a Python venv (Unix)
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# install dbt and the DuckDB adapter
python -m pip install --upgrade pip
python -m pip install dbt-core dbt-duckdb duckdb

# run dbt from the project folder
cd mini_lake
dbt seed            # load the CSV seed(s)
dbt build           # build models and run tests
dbt run             
dbt test
dbt debug

# generate docs and serve locally (interactive)
dbt docs generate
dbt docs serve
```

If you prefer to run dbt from the repo root, use the `--project-dir` flag or the wrapper in `RUNNING_DBT.md`:

```bash
.venv/bin/dbt --project-dir mini_lake seed
.venv/bin/dbt --project-dir mini_lake build
```

## Continuous Integration (GitHub Actions)

This repository includes a `dbt build` workflow in `.github/workflows/dbt.yml`. It:

- Sets up Python 3.12.
- Installs `dbt-core` and `dbt-duckdb`.
- Creates a temporary `.ci/profiles.yml` pointing at a file-backed DuckDB (`data/ci.duckdb`).
- Runs `dbt build --profiles-dir .ci` inside `mini_lake`.

To run the same steps locally, create a small venv and invoke `dbt build --profiles-dir .ci` (see `RUNNING_DBT.md`).

## Troubleshooting tips & interactive notes

- If dbt cannot find `dbt_project.yml`, ensure you are in `mini_lake` or use `--project-dir`.
- Avoid setting `DBT_PROJECT_DIR` to a relative path in shell startup files — prefer absolute paths. See `RUNNING_DBT.md` for details.
- If paths look wrong after moving files, clear compiled artefacts and re-run:

```bash
rm -rf mini_lake/target
dbt seed --project-dir mini_lake
dbt build --project-dir mini_lake
```

## Tests (what CI runs)

CI compiles the project and executes all schema/data tests defined in `mini_lake/models/schema.yml`. You can replicate this locally using `dbt build` after seeding the database.

## License

This project is licensed under the terms in the `LICENSE` file in the repository root. Briefly:

- You are allowed to use, modify, and share this project for personal, educational, or commercial purposes, following the license terms.

## Contributing & contact

- Found a bug or want a feature? Open an issue or submit a PR against `main`.
- For quick help: run `dbt debug` inside `mini_lake` (after activating your venv).
