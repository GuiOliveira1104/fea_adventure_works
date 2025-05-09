{{ config(materialized='table') }}

select
    ProductID IDProduto
    , Name as Produto
    , CLASS as Classe
    , LISTPRICE as PrecoRecomendado
    , STANDARDCOST as Custo
from {{ ref("src_product") }}
