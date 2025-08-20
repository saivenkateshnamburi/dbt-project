    SELECT
        {{ dbt_utils.date_trunc('week', 'campaign_date') }} AS week_start_date,
        campaign_name,
        category,
        SUM(impressions) AS impressions,
        SUM(marketing_spend) AS marketing_spend,
        SUM(clicks) AS clicks,
        SUM(leads) AS leads,
        SUM(orders) AS orders,
        SUM(revenue) AS revenue,
        SUM(profit) AS profit,
        COUNT(DISTINCT campaign_date) AS days_active
    FROM {{ ref('daily_performance') }}
    GROUP BY 1, 2, 3