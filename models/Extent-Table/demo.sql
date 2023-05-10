
{{
  config(
    materialized='from_external_stage',
    layer ='azure://nghialake.blob.core.windows.net/nghiafile/Data/Bronze/',
    table ='S4HANA/SALE/',
    is_truncatetable = 'True'
  )
}}
select
  $1:id::varchar(255) as id,
  $1:first_name::varchar(255) as first_name
from {{ external_stage() }}