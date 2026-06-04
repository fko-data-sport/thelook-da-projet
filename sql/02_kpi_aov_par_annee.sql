# KPI panier moyen par année

SELECT
    EXTRACT(YEAR FROM oi.created_at)                 AS annee,

   
    COUNT(DISTINCT oi.order_id)                      AS nb_commandes,

    
    ROUND(SUM(oi.sale_price), 2)                     AS ca_total_eur,

   
    ROUND(SUM(oi.sale_price)
          / NULLIF(COUNT(DISTINCT oi.order_id), 0), 2)
                                                     AS panier_moyen_eur

FROM `bigquery-public-data.thelook_ecommerce.order_items`  AS oi
INNER JOIN `bigquery-public-data.thelook_ecommerce.orders`   AS o  ON oi.order_id  = o.order_id
INNER JOIN `bigquery-public-data.thelook_ecommerce.products` AS p  ON oi.product_id = p.id
INNER JOIN `bigquery-public-data.thelook_ecommerce.users`    AS u  ON o.user_id     = u.id

WHERE
    u.country        = 'France'
    AND p.department = 'Women'
    AND oi.status    = 'Complete'         
    AND DATE(oi.created_at) BETWEEN '2023-01-01' AND '2024-12-31'

GROUP BY annee
ORDER BY annee;