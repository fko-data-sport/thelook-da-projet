# KPI taux de retour par année


SELECT
  EXTRACT(YEAR FROM oi.created_at) AS annee,

  COUNTIF(oi.status = 'Returned') AS nb_retours,

  COUNTIF(oi.status IN ('Returned', 'Complete')) AS nb_total_traite,

  ROUND(
    COUNTIF(oi.status = 'Returned')
    / NULLIF(COUNTIF(oi.status IN ('Returned', 'Complete')), 0)
    * 100
  , 2) AS taux_retour_pct

FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi

INNER JOIN `bigquery-public-data.thelook_ecommerce.orders` AS o
  ON oi.order_id = o.order_id

INNER JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id

INNER JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON o.user_id = u.id

WHERE
  u.country = 'France'
  AND p.department = 'Women'
  AND DATE(oi.created_at) BETWEEN '2023-01-01' AND '2024-12-31'
  AND oi.status IN ('Complete', 'Returned')

GROUP BY annee
ORDER BY annee;