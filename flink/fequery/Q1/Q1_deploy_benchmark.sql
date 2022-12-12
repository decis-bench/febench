WITH
train_Province_State_Date_0s_2d_200 AS (
    SELECT 1 Id,
    min(Fatalities) as train_Fatalities_window_min_7,
    avg(Fatalities) as train_Fatalities_window_avg_12
    FROM train
    window train_Province_State_Date_0s_2d_200 as (partition by Province_State order by DateDate range between interval '2' day preceding and current row)
),
train_Province_State_Date_0s_7d_200 AS (
    SELECT 1 Id,
    min(Fatalities) as train_Fatalities_window_min_8
    FROM train
    window train_Province_State_Date_0s_7d_200 as (partition by Province_State order by DateDate range between interval '7' day preceding and current row)
),
train_Country_Region_Date_0s_2d_100 AS (
    SELECT 1 Id,
    min(Fatalities) as train_Fatalities_window_min_10,
    avg(Fatalities) as train_Fatalities_window_avg_15
    FROM train
    window train_Country_Region_Date_0s_2d_100 as (partition by Country_Region order by DateDate range between interval '2' day preceding and current row)
),
train_Country_Region_Date_0s_5d_200 AS (
    SELECT 1 Id,
    min(Fatalities) as train_Fatalities_window_min_11,
    max(Fatalities) as train_Fatalities_window_max_16
    FROM train
    window train_Country_Region_Date_0s_5d_200 as (partition by Country_Region order by DateDate range between interval '5' day preceding and current row)
),
train_Province_State_Date_0s_5d_200 AS (
    SELECT 1 Id,
    avg(Fatalities) as train_Fatalities_window_avg_13
    FROM train
    window train_Province_State_Date_0s_5d_200 as (partition by Province_State order by DateDate range between interval '5' day preceding and current row)
),
train_Province_State_Date_0s_7d_100 AS (
    SELECT 1 Id,
    sum(Fatalities) as train_Fatalities_window_sum_14
    FROM train
    window train_Province_State_Date_0s_7d_100 as (partition by Province_State order by DateDate range between interval '7' day preceding and current row)
),
train_Country_Region_Date_0s_14d_200 AS (
    SELECT 1 Id,
    max(Fatalities) as train_Fatalities_window_max_17
    FROM train
    window train_Country_Region_Date_0s_14d_200 as (partition by Country_Region order by DateDate range between interval '14' day preceding and current row)
),
train_Country_Region_Date_0_10_ AS (
    SELECT 1 Id,
    avg(Fatalities) as train_Fatalities_window_avg_18
    FROM train
    window train_Country_Region_Date_0_10_ as (partition by Country_Region order by DateDate rows between 10 preceding and current row)
),
train_Province_State_Date_0s_14d_100 AS (
    SELECT 1 Id
    FROM train
    window train_Province_State_Date_0s_14d_100 as (partition by Province_State order by DateDate range between interval '14' day preceding and current row)
),
train_Province_State_Date_0s_64d_100 AS (
    SELECT 1 Id
    FROM train
    window train_Province_State_Date_0s_64d_100 as (partition by Province_State order by DateDate range between interval '64' day preceding and current row)
)
SELECT train_Date_original_0 
FROM
(
SELECT 1 Id,
    train.DateDate as train_Date_original_0,
    train.Id as train_Id_original_1,
    train.ConfirmedCases as train_ConfirmedCases_original_2,
    train.Country_Region as train_Country_Region_original_3,
    train.Fatalities as train_Fatalities_original_4,
    train.Province_State as train_Province_State_original_5,
    log(train.Fatalities) as train_Fatalities_log_6,
    train_Province_State_Date_0s_2d_200.train_Fatalities_window_min_7 as train_Fatalities_window_min_7,
    train_Province_State_Date_0s_7d_200.train_Fatalities_window_min_8 as train_Fatalities_window_min_8,
    concat(train.Province_State, train.Country_Region) as train_Province_State_Country_Region_9,
    train_Country_Region_Date_0s_2d_100.train_Fatalities_window_min_10 as train_Fatalities_window_min_10,
    train_Country_Region_Date_0s_5d_200.train_Fatalities_window_min_11 as train_Fatalities_window_min_11,
    train_Province_State_Date_0s_2d_200.train_Fatalities_window_avg_12 as train_Fatalities_window_avg_12,
    train_Province_State_Date_0s_5d_200.train_Fatalities_window_avg_13 as train_Fatalities_window_avg_13,
    train_Province_State_Date_0s_7d_100.train_Fatalities_window_sum_14 as train_Fatalities_window_sum_14,
    train_Country_Region_Date_0s_2d_100.train_Fatalities_window_avg_15 as train_Fatalities_window_avg_15,
    train_Country_Region_Date_0s_5d_200.train_Fatalities_window_max_16 as train_Fatalities_window_max_16,
    train_Country_Region_Date_0s_14d_200.train_Fatalities_window_max_17 as train_Fatalities_window_max_17,
    train_Country_Region_Date_0_10_.train_Fatalities_window_avg_18 as train_Fatalities_window_avg_18
FROM train, train_Province_State_Date_0s_2d_200
    ,train_Province_State_Date_0s_7d_200
    ,train_Country_Region_Date_0s_2d_100
    ,train_Country_Region_Date_0s_5d_200
    ,train_Province_State_Date_0s_5d_200
    ,train_Province_State_Date_0s_7d_100
    ,train_Country_Region_Date_0s_14d_200
    ,train_Country_Region_Date_0_10_
    ,train_Province_State_Date_0s_14d_100
    ,train_Province_State_Date_0s_64d_100
WHERE train.Id=train_Province_State_Date_0s_2d_200.Id 
    and train_Province_State_Date_0s_2d_200.Id=train_Province_State_Date_0s_7d_200.Id
    and train_Province_State_Date_0s_7d_200.Id=train_Country_Region_Date_0s_2d_100.Id
    and train_Country_Region_Date_0s_2d_100.Id=train_Country_Region_Date_0s_5d_200.Id
    and train_Country_Region_Date_0s_5d_200.Id=train_Province_State_Date_0s_5d_200.Id
    and train_Province_State_Date_0s_5d_200.Id=train_Province_State_Date_0s_7d_100.Id
    and train_Province_State_Date_0s_7d_100.Id=train_Country_Region_Date_0s_14d_200.Id
    and train_Country_Region_Date_0s_14d_200.Id=train_Country_Region_Date_0_10_.Id
    and train_Country_Region_Date_0_10_.Id=train_Province_State_Date_0s_14d_100.Id
    and train_Province_State_Date_0s_14d_100.Id=train_Province_State_Date_0s_64d_100.Id
) tmpTable