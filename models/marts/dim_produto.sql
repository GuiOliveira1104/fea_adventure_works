{{ config(materialized='table') }}

select
    ProductID id_produto
    , Name as produto
    , CLASS as classe
    , LISTPRICE as preco_recomendado
    , STANDARDCOST as custo
from {{ ref("src_product") }}
