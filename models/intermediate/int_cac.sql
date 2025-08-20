{{
    config(
        materialized='table'
    )
}}
select campaign_name, (sum(marketing_spend)/sum(leads)) as CAC 
from {{ ref('stg_marketing') }} 
group by campaign_name order by 2 desc