-- Tabela
with source as (
    select
        CUSTOMERID
        , PERSONID
        , STOREID
    from {{ source('RAW_ADVENTURE_WORKS', 'CUSTOMER') }}
)

select *
from source