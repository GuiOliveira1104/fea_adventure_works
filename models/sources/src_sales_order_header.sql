-- Tabela
with source as (
    select
        SALESORDERID
        , ORDERDATE
        , STATUS
        , CUSTOMERID
        , DUEDATE
        , SHIPDATE
        , CREDITCARDID
        , BILLTOADDRESSID
    from {{ source('RAW_ADVENTURE_WORKS', 'SALESORDERHEADER') }}
)

select *
from source