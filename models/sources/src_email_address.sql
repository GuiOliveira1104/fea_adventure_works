-- Tabela
with source as (
    select
        BUSINESSENTITYID
        , EMAILADDRESS
    from {{ source('RAW_ADVENTURE_WORKS', 'EMAILADDRESS') }}
)

select *
from source