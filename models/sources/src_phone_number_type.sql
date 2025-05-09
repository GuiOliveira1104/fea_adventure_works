-- Tabela
with source as (
    select
        PHONENUMBERTYPEID
        , NAME
    from {{ source('RAW_ADVENTURE_WORKS', 'PHONENUMBERTYPE') }}
)

select *
from source