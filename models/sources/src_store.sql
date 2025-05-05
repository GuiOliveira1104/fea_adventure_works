-- Tabela
with source as (
    select
        BUSINESSENTITYID
        , Name
    from {{ source('RAW_ADVENTURE_WORKS', 'STORE') }}
)

select *
from source