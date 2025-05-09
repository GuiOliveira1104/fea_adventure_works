-- Tabela
with source as (
    select
        SALESORDERID
        , SALESORDERDETAILID
        , PRODUCTID
        , ORDERQTY
        , UNITPRICE
        , UNITPRICEDISCOUNT
    from {{ source('RAW_ADVENTURE_WORKS', 'SALESORDERDETAIL') }}
)

select *
from source