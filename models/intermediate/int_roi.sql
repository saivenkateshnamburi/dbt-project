{{
    config(
        materialized='table',
        transient = true
    )
}}
select campaign_name, (((SUM(revenue)-SUM(marketing_spend))/SUM(marketing_spend))*100) as ROI 
FROM {{ ref('stg_marketing') }} GROUP BY campaign_name ORDER BY 2 DESC