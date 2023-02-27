# Feature Definition

We provide feature definitions for six queries by using functions, which can be translated into target systems, e.g., OpenMLDB, Flink, Spark, Python. Each line corresponds to one feature. The function definitions are listed below.

## 1. avg

```
Y = avg(col)
Y = avg(w.col)
```

It calculates the average value of input. It should always be used together with the ***window*** function. Null value in the input is not counted.

### Parameters

- **col** : A column of data. Types bigint, smallint, int, float, double are supported.

### Return Value

The average value of input, double type.

### Example

```
col = [1,2,3]
avg(col) = 2
# Take the average value of column `amt` of windows `w1` as feature
f_col = discrete(avg(w1.amt))
```



## 2. column 

```
y = column(col,"Rename")
y = column(w.col[0])
```

It outputs the column data, with rename supported. 

### Example

```
# Output the data of the column `amt` in the window `w1`. The data is inputed row by row. w1.amt[0] refers to the current field.
w1 = window(trade,"trade_id","time",1000,3600,"t1")
col_amt = column(w1.amt[0])
```



## 3. combine

```
Y = combine(list)
Y = combine(X1,X2,...)
Y = combine(w.col1[0],w.col2[0],...)
```

It combines multiple input fields. The input is processed using Cartesian product if there's a list as input. The output supports discrete feature processing.

### Parameters

- **X1, X2**: Any type, also can takes a list as input

### Return Value

The output is a string if input is non-list. The output is a string list if input contains list. The null value in the input list is ignored. Essentially, the input is processed by for-loop structure and then converted into strings.

### Example

```
# Input non-list, output string
# X1 = 1, X2 = 2, X3 = 3
Y = combine(X1,X2,X3)  # Y = "1-2-3"
# Input list, output string list
# X1 = ["1","2"], X2 = ["3","4"]
Y = combine(X1)  # Y = ["1-2"]
Y = combine(X1,X2)  # Y = ["1-3","1-4","2-3","2-4"] Cartesian product
# Take the result as features
f_col = discrete(combine(X1,X2))
 
# If there's null value in the input
combine(1,null,3,4,5)=1-3-4-5
 
# If the input contains list and non-list, conduct Cartesian product, 
# e.g. [1,[2,3],4] ==> [[1-2-4],[1-3-4]]
```



## 4. continuous

```
f_col = continuous(X)
f_col = continuous(w.col[0])
```

It process features by continuous encoding. It can be used in certain cases and algorithms. For example, continuous features are more suitable for decision-tree models, but work not so good for linear regression algorithms.

### Parameters

- **X**: A column or a single data. Type `int`, `smallint`, `bigint`, `float`, and `double` are supported.

### Return Value

Continuous labeled features that can be used for model training. The output is null is there's exception in the input.



## 5. count

```
Y = count(col)
// count for the number of rows of a certain column
Y = column(count(w.col))
// count for the number of occurrences of a certain element in the column of a window
Y = column(count(w.col[0],w.col))
Y = column(count(w.col[0],w.col[0s,1d]))
Y = column(count(9,w.col[0s,1d]))
```

It counts for the number of rows of a column. It can also be used to count for the number of occurrences of a certain element in the given column. Note that the element and the column must be the same type in the second usage, which is the same with ***count_of_window***.

### Parameters

- **w.col/list**: Column of any type, usually the same as those in a window.

### Return Value

An integer, always int type.

### Example

```
# w.amt = [1,2,1,1,2]
Y = count(w.amt[0],w.amt) # Y =3
# take the number of rows of column *amt* in window *w1* as feature
f_col = discrete(count(w.amt))
```



## 6. count_of_window

```
// count for the number of rows of the window
Y = count_of_window(w)
// same as *count*
Y = count_of_window(w.col[0],w.col)
```

It counts for the number of rows of a window. It can also be used to count for the number of appearances of a certain elements in the given column in a window. Note that the element and the column must be the same type in the second usage, which is the same with ***count***.

### Parameters

- **w**: Window of any type.

### Return Value

An integer, always int type.

### Example

```
# take the number of rows of window *w1* as feature
f_col = discrete(count_of_window(w1))
```



## 7. discrete

```
f_col = discrete(X)
f_col = discrete(w.col[0])
```

It processes features by discrete encoding. It can be used in certain cases and algorithms. For example, discrete  features are not suggested for GBDT-tree model, which may decrease the training efficiency or even cause the program failed.

### Parameters

- **X**: A column or a single data of any type

### Return Value

Discrete encoded features that can be used for model training.



## 8. distinct_count

```
Y = distinct_count(col)
Y = column(distinct_count(w.col))
```

It counts for the number of distinct rows of input.

### Parameters

- **w.col/list**: Column of any type, usually that are in a window.

### Return Value

An integer, always int type.

### Example

```
# take the number of distinct rows of column *amt* in window *w1* as feature
f_col = discrete(distinct_count(w1.amt))
```



## 9. get_keys

```
Y = get_keys(X)
Y = column(get_keys(w.col[0]))
```

It takes out the keys in the key-value structure(or the output of ***splitbykey***). It is compatible with ***getkey***.

### Parameters

- **X**: key-value structured data or the output of ***splitbykey*** or type conversion result of output of ***splitbykey***.

### Return Value

A list of keys.

### Example

```
# use together with splitbykey
col= ["Monday:50;Tuesday:70";"Wednesday:100"]
Y = get_keys(splitbykey(col,”;”,”:”)) # output ["Monday""Tuesday";"Wednesday"]
# use the result as input for ***discrete***
f_col = discrete(get_keys(splitbykey(col,”;”,”:”)))
# use together with ***map*** and ***group by***
f_col = discrete(get_keys(map(group_by(w,"string_diffname"),count)))
```



## 10. group_by

```
Y = group_by(window,"col")
Y = group_by(window/list, x->lambda)
```

It groups the data in the given window. It supports lambda expression, the result of which is the key of group.

### Parameters

- **window/list**: A window or a list.
- **col**: A column name. The function returns null value if the column is not in window/list.

### Return Value

Grouped data. The null value in the input is ignored.

## Example

```
# Group the data in window *w1* according to 'trx_type'. Calculate the summery of column *amt* of each group, and then generate (type, sum) pairs.
f_col = discrete(get_pairs(map(group_by(w1,"trx_type"), x-> sum(x.amt))))
```



## 11. if

```
Y = discrete(if(bool, V, V))
Y = column(if(window.id[0] in (12, 1213), 0, 1))
```

It supports nested `if`, but the return value must be the same type and cannot be null value.

### Example

```
w=window(t1, "string_desc", "timestamp", 5, 3000)
f1=discrete(if(if(w.int[0]>2,false,true),4,5))
# input data:
#    ["a", 1521526671000, 1]
#    ["a", 1521526672000, 2]
#    ["a", 1521526673000, 3]
# output: [4,4,5]
```



## 12. ifnull

```
Y = ifnull(X,"defualt value")
Y = column(ifnull(w.col[0],"defualt value"))
```

It returns the default value if input data is null; otherwise returns the original data.

### Parameters

- **col**: The column to be processed.
- **defualt value**: Any basic types, list/map and constant value.

### Return Value

Return the default value if input data is null. Otherwise return the original data.

### Example

```
f_col = discrete(ifnull(w.trx_type[0], "0"))
f_col = discrete(ifnull(w.trx_type[0], 0))
f_col = discrete(ifnull(w.trx_type[0], 0L))
f_col = discrete(ifnull(w.trx_type[0], 0.0))
f_col = discrete(ifnull(w.trx_type[0], 0.0D))
f_col = discrete(ifnull(w.trx_type[0], false))
```



## 13. join

```
Y = join("junction symbol","default value",X1,X2,..,Xn)
Y = join("junction symbol","default value",w.col)
Y = join("junction symbol","default value",list)
```

It supports the concatenation of given data, column in window or list data. It returns string data.

### Parameters

- **X1, X2,.., Xn**: Any basic type or constant value, it can be different type.
- **w.col/list**: A column in a window or a list.
- **junction symbol**: String type data used to concatenate input data. Empty if input is null.
- **default value**：String type data to fill in the null data of input. Don't fill in any data if set null.

### Return Value

Concatenated string of input.

### Example

```
Y = join("-",null,1,2,"3")  # Y = "1-2-3"
# list = [1,2,3,null]
Y = join("-","NA",list)  # Y = "1-2-3-NA"
Y = join(null,null,list)  # Y = "123"
# Take the concatenated result as feature
f_col = discrete(join("-","NA",list))
```



## 14. lastjoin(also last_join)

```
t3 = last_join(t1, t2, "condition", t2.tscol)
t3 = last_join(t1, t2, "condition", t2.tscol between (unbound, t1.ts))
```

It performs left join over the given two table, and the second table is ordered by the given column, which must be a timestamp/bigint column of the second table. If the condition contains primary keys of two tables, then it works the same as ***left_join***. Otherwise, this function will concatenate the rows in the first table with the first row in the second table that satisfies the condition. Note that it doesn't conduct Cartesian product.

### Parameters

- **t1/t2**: Join the second given table(t2) to the first given table(t1). Note that the function will throw error if there's duplicated column name in the given tables. You can first use ***select*** to rename.
- **condition**: Support one or more equation conditions connected by `and`. Do not support for inequation as condition. Note that the condition must be surround with double quotation marks.
- **t2.tscol**: The timestamp column of the secondary table is used as the key for sorting, supporting `timestamp` and `bigint`. The column is configurable, e.g., t2.tscol. 
- **t2.tscol**: The column of **t2** used to sort. Must be timestamp or bigint type. You can define the query range of this column in the following way:
  - between + interval. "[" / "]" means including the boundary, and "(" / ")" means excluding the boundary.
  - The boundary can be constant value, "unbound", or a column of **t1**. "unbound" means no boundary. The type of constant value and column must be timestamp or bigint.
  - Note that the right boundary must be bigger than the left boundary.

### Return Value

The joint table. Return empty table if there's no available data in the query range.

### Example

```
joined = last_join(t1, t2, t1.colt1 == t2.colt2, t2.tsCol between (t1.lastweek and t1.yesterday])
joined = last_join(t1, t2, t1.colt1 == t2.colt2, t2.tsCol between (unbound, 2019-08-20T])
joined = last_join(t1, t2, t1.colt1 == t2.colt2, t2.tsCol between (2019-08-20T20:20:20, t1.yesterday))
```



## 15. leftjoin(also left_join)

```
t3 = left_join(t1, t2, "condition")
```

Left join the given two table. In the off-line mode, it will conduct Cartesian product if the fields in the "condition" are not primary key. In the on-line mode,  it will choose one to join randomly if there are multiple matched rows. It's suggested that there's no multiple matched rows. Otherwise, the off-line result will be different from the on-line result.

### Parameters

- **t1/t2**: Join the second given table(t2) to the first given table(t1). t1 is the primary table and t2 is the secondary table.
- **condition**: Support one or more conditions connected by *and*. Support for inequation as condition. Note that the condition must be surround with double quotation marks.

### Return Value

The left_joined table. If there are columns with the same name, they will be renamed as "tableName_columnName".

### Example

```
t3 = left_join(t1,t2,"t1.card_no = t2.crd_nbr and t1.time > t2.t")
```



## 16. map

```
Y = map(window,function)
```

It conducts function in the given window(s).

### Parameters

Support for single window, multiple windows and list. Multiple windows are always obtained by cutting sub-windows within a window, e.g. w1.amt[1d,5d,10d].

| **function**      | **description**                                              |
| ----------------- | ------------------------------------------------------------ |
| sum/max/min/avg   | Support type BigInt、SmallInt、Int、Float、Double            |
| first_of_window   | The first value of the given window(s). Support any type.    |
| last_of_window    | The last value of the given window(s). Support any type.     |
| is_in_window      | Exist in the window or not. Return "1" if exist and "0" if not. Support any type. |
| distinct_count    | Count for the distinct rows in the given window(s). Support any type. |
| count             | Count for the rows in the given window(s). Support any type. |
| lambda expression | e.g. x -> log(x + 1), which is conducted for each row in the window. |

### Return Value

Key-value pairs.

### Example

```
f_col = discrete(get_values(map(w1.amt[5m,1d,3d],max)))
```



## 17. max

```
Y = max(col)
Y = column(max(w.col))
```

It returns the max value of input.

### Parameters

- **col**: A column. Support type bigint, smallint, int, long, float, double.

### Return Value

The max value of input.

### Example

```
col = [1,2,3]
max(col) = 3
f_col = discrete(max(w1.amt))
```



## 18. min

```
Y = min(col)
Y = column(min(w.col))
```

It returns the min value of input.

### Parameters

- **col**: A column. Support type bigint, smallint, int, long, float, double.

### Return Value

The min value of input.

### Example

```
col = [1,2,3]
min(col) = 1
f_col = discrete(min(w1.amt))
```



## 19. output

```
Y = output(w.col1[0])
```

It is mainly used to define a primary key, used together with ***left_join_feature***.

### Parameters

* **col**: A column of a table.

### Return Value

The information of primary key of the window.

### Example

```
# left_join *trade* and *user*. *trade* is primary table.
join_table1 = left_join(trade,user,"trade.userid = user.id")
w1 = window(join_table1,"trade_id","time",1000,3600,"t1")
# take *trade_id* of window *w1* as primary key.
a = output(w1.trade_id[0])
b = discrete(max(w1.amount[0:4]))
c = discrete(max(w1.amount[0:4]))

# left_join *trade* and *product*. *trade* is primary table.
join_table2 = left_join(trade, product,"trade.productid = product.id")
w2 = window(join_table2,"trade_id","time",1000,3600,"t2")
# take *trade_id* of window *w2* as primary key.
d = output(w2.trade_id[0])
e = discrete(max(w2.price[0:4]))
label = multiclass_label(int(w2.trade_id))
# get the final feature using *trade_id* in *w1* and *w2*
final = left_join_feature(t1,t2,"t1.a=t2.d")
```



## 20. range

```
Y = range(col,start,stop)
```

It returns the value of column in the given range.

### Parameters

- **col**: A column.
- **start**: Positive integer representing the row id, starting from 1.
- **stop**: Positive integer. Must be larger than start.

### Return Value

A list with length (stop-start).

### Example

```
# Get the first three rows of w.amt
range(w.amt,1,4)
```



## 21. regression_label

```
f_label = regression_label(target_column)
f_label = regression_label(w.col[0])
```

It returns the label value of a column for regression algorithms.

### Parameters

- **target_column**: A column. Support type bigint, smallint, int, long, float, double.

### Return Value

The score in the regression scenario. The null value in the input is ignored.



## 22. select

```
t2 = select(t1, col1, col2, col3, col4)
t2 = select(t1.col1, t1.col2, t1.col3, t1.col4)
t2 = select(t1, "" as col1, 0.0 as col2, 0.0D as col3, 2019-07-18T as datecol)
```

It selects certain fields of input table. It supports to rename columns using 'as' and add constant value columns.

### Parameters

- **t1**: The table to be selected.

- **col**: The fields to be selected. Can be renamed using 'as'.

- **constant value**: Support to output constant value column. The corresponding relation of type and constant value is as follows: 

  | value               | type      |
  | ------------------- | --------- |
  | 0.0                 | float     |
  | 0.0D                | double    |
  | 0L                  | bigint    |
  | 0                   | int       |
  | 2019-07-18T         | date      |
  | 2019-07-18T09:20:20 | timestamp |

### Output Value

A table contains the selected fields. The types of fields are the same with original table or are specified.

### Example

```
# Input table *trade*. Filter several fields as an output table.
t_select = select(trade, amt, trade_id, time)
w1 = window(trade,"trade_id","time",1000,3600,"t1")
col_amt = column(sum(w1.amt))
col_time = column(w1.time[0])
col_id = column(w1.id[0])
# Select some fileds and add a constant value column.
t_selected = select(t1, col_amt as amt1, col_time as time1, 1 as label)
t_select = select(trade, amt, trade_id as id, time, user_id)
w = window(t_select,"id","time",1000,1d)
f1 = discrete(w.amt[0])
f2 = discrete(w.time[0])
f3 = discrete(w.user_id[0])
```



## 23. sort_by_value

```
Y = sort_by_value(key-value pairs, true/false)
```

It sorts the key-value pairs using value.

### Parameters

* **key_value pairs**: Key-value structured data.
* **true/false**: Optional, `true` means sorting from largest to smallest and 'false' means sorting from smallest to largest . Default to be false.

### Return Value

The sorted key-value pairs.

### Example

```
res = sort_by_value(map(group_by(w,"string_diffname"), x->sum(x.int)))
```



## 24. split

```
Y = split(X,"separator","type")
Y = split(w.col[0],"separator","type")
```

It splits the given data or column by a separator.

### Parameters

- **X**: string data.
- **separator**: The separator or the corresponding ASCII.
- **type**: Optional, the type of return value. Default to be string.

### Return Value

A list of type "type".

### Example

```
# str = "hello,world"
Y = split(str,",")  # Y = ["hello","world"]
f_col = discrete(split(str,","))
```



## 25. window

```
w = window(table,[other_table],[keys,order],[max_size],[atleast],[offset],[filter_output],[instance_is_window],[output])
```

It defines a time window that acts as a two-dimensional array.

### Parameters

- **table**: The table from which to construct the window.
- **other_table**: Optional, feature table. Given in a list if there are multiple table, e.g. other_table=[t2,t3]. These tables must be with the same schema with "table". 
- **keys, order**: Optional, both or none. Group by keys and sort by order. There can be multiple keys, and if so, you must provide them in a list, e.g. keys=[key1,key2], order=ts. The 'order' is usually a column of type timestamp, date or bigint.
- **max_size**: Optional. The max number of rows in the window. Default to be 10000. It's suggested to define max_size less than 1000 to ensure the efficiency.
- **atleast**: Optional. The min number of rows in the window. Default to be 0.
- **offset**: Optional. The time range from current data to the past or future.
  * The left boundary is included and the right boundary is excluded. The unit is default to be ms and it's also supported to use s, m, h, d.
- **filter_output**: Optional. Only the rows that fit the condition 'filter_output' will be in the window. You must specify the table name together with column name. e.g. filter_output= t.col=="source".
- **instance_is_window**: Optional. If instance_is_window=false, only 'other_table' will be in the window. If instance_is_window=true, 'table' and 'other_table' will be in the window.
- **output**: Optional. The name of the result.

### Return Value

The window constructed. Direct output is not supported.

### Example

```
# Group by 'card_no'. Take the data from 5d ago till the end of current day into the window. e.g. from 26th Dec 00:00:00 to 30th Dec 23:59:59
w1 = window(t,"card_no","ts",1000,5d,"t1")
# with condition
w2 = window(t,"card_no","ts",1000,5d,t.card_no == "321534324","t2")

f_col = discrete(get_values(map(w1.amt[10m,1h,3d], x->log(max(x.amt)+1))))
```

```
# Using both table and other_table
w = window(table =t1, other_table =[t2, t3], keys=[key1, key2], order=ts, max_size=100, offset=30d, output="w_out")
# with condition
w = window(table =t1, other_table =[t2, t3], keys=[key1, key2], order=ts, max_size=100, offset=30d, filter_output= t1.channel != "")
 
# select from org_t1
t1 = select(org_t1, col1, col2, c3 as col3, c4 as col4, 0.0 as amt)
# select from org_t2
t2 = select(org_t2, column1 as col1, column2 as col2, "" as col3, 0.0D as col4, amt)
# window on t1 and t2
w = window(table = t1, other_table=[t2], keys=[col1], order = col2, max_size=100, offset=30d)
famt = column(sum(w.amt))
```

