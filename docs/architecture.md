# Архитектура

Источники → Staging → DWH → Marts → BI

1. Источники: 1С, CRM, сайт (CSV/API)
2. Staging: as-is, без трансформаций
3. DWH: очистка, SCD2 для измерений
4. Marts: витрины под отчёты
5. BI: Metabase / Superset

Обновление: ежедневно в 03:00.
