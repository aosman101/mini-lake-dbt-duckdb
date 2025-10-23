# Mini Lake — DuckDB + dbt (local)

<!-- Top badges: status, tech, license -->
<p align="left">
  <img alt="status" src="https://img.shields.io/badge/status-WIP-yellow" />
  <img alt="dbt" src="https://img.shields.io/badge/dbt-Core-D9482B?logo=dbt&logoColor=white" />
  <img alt="DuckDB" src="https://img.shields.io/badge/DuckDB-Local-007acc?logo=duckdb&logoColor=white" />
  <img alt="Python" src="https://img.shields.io/badge/Python-3.11-3776AB?logo=python&logoColor=white" />
  <img alt="License" src="https://img.shields.io/badge/License-MIT-green" />
</p>

Mini Lake is a laptop-based data engineering pipeline designed to ingest raw CSV files, transform them using dbt Core with the dbt-duckdb adapter, and store the results in a local DuckDB file. It features a mini-lake architecture that includes staging areas and data marts, along with automated testing and version-controlled SQL. This setup is ideal for students looking to enhance their portfolios.

---

## About

A straightforward, cost-free data engineering project demonstrating local ETL and modelling with **DuckDB + dbt**. It's ideal for learning dbt patterns (staging, marts, tests, docs) without incurring cloud expenses. (See the dbt+DuckDB quickstart for further information.)


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


## How to create this file (~/dbt/profiles.yml).

# Yaml

mini_lake:
  target: dev
  outputs:
    dev:
      type: duckdb
      path: "./mini_lake.duckdb"
      

## Quickstart

# bash
python -m venv .venv && source .venv/bin/activate

python -m pip install --upgrade pip

python -m pip install dbt-core dbt-duckdb

# Please set up the file located at ~/.dbt/profiles.yml. Refer to the snippet below for guidance.

dbt seed

dbt run

dbt test

dbt docs generate

