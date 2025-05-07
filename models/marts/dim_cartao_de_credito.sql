{{ config(materialized='table') }}

select
    CreditCardID as id_cartao
    , CardType as tipo_cartao
from {{ ref("src_credit_card") }}
