{{ config(materialized='table') }}

select
    CreditCardID as IDCartao
    , CardType as TipoCartao
from {{ ref("src_credit_card") }}
