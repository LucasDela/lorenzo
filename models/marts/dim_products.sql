with
    product as (
        select *
        from {{ ref('stg_sap__product') }}
    )
    , productcategory as (
        select *
        from {{ ref('stg_sap__productcategory') }}
    )
    , productsubcategory as (
        select *
        from {{ ref('stg_sap__productsubcategory') }}
    )    
    , dim_products as (
        select
            product.product_id
            , productsubcategory.productsubcategory_id
            , productcategory.productcategory_id
            , productsubcategory.productsubcategoryname
            , productcategory.productcategoryname
            , prduct.productname
            , product.productcolor
        from product
        left join productsubcategory on product.productsubcategory_id = productsubcategry.productsubcategory_id
        left join productcategory on productsubcategory.productcategory_id = productcategory.productcategory_id
    )
select *
from dim_products