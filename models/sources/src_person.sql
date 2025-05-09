-- Tabela
with source as (
    select
        BUSINESSENTITYID
        , TITLE
        , FIRSTNAME
        , MiddleName
        , LastName
    from {{ source('RAW_ADVENTURE_WORKS', 'PERSON') }}
)

select *
from source