# Query Plan

Here we show the query of OpenMLDB for Q0-5 and the analysis.

## 1. Q0

You can see the detailed query from [here](https://github.com/decis-bench/febench/blob/main/OpenMLDB/fequery/Q0/Q0_deploy_benchmark.sql).

```
select *,  
train_dropoff_longitude_divide_11 / train_pickup_longitude_divide_11,
train_pickup_longitude_divide_12 / train_dropoff_longitude_divide_12,
train_pickup_latitude_divide_13 / train_dropoff_latitude_divide_13,
train_dropoff_latitude_divide_14 / train_pickup_latitude_divide_14,
train_pickup_longitude_multiply_15 * train_dropoff_latitude_multiply_15 * train_dropoff_longitude_multiply_15,
train_pickup_longitude_multiply_16 * train_dropoff_latitude_multiply_16,
train_pickup_longitude_multiply_17 * train_pickup_latitude_multiply_17 * train_dropoff_longitude_multiply_17,
train_pickup_longitude_multiply_18 * train_dropoff_longitude_multiply_18,
train_pickup_latitude_multiply_19 * train_dropoff_longitude_multiply_19
from
(select
`id` as id_1,
`pickup_datetime` as train_pickup_datetime_original_0,
`id` as train_id_original_1,
`trip_duration` as train_trip_duration_original_2,
`dropoff_datetime` as train_dropoff_datetime_original_3,
`dropoff_latitude` as train_dropoff_latitude_original_4,
`dropoff_longitude` as train_dropoff_longitude_original_5,
`passenger_count` as train_passenger_count_original_6,
`pickup_latitude` as train_pickup_latitude_original_7,
`pickup_longitude` as train_pickup_longitude_original_8,
`store_and_fwd_flag` as train_store_and_fwd_flag_original_9,
`vendor_id` as train_vendor_id_original_10,
`dropoff_longitude` as train_dropoff_longitude_divide_11,
`pickup_longitude` as train_pickup_longitude_divide_11,
`pickup_longitude` as train_pickup_longitude_divide_12,
`dropoff_longitude` as train_dropoff_longitude_divide_12,
`pickup_latitude` as train_pickup_latitude_divide_13,
`dropoff_latitude` as train_dropoff_latitude_divide_13,
`dropoff_latitude` as train_dropoff_latitude_divide_14,
`pickup_latitude` as train_pickup_latitude_divide_14,
`pickup_longitude` as train_pickup_longitude_multiply_15,
`dropoff_latitude` as train_dropoff_latitude_multiply_15,
`dropoff_longitude` as train_dropoff_longitude_multiply_15,
`pickup_longitude` as train_pickup_longitude_multiply_16,
`dropoff_latitude` as train_dropoff_latitude_multiply_16,
`pickup_longitude` as train_pickup_longitude_multiply_17,
`pickup_latitude` as train_pickup_latitude_multiply_17,
`dropoff_longitude` as train_dropoff_longitude_multiply_17,
`pickup_longitude` as train_pickup_longitude_multiply_18,
`dropoff_longitude` as train_dropoff_longitude_multiply_18,
`pickup_latitude` as train_pickup_latitude_multiply_19,
`dropoff_longitude` as train_dropoff_longitude_multiply_19,
hour(timestamp(`dropoff_datetime`)) as train_dropoff_datetime_hourofday_20,
hour(timestamp(`pickup_datetime`)) as train_pickup_datetime_hourofday_21,
case when !isnull(at(`store_and_fwd_flag`, 0)) over train_vendor_id_pickup_datetime_0s_1h_200 then count_where(`store_and_fwd_flag`, `store_and_fwd_flag` = at(`store_and_fwd_flag`, 0)) over train_vendor_id_pickup_datetime_0s_1h_200 else null end as train_store_and_fwd_flag_window_count_22,
sum(`pickup_latitude`) over train_vendor_id_pickup_datetime_0s_1h_200 as train_pickup_latitude_window_sum_23,
sum(`pickup_latitude`) over train_vendor_id_pickup_datetime_0s_2h_200 as train_pickup_latitude_window_sum_24,
sum(`dropoff_latitude`) over train_vendor_id_pickup_datetime_0s_1h_200 as train_dropoff_latitude_window_sum_25,
case when !isnull(at(`store_and_fwd_flag`, 0)) over train_vendor_id_pickup_datetime_0s_2h_200 then count_where(`store_and_fwd_flag`, `store_and_fwd_flag` = at(`store_and_fwd_flag`, 0)) over train_vendor_id_pickup_datetime_0s_2h_200 else null end as train_store_and_fwd_flag_window_count_26,
sum(`dropoff_latitude`) over train_vendor_id_pickup_datetime_0s_2h_200 as train_dropoff_latitude_window_sum_27
from 
`train`
window train_vendor_id_pickup_datetime_0s_1h_200 as (partition by `vendor_id` order by `pickup_datetime` rows_range between 1h open preceding and 0s preceding MAXSIZE 200),
train_vendor_id_pickup_datetime_0s_2h_200 as (partition by `vendor_id` order by `pickup_datetime` rows_range between 2h open preceding and 0s preceding MAXSIZE 200))
;
```

The features (output columns) in the query Q0 include three parts: (i) all the origin table columns (basic features);(ii) aggregation features separately from two time windows (e.g.,  distinct counts of "pickup\_latitude" in last 1/2 hour); (iii) aggregation features computed across different time windows (e.g., the division of the 1h/2h window features). Since there is only one base table, Q0 is limited to  fundamental RTFE operators (e.g., aggregations), and windows over the same table.

## 2. Q1

You can see the detailed query from [here](https://github.com/decis-bench/febench/blob/main/OpenMLDB/fequery/Q1/Q1_deploy_benchmark.sql).

```
select
`Id` as Id_1,
`Date` as train_Date_original_0,
`Id` as train_Id_original_1,
`ConfirmedCases` as train_ConfirmedCases_original_2,
`Country_Region` as train_Country_Region_original_3,
`Fatalities` as train_Fatalities_original_4,
`Province_State` as train_Province_State_original_5,
log(`Fatalities`) as train_Fatalities_log_6,
min(`Fatalities`) over train_Province_State_Date_0s_2d_200 as train_Fatalities_window_min_7,
min(`Fatalities`) over train_Province_State_Date_0s_7d_200 as train_Fatalities_window_min_8,
`Province_State`,
`Country_Region`,
concat(Province_State, Country_Region) as train_combine_9,
min(`Fatalities`) over train_Country_Region_Date_0s_2d_100 as train_Fatalities_window_min_10,
min(`Fatalities`) over train_Country_Region_Date_0s_5d_200 as train_Fatalities_window_min_11,
avg(`Fatalities`) over train_Province_State_Date_0s_2d_200 as train_Fatalities_window_avg_12,
avg(`Fatalities`) over train_Province_State_Date_0s_5d_200 as train_Fatalities_window_avg_13,
sum(`Fatalities`) over train_Province_State_Date_0s_7d_100 as train_Fatalities_window_sum_14,
avg(`Fatalities`) over train_Country_Region_Date_0s_2d_100 as train_Fatalities_window_avg_15,
max(`Fatalities`) over train_Country_Region_Date_0s_5d_200 as train_Fatalities_window_max_16,
max(`Fatalities`) over train_Country_Region_Date_0s_14d_200 as train_Fatalities_window_max_17,
avg(`Fatalities`) over train_Country_Region_Date_0_10_ as train_Fatalities_window_avg_18,
top1_ratio(`Province_State`) over train_Country_Region_Date_0_10_ as train_Province_State_window_top1_ratio_19,
case when !isnull(at(`Country_Region`, 0)) over train_Province_State_Date_0s_14d_100 then count_where(`Country_Region`, `Country_Region` = at(`Country_Region`, 0)) over train_Province_State_Date_0s_14d_100 else null end as train_Country_Region_window_count_20,
case when !isnull(at(`Country_Region`, 0)) over train_Province_State_Date_0s_64d_100 then count_where(`Country_Region`, `Country_Region` = at(`Country_Region`, 0)) over train_Province_State_Date_0s_64d_100 else null end as train_Country_Region_window_count_21,
dayofweek(timestamp(`Date`)) as train_Date_dayofweek_22,
case when 1 < dayofweek(timestamp(`Date`)) and dayofweek(timestamp(`Date`)) < 7 then 1 else 0 end as train_Date_isweekday_23
from
`train`
window train_Province_State_Date_0s_2d_200 as (partition by `Province_State` order by `Date` rows_range between 2d open preceding and 0s preceding MAXSIZE 200),
train_Province_State_Date_0s_7d_200 as (partition by `Province_State` order by `Date` rows_range between 7d open preceding and 0s preceding MAXSIZE 200),
train_Country_Region_Date_0s_2d_100 as (partition by `Country_Region` order by `Date` rows_range between 2d open preceding and 0s preceding MAXSIZE 100),
train_Country_Region_Date_0s_5d_200 as (partition by `Country_Region` order by `Date` rows_range between 5d open preceding and 0s preceding MAXSIZE 200),
train_Province_State_Date_0s_5d_200 as (partition by `Province_State` order by `Date` rows_range between 5d open preceding and 0s preceding MAXSIZE 200),
train_Province_State_Date_0s_7d_100 as (partition by `Province_State` order by `Date` rows_range between 7d open preceding and 0s preceding MAXSIZE 100),
train_Country_Region_Date_0s_14d_200 as (partition by `Country_Region` order by `Date` rows_range between 14d open preceding and 0s preceding MAXSIZE 200),
train_Country_Region_Date_0_10_ as (partition by `Country_Region` order by `Date` rows between 10 open preceding and 0 preceding),
train_Province_State_Date_0s_14d_100 as (partition by `Province_State` order by `Date` rows_range between 14d open preceding and 0s preceding MAXSIZE 100),
train_Province_State_Date_0s_64d_100 as (partition by `Province_State` order by `Date` rows_range between 64d open preceding and 0s preceding MAXSIZE 100)
;
```

First, different from Q0, the query Q1 involves more window operators. The reason is that Q1 contains much fewer basic features (6 table columns) and it is vital to derive effective new features to support accurate forecast. Second, Q1 involves 10 different sizes of time windows. The query plan is more complicated than Q0.

## 3. Q2

You can see the detailed query from [here](https://github.com/decis-bench/febench/blob/main/OpenMLDB/fequery/Q2/Q2_deploy_benchmark.sql).

```
select * from 
(
select
`date` as date_1,
`date` as train_date_original_0,
`wp7` as train_wp7_original_2,
`wp1` as train_wp1_original_32,
`wp2` as train_wp2_original_33,
`wp3` as train_wp3_original_34,
`wp4` as train_wp4_original_35,
`wp5` as train_wp5_original_36,
`wp6` as train_wp6_original_37,
log(`wp6`) as train_wp6_log_38,
log(`wp3`) as train_wp3_log_39,
dayofweek(timestamp(`date`)) as train_date_dayofweek_40,
hour(timestamp(`date`)) as train_date_hourofday_41,
case when 1 < dayofweek(timestamp(`date`)) and dayofweek(timestamp(`date`)) < 7 then 1 else 0 end as train_date_isweekday_42,
log(`wp2`) as train_wp2_log_43
from
`train`
)
as out0
last join
(
select
`train`.`date` as date_3,
`windforecasts_wf1_date`.`hors` as windforecasts_wf1_hors_multi_direct_3,
`windforecasts_wf1_date`.`u` as windforecasts_wf1_u_multi_direct_4,
`windforecasts_wf1_date`.`v` as windforecasts_wf1_v_multi_direct_5,
`windforecasts_wf1_date`.`wd` as windforecasts_wf1_wd_multi_direct_6,
`windforecasts_wf1_date`.`ws` as windforecasts_wf1_ws_multi_direct_7,
`windforecasts_wf2_date`.`u` as windforecasts_wf2_u_multi_direct_8,
`windforecasts_wf2_date`.`v` as windforecasts_wf2_v_multi_direct_9,
`windforecasts_wf2_date`.`wd` as windforecasts_wf2_wd_multi_direct_10,
`windforecasts_wf2_date`.`ws` as windforecasts_wf2_ws_multi_direct_11,
`windforecasts_wf3_date`.`u` as windforecasts_wf3_u_multi_direct_12,
`windforecasts_wf3_date`.`v` as windforecasts_wf3_v_multi_direct_13,
`windforecasts_wf3_date`.`wd` as windforecasts_wf3_wd_multi_direct_14,
`windforecasts_wf3_date`.`ws` as windforecasts_wf3_ws_multi_direct_15,
`windforecasts_wf4_date`.`u` as windforecasts_wf4_u_multi_direct_16,
`windforecasts_wf4_date`.`v` as windforecasts_wf4_v_multi_direct_17,
`windforecasts_wf4_date`.`wd` as windforecasts_wf4_wd_multi_direct_18,
`windforecasts_wf4_date`.`ws` as windforecasts_wf4_ws_multi_direct_19,
`windforecasts_wf5_date`.`u` as windforecasts_wf5_u_multi_direct_20,
`windforecasts_wf5_date`.`v` as windforecasts_wf5_v_multi_direct_21,
`windforecasts_wf5_date`.`wd` as windforecasts_wf5_wd_multi_direct_22,
`windforecasts_wf5_date`.`ws` as windforecasts_wf5_ws_multi_direct_23,
`windforecasts_wf6_date`.`u` as windforecasts_wf6_u_multi_direct_24,
`windforecasts_wf6_date`.`v` as windforecasts_wf6_v_multi_direct_25,
`windforecasts_wf6_date`.`wd` as windforecasts_wf6_wd_multi_direct_26,
`windforecasts_wf6_date`.`ws` as windforecasts_wf6_ws_multi_direct_27,
`windforecasts_wf7_date`.`u` as windforecasts_wf7_u_multi_direct_28,
`windforecasts_wf7_date`.`v` as windforecasts_wf7_v_multi_direct_29,
`windforecasts_wf7_date`.`wd` as windforecasts_wf7_wd_multi_direct_30,
`windforecasts_wf7_date`.`ws` as windforecasts_wf7_ws_multi_direct_31
from
`train`
last join `windforecasts_wf1` as `windforecasts_wf1_date` on `train`.`date` = `windforecasts_wf1_date`.`date`
last join `windforecasts_wf2` as `windforecasts_wf2_date` on `train`.`date` = `windforecasts_wf2_date`.`date`
last join `windforecasts_wf3` as `windforecasts_wf3_date` on `train`.`date` = `windforecasts_wf3_date`.`date`
last join `windforecasts_wf4` as `windforecasts_wf4_date` on `train`.`date` = `windforecasts_wf4_date`.`date`
last join `windforecasts_wf5` as `windforecasts_wf5_date` on `train`.`date` = `windforecasts_wf5_date`.`date`
last join `windforecasts_wf6` as `windforecasts_wf6_date` on `train`.`date` = `windforecasts_wf6_date`.`date`
last join `windforecasts_wf7` as `windforecasts_wf7_date` on `train`.`date` = `windforecasts_wf7_date`.`date`)
as out1
on out0.date_1 = out1.date_3
;
```

In the query Q2, joint features are computed from multiple tables (e.g., features of nearby farms and recent hours) by conducting the last join operator on 7 farm tables and 1 training table, providing a useful test for online one-to-one joining performance. Interestingly, Q2 mainly extracts temporal features (e.g., the last distinct values of timestamp features), which is different from other queries that involve a large number of aggregations on numeric columns. Note that Q2 does not contain time windows, so all the historical tuples could contribute to the feature computation with incoming tuples, which is markedly different from traditional stream cases.

## 4. Q3

You can see the detailed query from [here](https://github.com/decis-bench/febench/blob/main/OpenMLDB/fequery/Q3/Q3_deploy_benchmark.sql).

```
select 
... --117 features
from 
(
select
... --9 basic features
case when !isnull(at(`Q3_Col34`, 0)) over flatten_request_Q3_Col3_Q3_Col32_0s_7d_100 then count_where(`Q3_Col34`, `Q3_Col34` = at(`Q3_Col34`, 0)) over flatten_request_Q3_Col3_Q3_Col32_0s_7d_100 else null end as flatten_request_Q3_Col34_window_count_98
from
`train`
window flatten_request_Q3_Col3_Q3_Col32_0s_7d_100 as (partition by `Q3_Col3` order by `Q3_Col32` rows_range between 7d preceding and 0s preceding MAXSIZE 100))
as out0
last join
(
select
... --32 basic features
from
`train`
last join `feedback` as `feedback_Q3_Col31` on `train`.`Q3_Col31` = `feedback_Q3_Col31`.`Q3_Col31`
last join `product_sku` as `product_Q3_Col3_Q3_Col3` on `train`.`Q3_Col3` = `product_Q3_Col3_Q3_Col3`.`Q3_Col3`
last join `product_item` as `product_item_Q3_Col6__Q3_Col32_0s_1d` order by product_item_Q3_Col6__Q3_Col32_0s_1d.`Q3_Col0` on `train`.`Q3_Col6` = `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col6` and `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col0` < `train`.`Q3_Col32` - 0 and `product_item_Q3_Col6__Q3_Col32_0s_1d`.`Q3_Col0` > `train`.`Q3_Col32` - 86400000
last join `shipping_sku` as `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d` order by shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d.`Q3_Col0` on `train`.`Q3_Col3` = `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d`.`Q3_Col3` and `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d`.`Q3_Col0` < `train`.`Q3_Col32` - 0 and `shipping_Q3_Col3_Q3_Col3__Q3_Col32_0s_1d`.`Q3_Col0` > `train`.`Q3_Col32` - 86400000)
as out1
on out0.Q3_Col31_1 = out1.Q3_Col31_3
last join
(
select
`Q3_Col31` as Q3_Col31_4,
avg(`Q3_Col4`) over order_cancel_return_Q3_Col3_Q3_Col0_0s_64d_100 as order_cancel_return_Q3_Col4_multi_avg_3
from
(select `Q3_Col32` as `Q3_Col0`, timestamp('2019-07-18 09:20:20') as `Q3_Col1`, '' as `Q3_Col2`, `Q3_Col3` as `Q3_Col3`, int(0) as `Q3_Col4`, '' as `Q3_Col5`, Q3_Col31 from `train`)
window order_cancel_return_Q3_Col3_Q3_Col0_0s_64d_100 as (
UNION (select `Q3_Col0`, `Q3_Col1`, `Q3_Col2`, `Q3_Col3`, `Q3_Col4`, `Q3_Col5`, '' as Q3_Col31 from `order_cancel_return`) partition by `Q3_Col3` order by `Q3_Col0` rows_range between 64d preceding and 0s preceding MAXSIZE 100 INSTANCE_NOT_IN_WINDOW))
as out2
on out0.Q3_Col31_1 = out2.Q3_Col31_4
last join
(
select
`Q3_Col31` as Q3_Col31_5,
... --58 aggregation features
from
(select `Q3_Col32` as `Q3_Col0`, '' as `Q3_Col35`, '' as `Q3_Col36`, '' as `Q3_Col37`, '' as `Q3_Col38`, '' as `Q3_Col39`, '' as `Q3_Col40`, '' as `Q3_Col41`, '' as `Q3_Col42`, '' as `Q3_Col2`, '' as `Q3_Col43`, '' as `Q3_Col44`, '' as `Q3_Col45`, timestamp('2019-07-18 09:20:20') as `Q3_Col46`, bigint(0) as `Q3_Col4`, double(0) as `Q3_Col47`, double(0) as `Q3_Col48`, `Q3_Col3` as `Q3_Col3`, '' as `Q3_Col49`, '' as `Q3_Col50`, '' as `Q3_Col6`, '' as `Q3_Col51`, '' as `Q3_Col52`, double(0) as `Q3_Col53`, double(0) as `Q3_Col54`, double(0) as `Q3_Col55`, double(0) as `Q3_Col56`, '' as `Q3_Col57`, Q3_Col31 from `train`)
window order_sales_Q3_Col3_Q3_Col0_0s_10h_100 as (
UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`) partition by `Q3_Col3` order by `Q3_Col0` rows_range between 10h preceding and 0s preceding MAXSIZE 100 INSTANCE_NOT_IN_WINDOW),
order_sales_Q3_Col3_Q3_Col0_0s_2d_100 as (
UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`) partition by `Q3_Col3` order by `Q3_Col0` rows_range between 2d preceding and 0s preceding MAXSIZE 100 INSTANCE_NOT_IN_WINDOW),
order_sales_Q3_Col3_Q3_Col0_0s_14d_100 as (
UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`) partition by `Q3_Col3` order by `Q3_Col0` rows_range between 14d preceding and 0s preceding MAXSIZE 100 INSTANCE_NOT_IN_WINDOW),
order_sales_Q3_Col3_Q3_Col0_0s_5d_100 as (
UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`) partition by `Q3_Col3` order by `Q3_Col0` rows_range between 5d preceding and 0s preceding MAXSIZE 100 INSTANCE_NOT_IN_WINDOW),
order_sales_Q3_Col3_Q3_Col0_0s_64d_100 as (
UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`) partition by `Q3_Col3` order by `Q3_Col0` rows_range between 64d preceding and 0s preceding MAXSIZE 100 INSTANCE_NOT_IN_WINDOW),
order_sales_Q3_Col3_Q3_Col0_0s_7d_100 as (
UNION (select `Q3_Col0`, `Q3_Col35`, `Q3_Col36`, `Q3_Col37`, `Q3_Col38`, `Q3_Col39`, `Q3_Col40`, `Q3_Col41`, `Q3_Col42`, `Q3_Col2`, `Q3_Col43`, `Q3_Col44`, `Q3_Col45`, `Q3_Col46`, `Q3_Col4`, `Q3_Col47`, `Q3_Col48`, `Q3_Col3`, `Q3_Col49`, `Q3_Col50`, `Q3_Col6`, `Q3_Col51`, `Q3_Col52`, `Q3_Col53`, `Q3_Col54`, `Q3_Col55`, `Q3_Col56`, `Q3_Col57`, '' as Q3_Col31 from `order_sales`) partition by `Q3_Col3` order by `Q3_Col0` rows_range between 7d preceding and 0s preceding MAXSIZE 100 INSTANCE_NOT_IN_WINDOW))
as out3
on out0.Q3_Col31_1 = out3.Q3_Col31_5
;
```

For the query Q3, it involves 113 RTFE operators and 15GB batch data, most of which are aggregations over joined window tables. Besides, different from above templates (Q0−Q2), (i) Q3 performs set conjunction operators (e.g., unions) over two data streams, since multiple tables in Q3 have some of the same feature columns; (ii) 𝑄3 has up to 6-level subqueries that include both the whole tables (e.g., all tuples in ’product_item’) and tables over time windows (e.g., sales within a 10-hour period). These types of subqueries can be costly to process due to the large amount of data involved and the computational overhead required for aggregating data over different time windows. Thus, 𝑄3 is useful to test the performance of complex subquery processing.

## 5. Q4

You can see the detailed query from [here](https://github.com/decis-bench/febench/blob/main/OpenMLDB/fequery/Q4/Q4_deploy_benchmark.sql).

```
select 
... --263 features
from 
(
-- train
select
... --134 basic features and 1 aggregation feature
from
`train`
window flattenRequest_Q4_Col78_Q4_Col41_0s_10h_100 as (partition by `Q4_Col78` order by `Q4_Col41` rows_range between 10h preceding and 0s preceding MAXSIZE 100))
as out0
last join
(
select
`train`.`Q4_Col40` as Q4_Col40_3,
`action_Q4_Col40`.`Q4_Col42` as action_Q4_Col42_multi_direct_2
from
`train`
last join `action` as `action_Q4_Col40` on `train`.`Q4_Col40` = `action_Q4_Col40`.`Q4_Col40`)
as out1
on out0.Q4_Col40_1 = out1.Q4_Col40_3
last join
(
select
`Q4_Col2` as Q4_Col40_4,
... --14 aggregation features
from
(select `Q4_Col41` as `Q4_Col0`, bigint(0) as `Q4_Col1`, `Q4_Col40` as `Q4_Col2`, bigint(0) as `Q4_Col3`, double(0) as `Q4_Col199`, double(0) as `Q4_Col200`, '' as `Q4_Col21`, bigint(0) as `Q4_Col22`, bigint(0) as `Q4_Col23` from `train`)
window bo_POS_CASH_balance_Q4_Col2_Q4_Col0_0_100_ as (
UNION `bo_POS_CASH_balance` partition by `Q4_Col2` order by `Q4_Col0` rows between 100 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW),
bo_POS_CASH_balance_Q4_Col2_Q4_Col0_0_10_ as (
UNION `bo_POS_CASH_balance` partition by `Q4_Col2` order by `Q4_Col0` rows between 10 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW))
as out2
on out0.Q4_Col40_1 = out2.Q4_Col40_4
last join
(
select
`Q4_Col2` as Q4_Col40_7,
... --61 aggregation features
from
(select `Q4_Col41` as `Q4_Col0`, `Q4_Col40` as `Q4_Col2`, bigint(0) as `Q4_Col24`, '' as `Q4_Col25`, '' as `Q4_Col26`, bigint(0) as `Q4_Col27`, bigint(0) as `Q4_Col28`, double(0) as `Q4_Col29`, double(0) as `Q4_Col30`, double(0) as `Q4_Col31`, bigint(0) as `Q4_Col32`, double(0) as `Q4_Col33`, double(0) as `Q4_Col34`, double(0) as `Q4_Col35`, double(0) as `Q4_Col36`, '' as `Q4_Col37`, bigint(0) as `Q4_Col38`, double(0) as `Q4_Col39` from `train`)
window bo_bureau_Q4_Col2_Q4_Col0_0_100_ as (
UNION `bo_bureau` partition by `Q4_Col2` order by `Q4_Col0` rows between 100 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW),
bo_bureau_Q4_Col2_Q4_Col0_0_10_ as (
UNION `bo_bureau` partition by `Q4_Col2` order by `Q4_Col0` rows between 10 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW))
as out3
on out0.Q4_Col40_1 = out3.Q4_Col40_7
last join
(
select
`Q4_Col2` as Q4_Col40_11,
... --13 aggregation features
from
(select `Q4_Col41` as `Q4_Col0`, bigint(0) as `Q4_Col1`, `Q4_Col40` as `Q4_Col2`, double(0) as `Q4_Col193`, bigint(0) as `Q4_Col194`, double(0) as `Q4_Col195`, double(0) as `Q4_Col196`, double(0) as `Q4_Col197`, double(0) as `Q4_Col198` from `train`)
window bo_installment_payment_Q4_Col2_Q4_Col0_0_10_ as (
UNION `bo_installment_payment` partition by `Q4_Col2` order by `Q4_Col0` rows between 10 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW),
bo_installment_payment_Q4_Col2_Q4_Col0_0_100_ as (
UNION `bo_installment_payment` partition by `Q4_Col2` order by `Q4_Col0` rows between 100 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW))
as out4
on out0.Q4_Col40_1 = out4.Q4_Col40_11
last join
(
select
`Q4_Col40` as Q4_Col40_14,
... --7 aggregation features
from
(select `Q4_Col41` as `Q4_Col0`, `Q4_Col77` as `Q4_Col77`, `Q4_Col78` as `Q4_Col78`, `Q4_Col79` as `Q4_Col79`, `Q4_Col80` as `Q4_Col80`, `Q4_Col81` as `Q4_Col81`, double(0) as `Q4_Col82`, double(0) as `Q4_Col83`, double(0) as `Q4_Col84`, double(0) as `Q4_Col85`, double(0) as `Q4_Col45`, double(0) as `Q4_Col39`, double(0) as `Q4_Col47`, double(0) as `Q4_Col86`, double(0) as `Q4_Col87`, Q4_Col40 from `train`)
window bo_part_Q4_Col77_Q4_Col78_Q4_Col79_Q4_Col80_Q4_Col81_Q4_Col0_0_10_ as (
UNION (select `Q4_Col0`, `Q4_Col77`, `Q4_Col78`, `Q4_Col79`, `Q4_Col80`, `Q4_Col81`, `Q4_Col82`, `Q4_Col83`, `Q4_Col84`, `Q4_Col85`, `Q4_Col45`, `Q4_Col39`, `Q4_Col47`, `Q4_Col86`, `Q4_Col87`, '' as Q4_Col40 from `bo_part`) partition by `Q4_Col77`,`Q4_Col78`,`Q4_Col79`,`Q4_Col80`,`Q4_Col81` order by `Q4_Col0` rows between 10 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW))
as out5
on out0.Q4_Col40_1 = out5.Q4_Col40_14
last join
(
select
`Q4_Col2` as Q4_Col40_18,
... --43 aggregation features
from
(select `Q4_Col41` as `Q4_Col0`, bigint(0) as `Q4_Col1`, `Q4_Col40` as `Q4_Col2`, '' as `Q4_Col43`, double(0) as `Q4_Col39`, double(0) as `Q4_Col44`, double(0) as `Q4_Col45`, double(0) as `Q4_Col46`, double(0) as `Q4_Col47`, '' as `Q4_Col48`, bigint(0) as `Q4_Col49`, '' as `Q4_Col50`, bigint(0) as `Q4_Col51`, double(0) as `Q4_Col52`, double(0) as `Q4_Col53`, double(0) as `Q4_Col54`, '' as `Q4_Col55`, '' as `Q4_Col21`, bigint(0) as `Q4_Col56`, '' as `Q4_Col57`, '' as `Q4_Col58`, '' as `Q4_Col59`, '' as `Q4_Col60`, '' as `Q4_Col61`, '' as `Q4_Col62`, '' as `Q4_Col63`, '' as `Q4_Col64`, bigint(0) as `Q4_Col65`, '' as `Q4_Col66`, double(0) as `Q4_Col67`, '' as `Q4_Col68`, '' as `Q4_Col69`, double(0) as `Q4_Col70`, double(0) as `Q4_Col71`, double(0) as `Q4_Col72`, double(0) as `Q4_Col73`, double(0) as `Q4_Col74`, double(0) as `Q4_Col75` from `train`)
window bo_previous_applicatio_Q4_Col2_Q4_Col0_0_10_ as (
UNION `bo_previous_applicatio` partition by `Q4_Col2` order by `Q4_Col0` rows between 10 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW),
bo_previous_applicatio_Q4_Col2_Q4_Col0_0_100_ as (
UNION `bo_previous_applicatio` partition by `Q4_Col2` order by `Q4_Col0` rows between 100 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW))
as out6
on out0.Q4_Col40_1 = out6.Q4_Col40_18
last join
(
select
`Q4_Col2` as Q4_Col40_67,
topn_frequency(`Q4_Col3`, 3) over bo_bureau_balance_Q4_Col2_Q4_Col0_0_10_ as bo_bureau_balance_Q4_Col3_multi_top3frequency_66
from
(select `Q4_Col41` as `Q4_Col0`, bigint(0) as `Q4_Col24`, bigint(0) as `Q4_Col3`, '' as `Q4_Col76`, `Q4_Col40` as `Q4_Col2` from `train`)
window bo_bureau_balance_Q4_Col2_Q4_Col0_0_10_ as (
UNION `bo_bureau_balance` partition by `Q4_Col2` order by `Q4_Col0` rows between 10 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW))
as out7
on out0.Q4_Col40_1 = out7.Q4_Col40_67
last join
(
select
`Q4_Col2` as Q4_Col40_86,
... --6 aggregation features
from
(select `Q4_Col41` as `Q4_Col0`, bigint(0) as `Q4_Col1`, `Q4_Col40` as `Q4_Col2`, bigint(0) as `Q4_Col3`, double(0) as `Q4_Col4`, bigint(0) as `Q4_Col5`, double(0) as `Q4_Col6`, double(0) as `Q4_Col7`, double(0) as `Q4_Col8`, double(0) as `Q4_Col9`, double(0) as `Q4_Col10`, double(0) as `Q4_Col11`, double(0) as `Q4_Col12`, double(0) as `Q4_Col13`, double(0) as `Q4_Col14`, double(0) as `Q4_Col15`, double(0) as `Q4_Col16`, bigint(0) as `Q4_Col17`, double(0) as `Q4_Col18`, double(0) as `Q4_Col19`, double(0) as `Q4_Col20`, '' as `Q4_Col21`, bigint(0) as `Q4_Col22`, bigint(0) as `Q4_Col23` from `train`)
window bo_credit_card_balance_Q4_Col2_Q4_Col0_0_10_ as (
UNION `bo_credit_card_balance` partition by `Q4_Col2` order by `Q4_Col0` rows between 10 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW),
bo_credit_card_balance_Q4_Col2_Q4_Col0_0_100_ as (
UNION `bo_credit_card_balance` partition by `Q4_Col2` order by `Q4_Col0` rows between 100 preceding and 0 preceding INSTANCE_NOT_IN_WINDOW))
as out8
on out0.Q4_Col40_1 = out8.Q4_Col40_86
;
```

The task aims to predict whether customers will pay back their loans on time for a credit card company. In the query Q4, it involves 110 features from the origin tables and 122 aggregations. Since it needs to characterize the customer behaviors, there are multiple window-count operators to reflect the recent activities of the customers. Besides, it has 17 subqueries, which involve origin tables, single-table windows, or multi-table windows. Thus, Q4 is a bit more complex than Q3 in the operator patterns, and the relatively large intermediate table sizes in Q4 can significantly affect the processing efficiency.

## 6. Q5

You can see the detailed query from [here](https://github.com/decis-bench/febench/blob/main/OpenMLDB/fequery/Q5/Q5_deploy_benchmark.sql).

```
select  
... --661 features
from 
(
select
... --5 basic features
from
`train`
)
as out0
last join
(
select
.. --638 basic features
from
`train`
last join `feedback` as `b9feedback_Q5_Col100` on `train`.`Q5_Col100` = `b9feedback_Q5_Col100`.`Q5_Col100`
last join `CUST_f7` as `b1CUST_f7_Q5_Col0` on `train`.`Q5_Col0` = `b1CUST_f7_Q5_Col0`.`Q5_Col0`
last join `sag_efs_tbproduct_F_b` as `b2sag_efs_tbp_F_b_Q5_Col102_eT_0_2147483645` order by b2sag_efs_tbp_F_b_Q5_Col102_eT_0_2147483645.`Q5_Col1` on `train`.`Q5_Col102` = `b2sag_efs_tbp_F_b_Q5_Col102_eT_0_2147483645`.`Q5_Col102` and `train`.`Q5_Col101` < `b2sag_efs_tbp_F_b_Q5_Col102_eT_0_2147483645`.`Q5_Col1`
last join `LINK2_f6` as `b10LINK2_f6_Q5_Col0_eT_0_2147483645` order by b10LINK2_f6_Q5_Col0_eT_0_2147483645.`Q5_Col1` on `train`.`Q5_Col0` = `b10LINK2_f6_Q5_Col0_eT_0_2147483645`.`Q5_Col0` and `train`.`Q5_Col101` < `b10LINK2_f6_Q5_Col0_eT_0_2147483645`.`Q5_Col1`
last join `LINK1_f5` as `b11LINK1_f5_Q5_Col0_eT_0_2147483645` order by b11LINK1_f5_Q5_Col0_eT_0_2147483645.`Q5_Col1` on `train`.`Q5_Col0` = `b11LINK1_f5_Q5_Col0_eT_0_2147483645`.`Q5_Col0` and `train`.`Q5_Col101` < `b11LINK1_f5_Q5_Col0_eT_0_2147483645`.`Q5_Col1`
last join `AUM_f4` as `b12AUM_f4_Q5_Col0_eT_0_2147483645` order by b12AUM_f4_Q5_Col0_eT_0_2147483645.`Q5_Col1` on `train`.`Q5_Col0` = `b12AUM_f4_Q5_Col0_eT_0_2147483645`.`Q5_Col0` and `train`.`Q5_Col101` < `b12AUM_f4_Q5_Col0_eT_0_2147483645`.`Q5_Col1`
last join `debit3_f3` as `b4debit3_f3_Q5_Col0_eT_0_2147483645` order by b4debit3_f3_Q5_Col0_eT_0_2147483645.`Q5_Col1` on `train`.`Q5_Col0` = `b4debit3_f3_Q5_Col0_eT_0_2147483645`.`Q5_Col0` and `train`.`Q5_Col101` < `b4debit3_f3_Q5_Col0_eT_0_2147483645`.`Q5_Col1`
last join `debit2_f2` as `b6debit2_f2_Q5_Col0_eT_0_2147483645` order by b6debit2_f2_Q5_Col0_eT_0_2147483645.`Q5_Col1` on `train`.`Q5_Col0` = `b6debit2_f2_Q5_Col0_eT_0_2147483645`.`Q5_Col0` and `train`.`Q5_Col101` < `b6debit2_f2_Q5_Col0_eT_0_2147483645`.`Q5_Col1`
last join `debit1_f1` as `b8debit1_f1_Q5_Col0_eT_0_2147483645` order by b8debit1_f1_Q5_Col0_eT_0_2147483645.`Q5_Col1` on `train`.`Q5_Col0` = `b8debit1_f1_Q5_Col0_eT_0_2147483645`.`Q5_Col0` and `train`.`Q5_Col101` < `b8debit1_f1_Q5_Col0_eT_0_2147483645`.`Q5_Col1`)
as out1
on out0.Q5_Col100_1 = out1.Q5_Col100_3
;
```

Fraud detection is a special type of the outlier detection problems, which aims to estimate the likelihood of fraudulent activities within milliseconds. Here we consider a fraud detection case in banking scenario. The temporal data was inserted periodically, with peak values around 8,000 in each cycle. The query Q5 contains the most query operators among the 6 query templates, incorporating 659 RTFE operators, most of which are multi\_last\_value directly derived from the results of multi-table joins. Similar to Q2, the query of Q5 does not involve time windows, which leverages the entire dataset (all past user behaviors) to compute features for incoming tuples