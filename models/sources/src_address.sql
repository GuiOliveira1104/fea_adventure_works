-- Tabela
with source as (
    select
        ADDRESSID
        , CITY
        , STATEPROVINCEID
    from {{ source('RAW_ADVENTURE_WORKS', 'ADDRESS') }}
)

select *
from source
