{{ config(materialized='table') }}

select
    AddressID as IDEndereco
    , CountryRegion as Pais
    , StateProvince as Estado
    , City as Cidade
from {{ ref("int_geo") }}
