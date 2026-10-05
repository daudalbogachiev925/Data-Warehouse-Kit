-- Закрываем старую версию
UPDATE dwh.dim_customer d
SET valid_to = NOW(), is_current = FALSE
FROM staging.customers s
WHERE d.customer_id = s.customer_id
  AND d.is_current
  AND (d.name, d.city) IS DISTINCT FROM (s.name, s.city);

-- Открываем новую
INSERT INTO dwh.dim_customer (customer_id, name, city, valid_from)
SELECT s.customer_id, s.name, s.city, NOW()
FROM staging.customers s
LEFT JOIN dwh.dim_customer d
  ON d.customer_id = s.customer_id AND d.is_current
WHERE d.customer_sk IS NULL
   OR (d.name, d.city) IS DISTINCT FROM (s.name, s.city);
