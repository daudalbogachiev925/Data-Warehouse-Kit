# Data-Warehouse-Kit

Хранилище данных: staging → DWH → marts. SCD Type 2. KPI-витрины.
Стек: PostgreSQL 16 + dbt-подобный SQL + Docker.

## Слои
- staging — сырые данные из источников
- dwh — очищенные, нормализованные
- marts — витрины для BI

## Запуск
```bash
cp .env.example .env
docker-compose up -d
make init
make etl
make test
