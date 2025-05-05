-- Tabela
with source as (
    select
        PRODUCTID
        , NAME
        , CLASS
        , LISTPRICE
        , STANDARDCOST
    from {{ source('RAW_ADVENTURE_WORKS', 'PRODUCT') }}
)

select *
from source