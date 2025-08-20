{{
  config(
    materialized='view'
  )
}}

WITH source AS (
    SELECT * FROM {{ ref('marketing') }}
),

renamed AS (
    SELECT
        id,
        c_date AS campaign_date,
        LOWER(TRIM(campaign_name)) AS campaign_name,
        LOWER(category) AS category,
        campaign_id,
        impressions,
        mark_spent AS marketing_spend,
        clicks,
        leads,
        orders,
        revenue
    FROM source
)

SELECT * FROM renamed