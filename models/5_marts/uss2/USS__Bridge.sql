{{ dbt_utils.union_relations(
    relations=[
        ref('USS__Account_Detail')
        ,ref('USS__Customer')
        ,ref('USS__Date')
        ,ref('USS__Stock ')
        ,ref('USS__Stock_Account_Detail')
        ,ref('USS__Time')
        ],
    include=[
        "_KEY_Account_Detail"
        ,"_KEY_CUSTOMER"
        ,"_KEY_DATE"
        ,"_KEY_STOCK"
        ,"_KEY_Stock_Account_Detail"
        ,"_KEY_TIME"
        ],
    source_column_name="Stage"
) }}