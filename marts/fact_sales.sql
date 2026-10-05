CREATE TABLE marts.fact_sales AS
SELECT
    dd.date_sk,
    dc.customer_sk,
    dp.product_sk,
    s.qty,
    s.qty * dp.price AS revenue,
    s.qty * dp.price * 0.2 AS margin
FROM staging.sales s
JOIN dwh.dim_date dd ON dd.full_date = s.sold_at::date
JOIN dwh.dim_customer dc ON dc.customer_id = s.customer_id AND dc.is_current
JOIN dwh.dim_product dp ON dp.product_id = s.product_id;
