# KPI taux réachat par année

WITH orders_per_user AS (

  SELECT
      EXTRACT(YEAR FROM o.created_at) AS annee,
      u.id AS user_id,
      COUNT(DISTINCT o.order_id) AS nb_orders

  FROM `bigquery-public-data.thelook_ecommerce.orders` o

  JOIN `bigquery-public-data.thelook_ecommerce.users` u
    ON o.user_id = u.id

  JOIN `bigquery-public-data.thelook_ecommerce.order_items` oi
    ON o.order_id = oi.order_id

  JOIN `bigquery-public-data.thelook_ecommerce.products` p
    ON oi.product_id = p.id

  WHERE
      u.country = 'France'
      AND p.department = 'Women'
      AND DATE(o.created_at)
          BETWEEN '2023-01-01' AND '2024-12-31'

  GROUP BY annee, user_id
)

SELECT
    annee,
    COUNTIF(nb_orders >= 2) AS clients_recurrents,
    COUNT(*) AS clients_total,
    ROUND(
        COUNTIF(nb_orders >= 2) / COUNT(*) * 100,
        2
    ) AS taux_reachat_pct

FROM orders_per_user
GROUP BY annee
ORDER BY annee;
