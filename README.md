# mini-lake-dbt-duckdb

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
 # mini-lake-dbt-duckdb

[![dbt build](https://github.com/aosman101/mini-lake-dbt-duckdb/actions/workflows/dbt.yml/badge.svg)](https://github.com/aosman101/mini-lake-dbt-duckdb/actions/workflows/dbt.yml)

Portable, local-first mini lakehouse built with dbt Core and DuckDB. This repository demonstrates a compact, reproducible analytics workflow using versioned CSV seeds, staging models, marts (aggregations), and dbt schema tests — ideal for learning, demos, and portfolio pieces.

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
- RUNNING_DBT.md             — tips for running locally and troubleshooting
- LICENSE

## Quick start — run locally (interactive)

These commands get you up and running in a local dev environment. Run them from the repository root.

```bash
# create & activate a python venv (Unix)
python -m venv .venv
source .venv/bin/activate

# install dbt and the DuckDB adapter
python -m pip install --upgrade pip
python -m pip install dbt-core dbt-duckdb duckdb

# run dbt from the project folder
cd mini_lake
dbt seed            # load the CSV seed(s)
dbt build           # build models and run tests

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

This repo includes a `dbt build` workflow at `.github/workflows/dbt.yml`. It:

- sets up Python 3.12
- installs `dbt-core` and `dbt-duckdb`
- creates a temporary `.ci/profiles.yml` pointing at a file-backed DuckDB (`data/ci.duckdb`)
- runs `dbt build --profiles-dir .ci` inside `mini_lake`

To run the same steps locally, create a small venv and invoke `dbt build --profiles-dir .ci` (see `RUNNING_DBT.md`).

## Troubleshooting tips & interactive notes

- If dbt cannot find `dbt_project.yml`, ensure you are in `mini_lake` or use `--project-dir`.
- Avoid setting `DBT_PROJECT_DIR` to a relative path in shell startup files — prefer absolute paths. See `RUNNING_DBT.md` for details.
- If paths look wrong after moving files, clear compiled artifacts and re-run:

```bash
rm -rf mini_lake/target
dbt seed --project-dir mini_lake
dbt build --project-dir mini_lake
```

## Tests (what CI runs)

CI builds the project and runs all schema/data tests declared under `mini_lake/models/schema.yml`. Locally you can replicate this with `dbt build` after seeding.

## License

This project is licensed under the terms in the `LICENSE` file in the repository root. Briefly:

- You are free to use, modify, and share this project for personal, educational, or commercial purposes subject to the license terms.

If you want a different license (MIT/Apache/BSD), tell me and I can update the `LICENSE` file and add badges.

## Contributing & contact

- Found a bug or want a feature? Open an issue or submit a PR against `main`.
- For quick help: run `dbt debug` inside `mini_lake` (after activating your venv).

---

Thanks for building this — if you'd like, I can add a project badge, a demo GIF, or a one-click Codespace devcontainer next.
