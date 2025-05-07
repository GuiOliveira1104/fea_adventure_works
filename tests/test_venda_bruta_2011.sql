SELECT 1
WHERE (
    SELECT ROUND(SUM(quantidadepedido * precounitario), 2)
    FROM {{ ref('ft_vendas') }}
    WHERE EXTRACT(YEAR FROM DataPedido) = 2011
) != 12646112.16
