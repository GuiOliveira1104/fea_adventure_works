select
    AddressID as id_endereco
    , CountryRegion as pais
    , StateProvince as estado
    , City as cidade
from {{ ref("int_geo") }}