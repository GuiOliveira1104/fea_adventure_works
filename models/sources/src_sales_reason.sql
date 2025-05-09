-- Tabela
with source as (
    select
        SALESREASONID
        , NAME
        , REASONTYPE
    from {{ source('RAW_ADVENTURE_WORKS', 'SALESREASON') }}
)

select *
from source