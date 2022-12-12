CREATE TABLE train (datedate timestamp,wp1 double, wp2 double, wp3 double, wp4 double, wp5 double, wp6 double, wp7 double) WITH ('connector' = 'jdbc' ,'url' = 'jdbc:mysql://localhost:3306/gef','table-name' = 'train' ,'username'='root' ,'password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s' ,'lookup.cache.max-rows'='100')
CREATE TABLE windforecasts_wf1 (datedate timestamp,hors Integer, u String, v String, ws String, wd String) WITH ('connector' = 'jdbc' ,'url' = 'jdbc:mysql://localhost:3306/gef','table-name' = 'windforecasts_wf1' ,'username'='root' ,'password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s' ,'lookup.cache.max-rows'='100')
CREATE TABLE windforecasts_wf2 (datedate timestamp,hors Integer, u String, v String, ws String, wd String) WITH ('connector' = 'jdbc' ,'url' = 'jdbc:mysql://localhost:3306/gef','table-name' = 'windforecasts_wf2' ,'username'='root' ,'password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s' ,'lookup.cache.max-rows'='100')
CREATE TABLE windforecasts_wf3 (datedate timestamp,hors Integer, u String, v String, ws String, wd String) WITH ('connector' = 'jdbc' ,'url' = 'jdbc:mysql://localhost:3306/gef','table-name' = 'windforecasts_wf3' ,'username'='root' ,'password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s' ,'lookup.cache.max-rows'='100')
CREATE TABLE windforecasts_wf4 (datedate timestamp,hors Integer, u String, v String, ws String, wd String) WITH ('connector' = 'jdbc' ,'url' = 'jdbc:mysql://localhost:3306/gef','table-name' = 'windforecasts_wf4' ,'username'='root' ,'password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s' ,'lookup.cache.max-rows'='100')
CREATE TABLE windforecasts_wf5 (datedate timestamp,hors Integer, u String, v String, ws String, wd String) WITH ('connector' = 'jdbc' ,'url' = 'jdbc:mysql://localhost:3306/gef','table-name' = 'windforecasts_wf5' ,'username'='root' ,'password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s' ,'lookup.cache.max-rows'='100')
CREATE TABLE windforecasts_wf6 (datedate timestamp,hors Integer, u String, v String, ws String, wd String) WITH ('connector' = 'jdbc' ,'url' = 'jdbc:mysql://localhost:3306/gef','table-name' = 'windforecasts_wf6' ,'username'='root' ,'password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s' ,'lookup.cache.max-rows'='100')
CREATE TABLE windforecasts_wf7 (datedate timestamp,hors Integer, u String, v String, ws String, wd String) WITH ('connector' = 'jdbc' ,'url' = 'jdbc:mysql://localhost:3306/gef','table-name' = 'windforecasts_wf7' ,'username'='root' ,'password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s' ,'lookup.cache.max-rows'='100')