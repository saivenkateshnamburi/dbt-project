{{
    config(
        materialized='view'
    )
}}
    SELECT
        campaign_date,
        campaign_name,
        category,
        SUM(impressions) AS impressions,
        SUM(marketing_spend) AS marketing_spend,
        SUM(clicks) AS clicks,
        SUM(leads) AS leads,
        SUM(orders) AS orders,
        SUM(revenue) AS revenue,
        SUM(revenue) - SUM(marketing_spend) AS profit
    FROM {{ ref('stg_marketing') }}
    GROUP BY 1, 2, 3
