{{ config(materialized='table') }}

select
    SalesOrderID as IDPedidoVenda
    , SalesReasonID as IDMotivoVenda
    , SalesReason as motivo
    , ReasonType as tipo_motivo
from {{ ref("int_sales_reason") }}
