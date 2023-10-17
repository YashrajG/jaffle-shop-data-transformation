{% set paymentMethods = ['bank_transfer', 'coupon', 'credit_card', 'gift_card'] %}

with pivoted as (
    SELECT 
        order_id,
        {%- for paymentMethod in paymentMethods %}
            sum(CASE WHEN payment_method = '{{paymentMethod}}' THEN amount ELSE 0 END) as {{paymentMethod}}_amount
            {%- if not loop.last -%}
                ,
            {%- endif -%}
        {% endfor %}
    FROM {{ ref('stg_payments') }}
    GROUP BY order_id
)
SELECT * FROM pivoted