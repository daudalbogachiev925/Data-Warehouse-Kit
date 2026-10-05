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

**schema/dwh.sql**
```sql
CREATE SCHEMA IF NOT EXISTS dwh;

CREATE TABLE dwh.dim_customer (
    customer_sk BIGSERIAL PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    name TEXT NOT NULL,
    city TEXT,
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP,
    is_current BOOLEAN DEFAULT TRUE
);

CREATE TABLE dwh.dim_product (
    product_sk BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    name TEXT,
    category TEXT,
    price NUMERIC(12,2)
);

CREATE TABLE dwh.dim_date (
    date_sk INT PRIMARY KEY,
    full_date DATE,
    year INT, quarter INT, month INT,
    week INT, day_of_week INT, is_weekend BOOLEAN
);
