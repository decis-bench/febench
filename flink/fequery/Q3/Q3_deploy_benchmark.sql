select '1' as Q3_Col31_1,
    flatten_request_Q3_Col32_original_0,
    flatten_request_Q3_Col31_original_1,
    flatten_request_Q3_Col34_original_92,
    flatten_request_Q3_Col3_original_93,
    flatten_request_Q3_Col33_original_94,
    flatten_request_Q3_Col3_95,
    flatten_request_Q3_Col3_96,
    flatten_request_Q3_Col3_97,
    Q3_Col31_3,
    feedback_Q3_Col58_multi_direct_2,
    product_Q3_Col3_Q3_Col60_multi_direct_15,
    product_Q3_Col3_Q3_Col61_multi_direct_16,
    product_Q3_Col3_Q3_Col0_multi_direct_17,
    product_Q3_Col3_Q3_Col59_multi_direct_18,
    product_Q3_Col3_Q3_Col64_multi_direct_19,
    product_Q3_Col3_Q3_Col65_multi_direct_20,
    product_Q3_Col3_Q3_Col62_multi_direct_21,
    product_Q3_Col3_Q3_Col63_multi_direct_22,
    product_item_Q3_Col12_multi_last_value_23,
    product_item_Q3_Col16_multi_last_value_24,
    product_item_Q3_Col26_multi_last_value_25,
    product_item_Q3_Col27_multi_last_value_26,
    product_item_Q3_Col9_multi_last_value_27,
    product_item_Q3_Col11_multi_last_value_28,
    product_item_Q3_Col8_multi_last_value_29,
    product_item_Q3_Col7_multi_last_value_30,
    product_item_Q3_Col18_multi_last_value_31,
    product_item_Q3_Col20_multi_last_value_32,
    product_item_Q3_Col21_multi_last_value_33,
    product_item_Q3_Col22_multi_last_value_34,
    product_item_Q3_Col23_multi_last_value_35,
    product_item_Q3_Col24_multi_last_value_36,
    product_item_Q3_Col25_multi_last_value_37,
    product_item_Q3_Col19_multi_last_value_38,
    product_item_Q3_Col14_multi_last_value_39,
    product_item_Q3_Col15_multi_last_value_40,
    shipping_Q3_Col3_Q3_Col54_multi_last_value_41,
    shipping_Q3_Col3_Q3_Col68_multi_last_value_42,
    shipping_Q3_Col3_Q3_Col67_multi_last_value_43,
    shipping_Q3_Col3_Q3_Col66_multi_last_value_44,
    Q3_Col31_4,
    order_cancel_return_Q3_Col4_multi_avg_3,
    Q3_Col31_5,
    order_sales_Q3_Col48_multi_avg_4,
    order_sales_Q3_Col48_multi_avg_4 / order_sales_Q3_Col55_multi_avg_12,
    order_sales_Q3_Col48_multi_avg_5,
    order_sales_Q3_Col48_multi_avg_5 / shipping_Q3_Col3_Q3_Col54_multi_last_value_41,
    order_sales_Q3_Col48_multi_avg_5 / order_sales_Q3_Col54_multi_min_49,
    order_sales_Q3_Col47_multi_avg_6,
    order_sales_Q3_Col47_multi_avg_6 / order_sales_Q3_Col40_multi_unique_count_82,
    order_sales_Q3_Col47_multi_avg_6 / order_sales_Q3_Col55_multi_avg_12,    
    order_sales_Q3_Col47_multi_avg_6 / order_sales_Q3_Col55_multi_avg_12,
    order_sales_Q3_Col47_multi_avg_7,
    order_sales_Q3_Col47_multi_avg_7 / order_sales_Q3_Col40_multi_unique_count_81,
    order_sales_Q3_Col47_multi_avg_7 / shipping_Q3_Col3_Q3_Col54_multi_last_value_41,
    order_sales_Q3_Col54_multi_avg_8,
    order_sales_Q3_Col54_multi_avg_9,
    order_sales_Q3_Col56_multi_avg_10,
    order_sales_Q3_Col53_multi_avg_11,
    order_sales_Q3_Col53_multi_avg_11 / order_sales_Q3_Col47_multi_avg_7,
    order_sales_Q3_Col55_multi_avg_12,
    order_sales_Q3_Col4_multi_avg_13,
    order_sales_Q3_Col4_multi_avg_14,
    order_sales_Q3_Col4_multi_avg_14 / order_sales_Q3_Col55_multi_avg_12,
    order_sales_Q3_Col56_multi_max_45,
    order_sales_Q3_Col4_multi_max_46,
    order_sales_Q3_Col48_multi_min_47,
    order_sales_Q3_Col47_multi_min_48,
    order_sales_Q3_Col54_multi_min_49,
    order_sales_Q3_Col54_multi_min_49 / order_sales_Q3_Col48_multi_avg_5,
    order_sales_Q3_Col56_multi_min_50,
    order_sales_Q3_Col43_multi_unique_count_78,
    order_sales_Q3_Col43_multi_unique_count_78 / order_sales_Q3_Col55_multi_avg_12,
    order_sales_Q3_Col44_multi_unique_count_79,
    order_sales_Q3_Col44_multi_unique_count_80,
    order_sales_Q3_Col40_multi_unique_count_81,
    order_sales_Q3_Col40_multi_unique_count_82,
    order_sales_Q3_Col40_multi_unique_count_82 / order_sales_Q3_Col47_multi_avg_6,
    order_sales_Q3_Col41_multi_unique_count_83,
    order_sales_Q3_Col41_multi_unique_count_84,
    order_sales_Q3_Col39_multi_unique_count_85,
    order_sales_Q3_Col38_multi_unique_count_86,
    order_sales_Q3_Col2_multi_unique_count_87,
    order_sales_Q3_Col2_multi_unique_count_87 / order_sales_Q3_Col55_multi_avg_12,
    order_sales_Q3_Col45_multi_unique_count_88,
    order_sales_Q3_Col35_multi_unique_count_89,
    order_sales_Q3_Col36_multi_unique_count_90,
    order_sales_Q3_Col36_multi_unique_count_91
from 
(
select
    `Q3_Col31` as Q3_Col31_1,
    `Q3_Col32` as flatten_request_Q3_Col32_original_0,
    `Q3_Col31` as flatten_request_Q3_Col31_original_1,
    `Q3_Col34` as flatten_request_Q3_Col34_original_92,
    `Q3_Col3` as flatten_request_Q3_Col3_original_93,
    `Q3_Col33` as flatten_request_Q3_Col33_original_94,
    `Q3_Col3` as flatten_request_Q3_Col3_95,
    `Q3_Col3` as flatten_request_Q3_Col3_96,
    `Q3_Col3` as flatten_request_Q3_Col3_97
from
    `train`
    window flatten_request_Q3_Col3_Q3_Col32_0s_7d_100 as (partition by `Q3_Col3` order by `Q3_Col32` range between interval '7' day preceding and current row)
) as out0
join
(
select
    '1' as Q3_Col31_3,
    `feedback_Q3_Col31`.`Q3_Col58` as feedback_Q3_Col58_multi_direct_2,
    `product_Q3_Col3_Q3_Col3`.`Q3_Col60` as product_Q3_Col3_Q3_Col60_multi_direct_15,
    `product_Q3_Col3_Q3_Col3`.`Q3_Col61` as product_Q3_Col3_Q3_Col61_multi_direct_16,
    `product_Q3_Col3_Q3_Col3`.`Q3_Col0` as product_Q3_Col3_Q3_Col0_multi_direct_17,
    `product_Q3_Col3_Q3_Col3`.`Q3_Col59` as product_Q3_Col3_Q3_Col59_multi_direct_18,
    `product_Q3_Col3_Q3_Col3`.`Q3_Col64Q3_Col64` as product_Q3_Col3_Q3_Col64_multi_direct_19,
    `product_Q3_Col3_Q3_Col3`.`Q3_Col65` as product_Q3_Col3_Q3_Col65_multi_direct_20,
    `product_Q3_Col3_Q3_Col3`.`Q3_Col62Q3_Col62` as product_Q3_Col3_Q3_Col62_multi_direct_21,
    `product_Q3_Col3_Q3_Col3`.`Q3_Col63` as product_Q3_Col3_Q3_Col63_multi_direct_22,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col12` as product_item_Q3_Col12_multi_last_value_23,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col16` as product_item_Q3_Col16_multi_last_value_24,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col26` as product_item_Q3_Col26_multi_last_value_25,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col27` as product_item_Q3_Col27_multi_last_value_26,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col9` as product_item_Q3_Col9_multi_last_value_27,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col11` as product_item_Q3_Col11_multi_last_value_28,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col8` as product_item_Q3_Col8_multi_last_value_29,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col7` as product_item_Q3_Col7_multi_last_value_30,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col18` as product_item_Q3_Col18_multi_last_value_31,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col20` as product_item_Q3_Col20_multi_last_value_32,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col21` as product_item_Q3_Col21_multi_last_value_33,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col22` as product_item_Q3_Col22_multi_last_value_34,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col23` as product_item_Q3_Col23_multi_last_value_35,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col24` as product_item_Q3_Col24_multi_last_value_36,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col25` as product_item_Q3_Col25_multi_last_value_37,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col19` as product_item_Q3_Col19_multi_last_value_38,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col14` as product_item_Q3_Col14_multi_last_value_39,
    `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col15` as product_item_Q3_Col15_multi_last_value_40,
    `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d`.`Q3_Col54` as shipping_Q3_Col3_Q3_Col54_multi_last_value_41,
    `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d`.`Q3_Col68` as shipping_Q3_Col3_Q3_Col68_multi_last_value_42,
    `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d`.`Q3_Col67` as shipping_Q3_Col3_Q3_Col67_multi_last_value_43,
    `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d`.`Q3_Col66` as shipping_Q3_Col3_Q3_Col66_multi_last_value_44
from
    `train`
    join `feedback` as `feedback_Q3_Col31` on `train`.`Q3_Col31` = `feedback_Q3_Col31`.`Q3_Col31`
    join `product_Q3_Col3` as `product_Q3_Col3_Q3_Col3` on `train`.`Q3_Col3` = `product_Q3_Col3_Q3_Col3`.`Q3_Col3`
    join `product_item` as `product_item_Q3_Col6__Q3_Col32_0s_1d` on `train`.`Q3_Col6` = `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col6` and `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col0` < `train`.`Q3_Col32` - CAST(0 as interval second) and `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col0` > `train`.`Q3_Col32` - CAST(86400000 as interval second)
    join `shipping_Q3_Col3` as `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d` on `train`.`Q3_Col3` = `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d`.`Q3_Col3` and `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d`.`Q3_Col0` < `train`.`Q3_Col32` - CAST(0 as interval second) and `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d`.`Q3_Col0` > `train`.`Q3_Col32` - CAST(86400000 as interval second)
) as out1 on out0.Q3_Col31_1 = out1.Q3_Col31_3
join
(
select
    '1' as Q3_Col31_4,
    avg(`Q3_Col4`) as order_cancel_return_Q3_Col4_multi_avg_3
from
    ((select `Q3_Col32` as `Q3_Col0`, CAST('2019-07-18 09:20:20' as timestamp) as `Q3_Col1`, '' as `Q3_Col2`, `Q3_Col3` as `Q3_Col3`, CAST(0 as int) as `Q3_Col4`, '' as `Q3_Col5`, Q3_Col31 from `train`)
    UNION (select `Q3_Col0`, `Q3_Col1`, `Q3_Col2`, `Q3_Col3`, `Q3_Col4`, `Q3_Col5`, '' as Q3_Col31 from `order_cancel_return`))
    window order_cancel_return_Q3_Col3_Q3_Col0_0s_64d_100 as (partition by `Q3_Col3` order by `Q3_Col0` range between interval '64' day preceding and current row)
) as out2 on out0.Q3_Col31_1 = out2.Q3_Col31_4
join
(
select
    '1' as Q3_Col31_5,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col48_multi_avg_4 as order_sales_Q3_Col48_multi_avg_4,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col47_multi_avg_6 as order_sales_Q3_Col47_multi_avg_6,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col53_multi_avg_11 as order_sales_Q3_Col53_multi_avg_11,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col4_multi_avg_13 as order_sales_Q3_Col4_multi_avg_13,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col4_multi_max_46 as order_sales_Q3_Col4_multi_max_46,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col43_multi_unique_count_78 as order_sales_Q3_Col43_multi_unique_count_78,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col44_multi_unique_count_79 as order_sales_Q3_Col44_multi_unique_count_79,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col40_multi_unique_count_81 as order_sales_Q3_Col40_multi_unique_count_81,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col41_multi_unique_count_83 as order_sales_Q3_Col41_multi_unique_count_83,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col39_multi_unique_count_85 as order_sales_Q3_Col39_multi_unique_count_85,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col38_multi_unique_count_86 as order_sales_Q3_Col38_multi_unique_count_86,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col2_multi_unique_count_87 as order_sales_Q3_Col2_multi_unique_count_87,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col45_multi_unique_count_88 as order_sales_Q3_Col45_multi_unique_count_88,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col35_multi_unique_count_89 as order_sales_Q3_Col35_multi_unique_count_89,
    order_sales_Q3_Col3_Q3_Col0_0s_10h_100.order_sales_Q3_Col36_multi_unique_count_90 as order_sales_Q3_Col36_multi_unique_count_90,
    order_sales_Q3_Col3_Q3_Col0_0s_2d_100.order_sales_Q3_Col48_multi_avg_5 as order_sales_Q3_Col48_multi_avg_5,
    order_sales_Q3_Col3_Q3_Col0_0s_2d_100.order_sales_Q3_Col47_multi_avg_7 as order_sales_Q3_Col47_multi_avg_7,
    order_sales_Q3_Col3_Q3_Col0_0s_2d_100.order_sales_Q3_Col54_multi_avg_9 as order_sales_Q3_Col54_multi_avg_9,
    order_sales_Q3_Col3_Q3_Col0_0s_2d_100.order_sales_Q3_Col4_multi_avg_14 as order_sales_Q3_Col4_multi_avg_14,
    order_sales_Q3_Col3_Q3_Col0_0s_2d_100.order_sales_Q3_Col48_multi_min_47 as order_sales_Q3_Col48_multi_min_47,
    order_sales_Q3_Col3_Q3_Col0_0s_2d_100.order_sales_Q3_Col47_multi_min_48 as order_sales_Q3_Col47_multi_min_48,
    order_sales_Q3_Col3_Q3_Col0_0s_2d_100.order_sales_Q3_Col54_multi_min_49 as order_sales_Q3_Col54_multi_min_49,
    order_sales_Q3_Col3_Q3_Col0_0s_2d_100.order_sales_Q3_Col44_multi_unique_count_80 as order_sales_Q3_Col44_multi_unique_count_80,
    order_sales_Q3_Col3_Q3_Col0_0s_2d_100.order_sales_Q3_Col40_multi_unique_count_82 as order_sales_Q3_Col40_multi_unique_count_82,
    order_sales_Q3_Col3_Q3_Col0_0s_2d_100.order_sales_Q3_Col36_multi_unique_count_91 as order_sales_Q3_Col36_multi_unique_count_91,
    order_sales_Q3_Col3_Q3_Col0_0s_14d_100.order_sales_Q3_Col54_multi_avg_8 as order_sales_Q3_Col54_multi_avg_8,
    order_sales_Q3_Col3_Q3_Col0_0s_14d_100.order_sales_Q3_Col56_multi_max_45 as order_sales_Q3_Col56_multi_max_45,
    order_sales_Q3_Col3_Q3_Col0_0s_5d_100.order_sales_Q3_Col56_multi_avg_10 as order_sales_Q3_Col56_multi_avg_10,
    order_sales_Q3_Col3_Q3_Col0_0s_5d_100.order_sales_Q3_Col55_multi_avg_12 as order_sales_Q3_Col55_multi_avg_12,
    order_sales_Q3_Col3_Q3_Col0_0s_64d_100.order_sales_Q3_Col56_multi_min_50 as order_sales_Q3_Col56_multi_min_50,
    order_sales_Q3_Col3_Q3_Col0_0s_64d_100.order_sales_Q3_Col41_multi_unique_count_84 as order_sales_Q3_Col41_multi_unique_count_84
from
    (select 1, '' as `Q3_Col35`, '' as `Q3_Col36`, '' as `Q3_Col37Q3_Col37`, '' as `Q3_Col38`, '' as `Q3_Col39`, '' as `Q3_Col40`, '' as `Q3_Col41`, '' as `Q3_Col42`, '' as `Q3_Col2`, '' as `Q3_Col43`, '' as `Q3_Col44`, '' as `Q3_Col45`, CAST('2019-07-18 09:20:20' as timestamp) as `Q3_Col46`, CAST(0 as bigint) as `Q3_Col4`, CAST(0 as double) as `Q3_Col47`, CAST(0 as double) as `Q3_Col48`, `Q3_Col3` as `Q3_Col3`, '' as `Q3_Col49`, '' as `Q3_Col50Q3_Col50`, '' as `Q3_Col6`, '' as `Q3_Col51`, '' as `Q3_Col52`, CAST(0 as double) as `Q3_Col53`, CAST(0 as double) as `Q3_Col54`, CAST(0 as double) as `Q3_Col55`, CAST(0 as double) as `Q3_Col56`, '' as `Q3_Col57`, Q3_Col31 from `train`) as __main__
    natural join
    (
      select 1,
      avg(`Q3_Col48`)  as order_sales_Q3_Col48_multi_avg_4,
      avg(`Q3_Col47`)  as order_sales_Q3_Col47_multi_avg_6,
      avg(`Q3_Col53`)  as order_sales_Q3_Col53_multi_avg_11,
      avg(`Q3_Col4`)  as order_sales_Q3_Col4_multi_avg_13,
      max(`Q3_Col4`)  as order_sales_Q3_Col4_multi_max_46,
      count(distinct `Q3_Col43`)  as order_sales_Q3_Col43_multi_unique_count_78,
      count(distinct `Q3_Col44`)  as order_sales_Q3_Col44_multi_unique_count_79,
      count(distinct `Q3_Col40`)  as order_sales_Q3_Col40_multi_unique_count_81,
      count(distinct `Q3_Col41`)  as order_sales_Q3_Col41_multi_unique_count_83,
      count(distinct `Q3_Col39`)  as order_sales_Q3_Col39_multi_unique_count_85,
      count(distinct `Q3_Col38`)  as order_sales_Q3_Col38_multi_unique_count_86,
      count(distinct `Q3_Col2`)  as order_sales_Q3_Col2_multi_unique_count_87,
      count(distinct `Q3_Col45`)  as order_sales_Q3_Col45_multi_unique_count_88,
      count(distinct `Q3_Col35`)  as order_sales_Q3_Col35_multi_unique_count_89,
      count(distinct `Q3_Col36`)  as order_sales_Q3_Col36_multi_unique_count_90
      from ((select `Q3_Col32` as `Q3_Col0`, '' as `Q3_Col35`, '' as `Q3_Col36`, '' as `Q3_Col37Q3_Col37`, '' as `Q3_Col38`, '' as `Q3_Col39`, '' as `Q3_Col40`, '' as `Q3_Col41`, '' as `Q3_Col42`, '' as `Q3_Col2`, '' as `Q3_Col43`, '' as `Q3_Col44`, '' as `Q3_Col45`, CAST('2019-07-18 09:20:20' as timestamp) as `Q3_Col46`, CAST(0 as bigint) as `Q3_Col4`, CAST(0 as double) as `Q3_Col47`, CAST(0 as double) as `Q3_Col48`, `Q3_Col3` as `Q3_Col3`, '' as `Q3_Col49`, '' as `Q3_Col50Q3_Col50`, '' as `Q3_Col6`, '' as `Q3_Col51`, '' as `Q3_Col52`, CAST(0 as double) as `Q3_Col53`, CAST(0 as double) as `Q3_Col54`, CAST(0 as double) as `Q3_Col55`, CAST(0 as double) as `Q3_Col56`, '' as `Q3_Col57`, Q3_Col31 from `train`)
      UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`))
      window order_sales_Q3_Col3_Q3_Col0_0s_10h_100 as (partition by `Q3_Col3` order by `Q3_Col0` range between interval '10' hour preceding and current row)
    ) as order_sales_Q3_Col3_Q3_Col0_0s_10h_100
    natural join
    (
      select 1,
      avg(`Q3_Col48`)  as order_sales_Q3_Col48_multi_avg_5,
      avg(`Q3_Col47`)  as order_sales_Q3_Col47_multi_avg_7,
      avg(`Q3_Col54`)  as order_sales_Q3_Col54_multi_avg_9,
      avg(`Q3_Col4`)  as order_sales_Q3_Col4_multi_avg_14,
      min(`Q3_Col48`)  as order_sales_Q3_Col48_multi_min_47,
      min(`Q3_Col47`)  as order_sales_Q3_Col47_multi_min_48,
      min(`Q3_Col54`)  as order_sales_Q3_Col54_multi_min_49,
      count(distinct `Q3_Col44`)  as order_sales_Q3_Col44_multi_unique_count_80,
      count(distinct `Q3_Col40`)  as order_sales_Q3_Col40_multi_unique_count_82,
      count(distinct `Q3_Col36`)  as order_sales_Q3_Col36_multi_unique_count_91
      from ((select `Q3_Col32` as `Q3_Col0`, '' as `Q3_Col35`, '' as `Q3_Col36`, '' as `Q3_Col37Q3_Col37`, '' as `Q3_Col38`, '' as `Q3_Col39`, '' as `Q3_Col40`, '' as `Q3_Col41`, '' as `Q3_Col42`, '' as `Q3_Col2`, '' as `Q3_Col43`, '' as `Q3_Col44`, '' as `Q3_Col45`, CAST('2019-07-18 09:20:20' as timestamp) as `Q3_Col46`, CAST(0 as bigint) as `Q3_Col4`, CAST(0 as double) as `Q3_Col47`, CAST(0 as double) as `Q3_Col48`, `Q3_Col3` as `Q3_Col3`, '' as `Q3_Col49`, '' as `Q3_Col50Q3_Col50`, '' as `Q3_Col6`, '' as `Q3_Col51`, '' as `Q3_Col52`, CAST(0 as double) as `Q3_Col53`, CAST(0 as double) as `Q3_Col54`, CAST(0 as double) as `Q3_Col55`, CAST(0 as double) as `Q3_Col56`, '' as `Q3_Col57`, Q3_Col31 from `train`)
      UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`))
      window order_sales_Q3_Col3_Q3_Col0_0s_2d_100 as (partition by `Q3_Col3` order by `Q3_Col0` range between interval '2' day preceding and current row)
    ) as order_sales_Q3_Col3_Q3_Col0_0s_2d_100
    natural join
    (
      select 1,
      avg(`Q3_Col54`) as order_sales_Q3_Col54_multi_avg_8,
      max(`Q3_Col56`) as order_sales_Q3_Col56_multi_max_45
      from ((select `Q3_Col32` as `Q3_Col0`, '' as `Q3_Col35`, '' as `Q3_Col36`, '' as `Q3_Col37Q3_Col37`, '' as `Q3_Col38`, '' as `Q3_Col39`, '' as `Q3_Col40`, '' as `Q3_Col41`, '' as `Q3_Col42`, '' as `Q3_Col2`, '' as `Q3_Col43`, '' as `Q3_Col44`, '' as `Q3_Col45`, CAST('2019-07-18 09:20:20' as timestamp) as `Q3_Col46`, CAST(0 as bigint) as `Q3_Col4`, CAST(0 as double) as `Q3_Col47`, CAST(0 as double) as `Q3_Col48`, `Q3_Col3` as `Q3_Col3`, '' as `Q3_Col49`, '' as `Q3_Col50Q3_Col50`, '' as `Q3_Col6`, '' as `Q3_Col51`, '' as `Q3_Col52`, CAST(0 as double) as `Q3_Col53`, CAST(0 as double) as `Q3_Col54`, CAST(0 as double) as `Q3_Col55`, CAST(0 as double) as `Q3_Col56`, '' as `Q3_Col57`, Q3_Col31 from `train`)
      UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`))
      window order_sales_Q3_Col3_Q3_Col0_0s_14d_100 as (partition by `Q3_Col3` order by `Q3_Col0` range between interval '14' day preceding and current row)
    ) as order_sales_Q3_Col3_Q3_Col0_0s_14d_100
    natural join
    (
      select 1,
      avg(`Q3_Col56`) as order_sales_Q3_Col56_multi_avg_10,
      avg(`Q3_Col55`) as order_sales_Q3_Col55_multi_avg_12
      from ((select `Q3_Col32` as `Q3_Col0`, '' as `Q3_Col35`, '' as `Q3_Col36`, '' as `Q3_Col37Q3_Col37`, '' as `Q3_Col38`, '' as `Q3_Col39`, '' as `Q3_Col40`, '' as `Q3_Col41`, '' as `Q3_Col42`, '' as `Q3_Col2`, '' as `Q3_Col43`, '' as `Q3_Col44`, '' as `Q3_Col45`, CAST('2019-07-18 09:20:20' as timestamp) as `Q3_Col46`, CAST(0 as bigint) as `Q3_Col4`, CAST(0 as double) as `Q3_Col47`, CAST(0 as double) as `Q3_Col48`, `Q3_Col3` as `Q3_Col3`, '' as `Q3_Col49`, '' as `Q3_Col50Q3_Col50`, '' as `Q3_Col6`, '' as `Q3_Col51`, '' as `Q3_Col52`, CAST(0 as double) as `Q3_Col53`, CAST(0 as double) as `Q3_Col54`, CAST(0 as double) as `Q3_Col55`, CAST(0 as double) as `Q3_Col56`, '' as `Q3_Col57`, Q3_Col31 from `train`)
      UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`))
      window order_sales_Q3_Col3_Q3_Col0_0s_5d_100 as (partition by `Q3_Col3` order by `Q3_Col0` range between interval '5' day preceding and current row)
    ) as order_sales_Q3_Col3_Q3_Col0_0s_5d_100
    natural join
    (
      select 1,
      min(`Q3_Col56`) as order_sales_Q3_Col56_multi_min_50,
      count(distinct `Q3_Col41`) as order_sales_Q3_Col41_multi_unique_count_84
      from ((select `Q3_Col32` as `Q3_Col0`, '' as `Q3_Col35`, '' as `Q3_Col36`, '' as `Q3_Col37Q3_Col37`, '' as `Q3_Col38`, '' as `Q3_Col39`, '' as `Q3_Col40`, '' as `Q3_Col41`, '' as `Q3_Col42`, '' as `Q3_Col2`, '' as `Q3_Col43`, '' as `Q3_Col44`, '' as `Q3_Col45`, CAST('2019-07-18 09:20:20' as timestamp) as `Q3_Col46`, CAST(0 as bigint) as `Q3_Col4`, CAST(0 as double) as `Q3_Col47`, CAST(0 as double) as `Q3_Col48`, `Q3_Col3` as `Q3_Col3`, '' as `Q3_Col49`, '' as `Q3_Col50Q3_Col50`, '' as `Q3_Col6`, '' as `Q3_Col51`, '' as `Q3_Col52`, CAST(0 as double) as `Q3_Col53`, CAST(0 as double) as `Q3_Col54`, CAST(0 as double) as `Q3_Col55`, CAST(0 as double) as `Q3_Col56`, '' as `Q3_Col57`, Q3_Col31 from `train`)
      UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`))
      window order_sales_Q3_Col3_Q3_Col0_0s_64d_100 as (partition by `Q3_Col3` order by `Q3_Col0` range between interval '64' day preceding and current row)
    ) as order_sales_Q3_Col3_Q3_Col0_0s_64d_100
    natural join
    (
      select 1
      from ((select `Q3_Col32` as `Q3_Col0`, '' as `Q3_Col35`, '' as `Q3_Col36`, '' as `Q3_Col37Q3_Col37`, '' as `Q3_Col38`, '' as `Q3_Col39`, '' as `Q3_Col40`, '' as `Q3_Col41`, '' as `Q3_Col42`, '' as `Q3_Col2`, '' as `Q3_Col43`, '' as `Q3_Col44`, '' as `Q3_Col45`, CAST('2019-07-18 09:20:20' as timestamp) as `Q3_Col46`, CAST(0 as bigint) as `Q3_Col4`, CAST(0 as double) as `Q3_Col47`, CAST(0 as double) as `Q3_Col48`, `Q3_Col3` as `Q3_Col3`, '' as `Q3_Col49`, '' as `Q3_Col50Q3_Col50`, '' as `Q3_Col6`, '' as `Q3_Col51`, '' as `Q3_Col52`, CAST(0 as double) as `Q3_Col53`, CAST(0 as double) as `Q3_Col54`, CAST(0 as double) as `Q3_Col55`, CAST(0 as double) as `Q3_Col56`, '' as `Q3_Col57`, Q3_Col31 from `train`)
      UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`))
      window order_sales_Q3_Col3_Q3_Col0_0s_7d_100 as (partition by `Q3_Col3` order by `Q3_Col0` range between interval '7' day preceding and current row)
    ) as order_sales_Q3_Col3_Q3_Col0_0s_7d_100
) as out3 on out0.Q3_Col31_1 = out3.Q3_Col31_5