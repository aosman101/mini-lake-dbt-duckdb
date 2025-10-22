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

- A local DuckDB file can serve as a lightweight data lake or warehouse.  
- dbt models: staging to marts, including dbt tests.  
- CI workflow using GitHub Actions that runs `dbt build` on push or PR.  
- Minimal sample data in CSV format so the project can run on any laptop.
## Tech stack

- dbt Core with the dbt-duckdb adapter. 
- DuckDB (local .duckdb file). 
- Badges available through Shields.io.

## Project Structure

mini-lake-dbt-duckdb/

  ├─ data/raw/members.csv
  
  ├─ models/staging/stg_members.sql
  
  ├─ models/marts/dim_members.sql
  
  ├─ models/schema.yml
  
  ├─ dbt_project.yml
  
  ├─ .github/workflows/ci.yml
  
  └─ README.md
