# Mini Lake — DuckDB + dbt (local)

<!-- Top badges: status, tech, license -->
<p align="left">
  <img alt="status" src="https://img.shields.io/badge/status-WIP-yellow" />
  <img alt="dbt" src="https://img.shields.io/badge/dbt-Core-D9482B?logo=dbt&logoColor=white" />
  <img alt="DuckDB" src="https://img.shields.io/badge/DuckDB-Local-007acc?logo=duckdb&logoColor=white" />
  <img alt="Python" src="https://img.shields.io/badge/Python-3.11-3776AB?logo=python&logoColor=white" />
  <img alt="License" src="https://img.shields.io/badge/License-MIT-green" />
</p>

Mini Lake is a laptop-based data engineering pipeline designed to ingest raw CSV files, transform them using dbt Core with the dbt-duckdb adapter, and store the results in a local DuckDB file. It features a mini-lake architecture that includes staging and marts, as well as automated testing and version-controlled SQL. This setup is ideal for students looking to build their portfolios.

---

## About
A simple, no-cost data engineering project showcasing local ETL and modelling with **DuckDB + dbt**. It's perfect for learning dbt patterns (staging, marts, tests, docs) without incurring cloud costs. (Refer to the dbt+DuckDB quickstart for more information.)

## Features
- Local DuckDB file as a lightweight "lake"/warehouse  
- dbt models: staging → marts, plus dbt tests  
- CI workflow (GitHub Actions) that runs `dbt build` on push/PR  
- Minimal sample data (CSV) so the project runs on any laptop

## Tech stack
- dbt Core + dbt-duckdb adapter.
- DuckDB (local .duckdb file).
- GitHub Actions for CI.
- Markdown README with badges (Shields.io) for quick signals.

## Quickstart (copy-paste)
"`bash
# Create venv (optional)
python -m venv .venv && source .venv/bin/activate

# Install dbt core + duckdb adapter
python -m pip install --upgrade pip
python -m pip install dbt-core dbt-duckdb

# Prepare dbt profile (~/.dbt/profiles.yml)
# see repo README for exact profile YAML
dbt seed
dbt run
dbt test
dbt docs generate

