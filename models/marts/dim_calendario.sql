{{ config(materialized='table') }}

with datas as (
    select
        dateadd(day, seq4(), '2010-01-01') as data
    from table(generator(rowcount => 365 * 5))

),

dim_calendario as (

    select
        Data,
        extract(year from data) as Ano,
        extract(month from data) as Mes,
        extract(day from data) as Dia,
        
        case extract(month from data)
            when 1 then 'Janeiro'
            when 2 then 'Fevereiro'
            when 3 then 'Março'
            when 4 then 'Abril'
            when 5 then 'Maio'
            when 6 then 'Junho'
            when 7 then 'Julho'
            when 8 then 'Agosto'
            when 9 then 'Setembro'
            when 10 then 'Outubro'
            when 11 then 'Novembro'
            when 12 then 'Dezembro'
        end as MesEscrito

    from datas
)

select * from dim_calendario
