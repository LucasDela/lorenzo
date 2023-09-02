with
    source_countryregion as (
        select
            countryregion.countryregioncode as country_code,
            countryregion.name as country_name
        from {{ source('sap', 'countryregion') }}
    )
select *
from source_countryregion
