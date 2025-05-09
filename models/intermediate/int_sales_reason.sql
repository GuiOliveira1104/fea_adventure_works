with joined_table as (
    select 
        b.SalesOrderID
        , b.SalesReasonID
        , r.Name as SalesReason
        , r.ReasonType
    from {{ ref("src_sales_order_header_reason") }} as b
    left join {{ ref("src_sales_reason") }} as r on b.SalesReasonID = r.SalesReasonID
)

select *
from joined_table