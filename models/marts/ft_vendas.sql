{{ config(materialized='table') }}

with vendas as (
    select 

        s.SALESORDERID as IDPedidoVenda
        , s.SALESORDERDETAILID as IDDetalhePedido
        , s.CUSTOMERID as IDCliente
        , s.CREDITCARDID as IDCartaoCredito
        , s.BillToAddressID as IDEndereco
        , s.PRODUCTID as IDProduto
        , s.ORDERDATE as DataPedido
        , s.SHIPDATE as DataEnvio
        , s.DUEDATE as DataEntrega
        , s.STATUS as StatusPedido
        , s.UNITPRICE as PrecoUnitario
        , s.UNITPRICEDISCOUNT as DescontoPrecoUnitario
        , s.ORDERQTY as QuantidadePedido
        , (s.UNITPRICE * s.ORDERQTY) as ValorTotal
        , (s.UNITPRICEDISCOUNT * s.ORDERQTY) as DescontoTotal
        , ((s.UNITPRICE - s.UNITPRICEDISCOUNT) * s.ORDERQTY) as ValorLiquido
    from {{ ref("int_sales") }} as s
)

select *
from vendas
