with sales as (
    select 
        d.SALESORDERID
        , d.SALESORDERDETAILID
        , d.PRODUCTID
        , d.ORDERQTY
        , d.UNITPRICE
        , d.UNITPRICEDISCOUNT
        , to_date(h.ORDERDATE) as OrderDate
        , h.STATUS
        , h.CUSTOMERID
        , h.DUEDATE
        , h.SHIPDATE
        , h.CREDITCARDID
        , h.BILLTOADDRESSID
    from {{ ref("src_sales_order_details") }} as d
    inner join {{ ref("src_sales_order_header") }} as h on d.SALESORDERID = h.SALESORDERID
)

select 
    *
from sales as d