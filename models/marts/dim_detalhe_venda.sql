select
    SalesOrderID as id_motivo_da_venda
    , SalesReason as motivo
    , ReasonType as classe_motivo
    , 1 / count(*) over(partition by SalesOrderID) as distribuicao
from {{ ref("int_sales_reason") }}
