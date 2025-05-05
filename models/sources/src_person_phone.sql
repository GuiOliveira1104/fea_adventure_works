-- Tabela
with source as (
    select
        BUSINESSENTITYID
        , PHONENUMBER
        , PHONENUMBERTYPEID
    from {{ source('RAW_ADVENTURE_WORKS', 'PERSONPHONE') }}
)

select *
from source