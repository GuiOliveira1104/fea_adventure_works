{{ config(materialized='table') }}

with vendas as (
    select 

        -- , SalesReasonID as IDMotivoVenda
        -- , OrderDate as DataPedido
        -- , DATE_TRUNC('month', OrderDate) as MesAnoPedido
        -- , EXTRACT(year from OrderDate) as AnoPedido
        -- , EXTRACT(month from OrderDate) as MesPedido
        -- , Status as StatusPedido
        -- , s.BillToAddressID as IDEndereco
        -- , CustomerID as IDCliente
        -- , CreditCardID as IDCartaoCredito
        -- , ProductID as IDProduto
        -- , OrderQty as QuantidadePedido
        -- , UnitPrice as PrecoUnitario
        -- , OrderQty * UnitPrice as Receita
        -- , UnitPriceDiscount as DescontoPrecoUnitario
        -- , count(*) over(partition by SalesOrderID) as ContagemItens
        -- , 1 / count(*) over(partition by SalesOrderID) as PesoItem
        -- , sr.SalesReason
        -- , sr.ReasonType


        s.SALESORDERID as IDPedidoVenda
        , s.SALESORDERDETAILID as IDDetalhePedido
        , s.CUSTOMERID as IDCliente
        , s.CREDITCARDID as IDCartaoCredito
        , s.BillToAddressID as IDEndereco
        , s.PRODUCTID as IDProduto
        , s.ORDERQTY as QuantidadePedido
        , s.UNITPRICE as PrecoUnitario
        , s.UNITPRICEDISCOUNT as DescontoPrecoUnitario
        , s.ORDERDATE as DataPedido
        , DATE_TRUNC('month', s.ORDERDATE) as MesAnoPedido
        , EXTRACT(year from s.ORDERDATE) as AnoPedido
        , EXTRACT(month from s.ORDERDATE) as MesPedido
        , s.SHIPDATE as data_envio
        , s.DUEDATE as data_entrega
        , s.STATUS as StatusPedido
    from {{ ref("int_sales") }} as s
    left join {{ ref("int_geo") }} as g on s.BillToAddressID = g.AddressID
)

select *
from vendas
