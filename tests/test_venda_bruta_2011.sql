-- test_faturamento_bruto_2011.sql
-- Teste para garantir a veracidade do valor total negociado em 2011
-- Neste teste, validamos que o valor total (bruto) das vendas no ano de 2011
-- seja exatamente igual a $12.646.112,16, conforme validado pela área de negócios.
-- Cálculo: SUM(quantidadepedido * precounitario)

SELECT 1
WHERE (
    SELECT ROUND(SUM(quantidadepedido * precounitario), 2)
    FROM {{ ref('ft_vendas') }}
    WHERE EXTRACT(YEAR FROM DataPedido) = 2011
) != 12646112.16
