/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
-- {{ config(materialized='table') }}
/*
with source_data as -(

    select 1 as id
    union all
    select null as id

)

select *
from source_data
*/
/*
    Uncomment the line below to remove records with null `id` values
*/
-- where id is not null
-- select * from {{ source("tpch", "orders") }}
with

    source as (select * from {{ source("tpch", "orders") }}),

    renamed as (

        select
            o_orderkey,
            o_custkey,
            o_orderstatus,
            o_totalprice,
            o_orderdate,
            o_orderpriority,
            o_clerk,
            o_shippriority,
            o_comment

        from source

    )

select *
from renamed
