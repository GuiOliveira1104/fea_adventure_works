-- Tabela
with source as (
    select
        CREDITCARDID
        , CARDTYPE
    from {{ source('RAW_ADVENTURE_WORKS', 'CREDITCARD') }}
)

select *
from source