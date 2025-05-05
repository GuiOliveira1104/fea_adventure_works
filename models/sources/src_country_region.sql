-- Tabela
with source as (
    select
        COUNTRYREGIONCODE
        , NAME
    from {{ source('RAW_ADVENTURE_WORKS', 'COUNTRYREGION') }}
)

select *
from source
