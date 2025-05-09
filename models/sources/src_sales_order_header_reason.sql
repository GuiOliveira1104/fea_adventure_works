-- Tabela
with source as (
    select
        SALESORDERID
        , SALESREASONID
    from {{ source('RAW_ADVENTURE_WORKS', 'SALESORDERHEADERSALESREASON') }}
)

select *
from source