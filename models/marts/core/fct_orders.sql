with order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from {{ ref('stg_payments') }}
    group by 1
)
select
    jaffleOrder.order_id,
    customer.customer_id,
    amount
from
    {{ ref('stg_orders') }} jaffleOrder
    left join {{ ref('stg_customers') }} customer using (customer_id)
    left join order_payments using (order_id)