with vendas as (
    select 
        SalesOrderID as IDPedidoVenda
        , SalesOrderDetailId as IDDetalhePedido
        , OrderDate as DataPedido
        , DATE_TRUNC('month', OrderDate) as MesAnoPedido
        , EXTRACT(year from OrderDate) as AnoPedido
        , EXTRACT(month from OrderDate) as MesPedido
        , Status as StatusPedido
        , s.BillToAddressID as IDEndereco
        , CustomerID as IDCliente
        , CreditCardID as IDCartaoCredito
        , ProductID as IDProduto
        , OrderQty as QuantidadePedido
        , UnitPrice as PrecoUnitario
        , OrderQty * UnitPrice as Receita
        , UnitPriceDiscount as DescontoPrecoUnitario
        , count(*) over(partition by SalesOrderID) as ContagemItens
        , 1 / count(*) over(partition by SalesOrderID) as PesoItem
    from {{ ref("int_sales") }} as s
    left join {{ ref("int_geo") }} as g on s.BillToAddressID = g.AddressID
)

select *
from vendas
