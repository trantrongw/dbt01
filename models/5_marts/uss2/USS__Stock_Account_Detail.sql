SELECT
    MD5(
        CONCAT_WS('||', 
        IFNULL(NULLIF(UPPER(TRIM(CAST(A.DV_ACCOUNT_POSITION__LINK_HASHKEY AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST(B.DV_LOAD_DATE AS VARCHAR))), ''), '^^')
        )) as "_KEY_Stock_Account_Detail"
    ,to_char(A.DV_CUSTOMER_HASHKEY) as "_KEY_CUSTOMER"
    ,to_char(A.DV_STOCK_HASHKEY) as "_KEY_STOCK"
    ,to_date(B.DV_LOAD_DATE) as "_KEY_DATE"
    ,to_char(B.DV_LOAD_DATE,'HH24:MI:SS') as "_KEY_TIME"
    ,B.C_QUANTITY as "Quantity"
FROM {{ ref('RAW__LINK_ACCOUNT_POSITION') }} A
        LEFT JOIN {{ ref('RAW__SAT_ACCOUNT_POSITION_DETAILS') }} B
            ON A.DV_ACCOUNT_POSITION__LINK_HASHKEY = B.DV_ACCOUNT_POSITION__LINK_HASHKEY