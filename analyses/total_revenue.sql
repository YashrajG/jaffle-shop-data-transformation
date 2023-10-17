select 
    sum(amount) AS TOTAL_WITH_COUPONS,
    SUM(CASE WHEN PAYMENT_METHOD != 'coupon' THEN AMOUNT ELSE 0 END) AS TOTAL_WITHOUT_COUPONS
from {{ ref('stg_payments') }}
where status = 'success'
    AND AMOUNT > 0