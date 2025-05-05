-- Tabela
with source as (
    select
        STATEPROVINCEID
        , COUNTRYREGIONCODE
        , NAME
    from {{ source('RAW_ADVENTURE_WORKS', 'STATEPROVINCE') }}
)

select *
from source
