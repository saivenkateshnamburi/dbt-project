{% snapshot snp_marketing %}
    {{
        config(
            target_schema='venkatesh',
            target_database='sai',
            unique_key='CAMPAIGN_ID',
            strategy='check',
            check_cols=['campaign_name', 'budget', 'status', 'target_audience']
        )
    }}

    select * from {{ ref('marketing_campaigns') }}
{% endsnapshot %}