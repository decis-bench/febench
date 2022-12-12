select * from 
(
select
    `datedate` as date_1,
    `datedate` as train_date_original_0,
    `wp7` as train_wp7_original_2,
    `wp1` as train_wp1_original_32,
    `wp2` as train_wp2_original_33,
    `wp3` as train_wp3_original_34,
    `wp4` as train_wp4_original_35,
    `wp5` as train_wp5_original_36,
    `wp6` as train_wp6_original_37,
    log(`wp6`) as train_wp6_log_38,
    log(`wp3`) as train_wp3_log_39,
    dayofweek(CAST(`datedate` AS TIMESTAMP)) as train_date_dayofweek_40,
    hour(CAST(`datedate` AS TIMESTAMP)) as train_date_hourofday_41,
    case when 1 < dayofweek(CAST(`datedate` AS TIMESTAMP)) and dayofweek(CAST(`datedate` AS TIMESTAMP)) < 7 then 1 else 0 end as train_date_isweekday_42,
    log(`wp2`) as train_wp2_log_43
from
    `train`
    )
as out0
join
(
select
    `train`.`datedate` as date_3,
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
    join `windforecasts_wf1` as `windforecasts_wf1_date` on `train`.`datedate` = `windforecasts_wf1_date`.`datedate`
    join `windforecasts_wf2` as `windforecasts_wf2_date` on `train`.`datedate` = `windforecasts_wf2_date`.`datedate`
    join `windforecasts_wf3` as `windforecasts_wf3_date` on `train`.`datedate` = `windforecasts_wf3_date`.`datedate`
    join `windforecasts_wf4` as `windforecasts_wf4_date` on `train`.`datedate` = `windforecasts_wf4_date`.`datedate`
    join `windforecasts_wf5` as `windforecasts_wf5_date` on `train`.`datedate` = `windforecasts_wf5_date`.`datedate`
    join `windforecasts_wf6` as `windforecasts_wf6_date` on `train`.`datedate` = `windforecasts_wf6_date`.`datedate`
    join `windforecasts_wf7` as `windforecasts_wf7_date` on `train`.`datedate` = `windforecasts_wf7_date`.`datedate`)
as out1
on out0.date_1 = out1.date_3