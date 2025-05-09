{{ config(materialized='table') }}

select
    SalesOrderID as IDPedidoVenda
    , SalesReasonID as IDMotivoVenda
    , SalesReason as Motivo
    , ReasonType as TipoMotivo
from {{ ref("int_sales_reason") }}
