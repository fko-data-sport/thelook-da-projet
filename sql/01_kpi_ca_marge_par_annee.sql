# KPI ca marge par année

SELECT
  EXTRACT(YEAR FROM oi.created_at) AS annee,

  SUM(oi.sale_price) AS ca,
  SUM(oi.sale_price - p.cost) AS marge,

  ROUND(
    SUM(oi.sale_price - p.cost) / SUM(oi.sale_price) * 100,
    2
  ) AS taux_marge_pct

FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON oi.product_id = p.id
JOIN `bigquery-public-data.thelook_ecommerce.orders` o
  ON oi.order_id = o.order_id
JOIN `bigquery-public-data.thelook_ecommerce.users` u
  ON o.user_id = u.id

WHERE
  u.country = 'France'
  AND p.department = 'Women'
  AND oi.status = 'Complete'
  AND DATE(oi.created_at) BETWEEN '2023-01-01' AND '2024-12-31'

GROUP BY annee
ORDER BY annee;