CREATE TABLE IF NOT EXISTS train(Q5_Col100 String,Q5_Col101 timestamp, Q5_Col0 String, Q5_Col102 String) WITH ('connector' = 'jdbc','url' = 'jdbc:mysql://localhost:3306/q5_db','table-name' = 'train','username'='root','password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s','lookup.cache.max-rows'='100')
CREATE TABLE IF NOT EXISTS feedback(Q5_Col100 String,Q5_Col101 timestamp,Q5_Col1 timestamp,Q5_Col203 int) WITH ('connector' = 'jdbc','url' = 'jdbc:mysql://localhost:3306/q5_db','table-name' = 'feedback','username'='root','password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s','lookup.cache.max-rows'='100')
CREATE TABLE IF NOT EXISTS sag_efs_tbproduct_F_b(Q5_Col1 timestamp,Q5_Col102 String,Q5_Col204 String,Q5_Col205 String,Q5_Col206 String,Q5_Col207 String,Q5_Col208 String,Q5_Col209 String,Q5_Col210 String,Q5_Col211 String,Q5_Col212 String,Q5_Col213 String,Q5_Col214 String,Q5_Col215 String,Q5_Col216 String,Q5_Col217 String,Q5_Col218 String,Q5_Col219 String,Q5_Col220 String,Q5_Col221 timestamp,Q5_Col222 timestamp,Q5_Col223 timestamp,Q5_Col224 timestamp,Q5_Col225 timestamp,Q5_Col226 timestamp,Q5_Col227 timestamp,Q5_Col228 timestamp,Q5_Col229 timestamp,Q5_Col230 timestamp,Q5_Col231 timestamp,Q5_Col232 timestamp,Q5_Col233 timestamp,Q5_Col234 timestamp,Q5_Col235 timestamp,Q5_Col236 timestamp,Q5_Col237 timestamp,Q5_Col238 timestamp,Q5_Col239 timestamp,Q5_Col240 timestamp,Q5_Col241 timestamp,Q5_Col242 timestamp,Q5_Col243 String,Q5_Col244 String,Q5_Col245 String,Q5_Col246 String,Q5_Col247 String,Q5_Col248 String,Q5_Col249 String,Q5_Col250 String,Q5_Col251 String,Q5_Col252 String,Q5_Col253 String,Q5_Col254 String,Q5_Col255 String,Q5_Col256 String,Q5_Col257 String,Q5_Col258 String,Q5_Col259 String,Q5_Col260 String,Q5_Col261 String,Q5_Col262 String,Q5_Col263 String,Q5_Col264 String,Q5_Col265 String,Q5_Col266 String,Q5_Col267 String,Q5_Col268 String,Q5_Col269 String,Q5_Col270 String,Q5_Col271 String,Q5_Col272 String,Q5_Col273 String,Q5_Col274 String,Q5_Col275 String,Q5_Col276 String,Q5_Col277 String,Q5_Col278 String,Q5_Col279 String,Q5_Col280 String,Q5_Col281 String,Q5_Col282 String,Q5_Col283 String,Q5_Col284 String,Q5_Col285 String,Q5_Col286 String,Q5_Col287 String,Q5_Col288 String,Q5_Col289 String,Q5_Col290 String,Q5_Col291 String,Q5_Col292 String,Q5_Col293 String,Q5_Col294 String,Q5_Col295 String,Q5_Col296 String,Q5_Col297 String,Q5_Col298 String,Q5_Col299 String,Q5_Col300 String,Q5_Col301 String,Q5_Col302 String,Q5_Col303 String,Q5_Col304 String,Q5_Col305 String,Q5_Col306 String,Q5_Col307 String,Q5_Col308 String,Q5_Col201 String,Q5_Col309 double,Q5_Col310 double,Q5_Col311 double,Q5_Col312 double,Q5_Col313 double,Q5_Col314 double,Q5_Col315 double,Q5_Col316 double,Q5_Col317 double,Q5_Col318 double,Q5_Col319 double,Q5_Col320 double,Q5_Col321 double,Q5_Col322 double,Q5_Col323 double,Q5_Col324 double,Q5_Col325 double,Q5_Col326 double,Q5_Col327 double,Q5_Col328 double,Q5_Col329 double,Q5_Col330 double,Q5_Col331 double,Q5_Col332 double,Q5_Col333 double,Q5_Col334 double,Q5_Col335 double,Q5_Col336 double,Q5_Col337 double,Q5_Col338 double,Q5_Col339 double,Q5_Col340 double,Q5_Col341 double,Q5_Col342 double,Q5_Col343 double,Q5_Col344 double,Q5_Col345 double,Q5_Col346 double,Q5_Col347 double,Q5_Col348 double,Q5_Col349 double,Q5_Col350 double,Q5_Col351 double,Q5_Col352 double,Q5_Col353 double,Q5_Col354 double,Q5_Col355 double) WITH ('connector' = 'jdbc','url' = 'jdbc:mysql://localhost:3306/q5_db','table-name' = 'sag_efs_tbproduct_F_b' ,'username'='root','password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s','lookup.cache.max-rows'='100')
CREATE TABLE IF NOT EXISTS CUST_f7(Q5_Col1 timestamp,Q5_Col0 String,Q5_Col147 int,Q5_Col148 String,Q5_Col149 String,Q5_Col150 String,Q5_Col151 String,Q5_Col152 String,Q5_Col153 String,Q5_Col154 String) WITH ('connector' = 'jdbc','url' = 'jdbc:mysql://localhost:3306/q5_db','table-name' = 'CUST_f7' ,'username'='root','password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s','lookup.cache.max-rows'='100')
CREATE TABLE IF NOT EXISTS LINK2_f6(Q5_Col1 timestamp, Q5_Col0 String, Q5_Col155 String, Q5_Col156 String, Q5_Col157 String, Q5_Col158 String, Q5_Col159 String, Q5_Col160 String, Q5_Col161 String, Q5_Col162 String, Q5_Col163 String, Q5_Col164 String, Q5_Col165 String, Q5_Col166 String, Q5_Col167 String, Q5_Col168 String, Q5_Col169 String, Q5_Col170 String, Q5_Col171 String, Q5_Col172 String, Q5_Col173 String, Q5_Col174 String, Q5_Col175 String, Q5_Col176 String, Q5_Col177 String, Q5_Col178 String, Q5_Col179 String, Q5_Col180 String, Q5_Col181 String, Q5_Col182 String, Q5_Col183 String, Q5_Col184 String, Q5_Col185 String, Q5_Col186 String, Q5_Col187 String, Q5_Col188 String, Q5_Col189 String, Q5_Col190 String, Q5_Col191 String, Q5_Col192 String, Q5_Col193 String, Q5_Col194 String, Q5_Col195 String, Q5_Col196 String, Q5_Col197 String, Q5_Col198 String, Q5_Col199 String, Q5_Col200 String, Q5_Col201 String, Q5_Col202 String, Q5_Col33 String, Q5_Col34 timestamp, Q5_Col35 String, Q5_Col36 String, Q5_Col37 String, Q5_Col38 String, Q5_Col39 String, Q5_Col40 String, Q5_Col41 String, Q5_Col42 String, Q5_Col43 String, Q5_Col44 String, Q5_Col45 String, Q5_Col46 String, Q5_Col47 String, Q5_Col48 String, Q5_Col49 String, Q5_Col50 String, Q5_Col51 String, Q5_Col52 String, Q5_Col53 String, Q5_Col54 String, Q5_Col55 String, Q5_Col56 String, Q5_Col57 String, Q5_Col58 String, Q5_Col59 String, Q5_Col60 String, Q5_Col61 String, Q5_Col62 String, Q5_Col63 String, Q5_Col64 String, Q5_Col65 String, Q5_Col66 String, Q5_Col67 String, Q5_Col68 String, Q5_Col69 String, Q5_Col70 String, Q5_Col71 String, Q5_Col72 String, Q5_Col73 String, Q5_Col74 String, Q5_Col75 String, Q5_Col76 String, Q5_Col77 String, Q5_Col78 String, Q5_Col79 String, Q5_Col80 String, Q5_Col81 String, Q5_Col82 String) WITH ('connector' = 'jdbc','url' = 'jdbc:mysql://localhost:3306/q5_db','table-name' = 'LINK2_f6' ,'username'='root','password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s','lookup.cache.max-rows'='100')
CREATE TABLE IF NOT EXISTS LINK1_f5(Q5_Col1 timestamp, Q5_Col0 String, Q5_Col155 String, Q5_Col156 String, Q5_Col157 String, Q5_Col158 String, Q5_Col159 String, Q5_Col160 String, Q5_Col161 String, Q5_Col162 String, Q5_Col163 String, Q5_Col164 String, Q5_Col165 String, Q5_Col166 String, Q5_Col167 String, Q5_Col168 String, Q5_Col169 String, Q5_Col170 String, Q5_Col171 String, Q5_Col172 String, Q5_Col173 String, Q5_Col174 String, Q5_Col175 String, Q5_Col176 String, Q5_Col177 String, Q5_Col178 String, Q5_Col179 String, Q5_Col180 String, Q5_Col181 String, Q5_Col182 String, Q5_Col183 String, Q5_Col184 String, Q5_Col185 String, Q5_Col186 String, Q5_Col187 String, Q5_Col188 String, Q5_Col189 String, Q5_Col190 String, Q5_Col191 String, Q5_Col192 String, Q5_Col193 String, Q5_Col194 String, Q5_Col195 String, Q5_Col196 String, Q5_Col197 String, Q5_Col198 String, Q5_Col199 String, Q5_Col200 String, Q5_Col201 String, Q5_Col202 String, Q5_Col33 String, Q5_Col34 timestamp, Q5_Col35 String, Q5_Col36 String, Q5_Col37 String, Q5_Col38 String, Q5_Col39 String, Q5_Col40 String, Q5_Col41 String, Q5_Col42 String, Q5_Col43 String, Q5_Col44 String, Q5_Col45 String, Q5_Col46 String, Q5_Col47 String, Q5_Col48 String, Q5_Col49 String, Q5_Col50 String, Q5_Col51 String, Q5_Col52 String, Q5_Col53 String, Q5_Col54 String, Q5_Col55 String, Q5_Col56 String, Q5_Col57 String, Q5_Col58 String, Q5_Col59 String, Q5_Col60 String, Q5_Col61 String, Q5_Col62 String, Q5_Col63 String, Q5_Col64 String, Q5_Col65 String, Q5_Col66 String, Q5_Col67 String, Q5_Col68 String, Q5_Col69 String, Q5_Col70 String, Q5_Col71 String, Q5_Col72 String, Q5_Col73 String, Q5_Col74 String, Q5_Col75 String, Q5_Col76 String, Q5_Col77 String, Q5_Col78 String, Q5_Col79 String, Q5_Col80 String, Q5_Col81 String, Q5_Col82 String) WITH ('connector' = 'jdbc','url' = 'jdbc:mysql://localhost:3306/q5_db','table-name' = 'LINK1_f5' ,'username'='root','password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s','lookup.cache.max-rows'='100')
CREATE TABLE IF NOT EXISTS AUM_f4(Q5_Col1 timestamp, Q5_Col0 String, Q5_Col103 double, Q5_Col104 double, Q5_Col105 double, Q5_Col106 double, Q5_Col107 double, Q5_Col108 double, Q5_Col109 double, Q5_Col110 double, Q5_Col111 double, Q5_Col112 double, Q5_Col113 double, Q5_Col114 double, Q5_Col115 double, Q5_Col116 double, Q5_Col117 double, Q5_Col118 double, Q5_Col119 double, Q5_Col120 double, Q5_Col121 double, Q5_Col122 double, Q5_Col123 double, Q5_Col124 double, Q5_Col125 double, Q5_Col126 double, Q5_Col127 double, Q5_Col128 double, Q5_Col129 double, Q5_Col130 double, Q5_Col131 double, Q5_Col132 double, Q5_Col133 double, Q5_Col134 double, Q5_Col135 double, Q5_Col136 double, Q5_Col137 double, Q5_Col138 double, Q5_Col139 double, Q5_Col140 double, Q5_Col141 double, Q5_Col142 double, Q5_Col30 double, Q5_Col143 double, Q5_Col144 double, Q5_Col145 double, Q5_Col146 double, Q5_Col33 timestamp, Q5_Col34 String, Q5_Col35 double, Q5_Col36 double, Q5_Col37 double, Q5_Col38 double, Q5_Col39 double, Q5_Col40 double, Q5_Col41 double, Q5_Col42 double, Q5_Col43 double, Q5_Col44 double, Q5_Col45 double, Q5_Col46 double, Q5_Col47 double, Q5_Col48 double, Q5_Col49 double, Q5_Col50 double, Q5_Col51 double, Q5_Col52 double, Q5_Col53 double, Q5_Col54 double, Q5_Col55 double, Q5_Col56 double, Q5_Col57 double, Q5_Col58 double, Q5_Col59 double, Q5_Col60 double, Q5_Col61 double, Q5_Col62 double, Q5_Col63 double, Q5_Col64 double, Q5_Col65 double, Q5_Col66 double, Q5_Col67 double, Q5_Col68 double, Q5_Col69 double, Q5_Col70 double, Q5_Col71 double, Q5_Col72 double, Q5_Col73 double, Q5_Col74 double, Q5_Col75 double, Q5_Col76 double, Q5_Col77 double, Q5_Col78 double, Q5_Col79 double, Q5_Col80 double, Q5_Col81 double, Q5_Col82 double, Q5_Col83 double, Q5_Col84 double, Q5_Col85 double) WITH ('connector' = 'jdbc','url' = 'jdbc:mysql://localhost:3306/q5_db','table-name' = 'AUM_f4' ,'username'='root','password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s','lookup.cache.max-rows'='100')
CREATE TABLE IF NOT EXISTS debit3_f3(Q5_Col0 String,Q5_Col1 timestamp,Q5_Col2 String,Q5_Col3 String,Q5_Col4 String,Q5_Col5 String,Q5_Col6 String,Q5_Col7 String,Q5_Col8 String,Q5_Col9 String,Q5_Col10 String,Q5_Col11 String,Q5_Col12 String,Q5_Col13 timestamp,Q5_Col14 timestamp,Q5_Col15 timestamp,Q5_Col16 String,Q5_Col17 String,Q5_Col18 String,Q5_Col19 String,Q5_Col20 String,Q5_Col21 String,Q5_Col22 String,Q5_Col23 String,Q5_Col24 String,Q5_Col25 String,Q5_Col26 String,Q5_Col27 String,Q5_Col28 double,Q5_Col29 double,Q5_Col30 String,Q5_Col31 timestamp,Q5_Col32 String,Q5_Col33 String,Q5_Col34 timestamp,Q5_Col35 String,Q5_Col36 String,Q5_Col37 String,Q5_Col38 String,Q5_Col39 String,Q5_Col40 String,Q5_Col41 String,Q5_Col42 String,Q5_Col43 String,Q5_Col44 String,Q5_Col45 String,Q5_Col46 timestamp,Q5_Col47 timestamp,Q5_Col48 timestamp,Q5_Col49 String,Q5_Col50 String,Q5_Col51 String,Q5_Col52 String,Q5_Col53 String,Q5_Col54 String,Q5_Col55 String,Q5_Col56 String,Q5_Col57 String,Q5_Col58 String,Q5_Col59 String,Q5_Col60 String,Q5_Col61 double,Q5_Col62 double,Q5_Col63 String,Q5_Col64 timestamp,Q5_Col65 String,Q5_Col66 timestamp,Q5_Col67 String,Q5_Col68 String,Q5_Col69 String,Q5_Col70 String,Q5_Col71 String,Q5_Col72 String,Q5_Col73 String,Q5_Col74 String,Q5_Col75 String,Q5_Col76 String,Q5_Col77 String,Q5_Col78 timestamp,Q5_Col79 timestamp,Q5_Col80 timestamp,Q5_Col81 String,Q5_Col82 String,Q5_Col83 String,Q5_Col84 String,Q5_Col85 String,Q5_Col86 String,Q5_Col87 String,Q5_Col88 String,Q5_Col89 String,Q5_Col90 String,Q5_Col91 String,Q5_Col92 String,Q5_Col93 double,Q5_Col94 String,Q5_Col95 String,Q5_Col96 String,Q5_Col97 String,Q5_Col98 String,Q5_Col99 String) WITH ('connector' = 'jdbc','url' = 'jdbc:mysql://localhost:3306/q5_db','table-name' = 'debit3_f3' ,'username'='root','password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s','lookup.cache.max-rows'='100')
CREATE TABLE IF NOT EXISTS debit2_f2(Q5_Col0 String,Q5_Col1 timestamp,Q5_Col2 String,Q5_Col3 String,Q5_Col4 String,Q5_Col5 String,Q5_Col6 String,Q5_Col7 String,Q5_Col8 String,Q5_Col9 String,Q5_Col10 String,Q5_Col11 String,Q5_Col12 String,Q5_Col13 timestamp,Q5_Col14 timestamp,Q5_Col15 timestamp,Q5_Col16 String,Q5_Col17 String,Q5_Col18 String,Q5_Col19 String,Q5_Col20 String,Q5_Col21 String,Q5_Col22 String,Q5_Col23 String,Q5_Col24 String,Q5_Col25 String,Q5_Col26 String,Q5_Col27 String,Q5_Col28 double,Q5_Col29 double,Q5_Col30 String,Q5_Col31 timestamp,Q5_Col32 String,Q5_Col33 String,Q5_Col34 timestamp,Q5_Col35 String,Q5_Col36 String,Q5_Col37 String,Q5_Col38 String,Q5_Col39 String,Q5_Col40 String,Q5_Col41 String,Q5_Col42 String,Q5_Col43 String,Q5_Col44 String,Q5_Col45 String,Q5_Col46 timestamp,Q5_Col47 timestamp,Q5_Col48 timestamp,Q5_Col49 String,Q5_Col50 String,Q5_Col51 String,Q5_Col52 String,Q5_Col53 String,Q5_Col54 String,Q5_Col55 String,Q5_Col56 String,Q5_Col57 String,Q5_Col58 String,Q5_Col59 String,Q5_Col60 String,Q5_Col61 double,Q5_Col62 double,Q5_Col63 String,Q5_Col64 timestamp,Q5_Col65 String,Q5_Col66 timestamp,Q5_Col67 String,Q5_Col68 String,Q5_Col69 String,Q5_Col70 String,Q5_Col71 String,Q5_Col72 String,Q5_Col73 String,Q5_Col74 String,Q5_Col75 String,Q5_Col76 String,Q5_Col77 String,Q5_Col78 timestamp,Q5_Col79 timestamp,Q5_Col80 timestamp,Q5_Col81 String,Q5_Col82 String,Q5_Col83 String,Q5_Col84 String,Q5_Col85 String,Q5_Col86 String,Q5_Col87 String,Q5_Col88 String,Q5_Col89 String,Q5_Col90 String,Q5_Col91 String,Q5_Col92 String,Q5_Col93 double,Q5_Col94 String,Q5_Col95 String,Q5_Col96 String,Q5_Col97 String,Q5_Col98 String,Q5_Col99 String) WITH ('connector' = 'jdbc','url' = 'jdbc:mysql://localhost:3306/q5_db','table-name' = 'debit2_f2' ,'username'='root','password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s','lookup.cache.max-rows'='100')
CREATE TABLE IF NOT EXISTS debit1_f1(Q5_Col0 String,Q5_Col1 timestamp,Q5_Col2 String,Q5_Col3 String,Q5_Col4 String,Q5_Col5 String,Q5_Col6 String,Q5_Col7 String,Q5_Col8 String,Q5_Col9 String,Q5_Col10 String,Q5_Col11 String,Q5_Col12 String,Q5_Col13 timestamp,Q5_Col14 timestamp,Q5_Col15 timestamp,Q5_Col16 String,Q5_Col17 String,Q5_Col18 String,Q5_Col19 String,Q5_Col20 String,Q5_Col21 String,Q5_Col22 String,Q5_Col23 String,Q5_Col24 String,Q5_Col25 String,Q5_Col26 String,Q5_Col27 String,Q5_Col28 double,Q5_Col29 double,Q5_Col30 String,Q5_Col31 timestamp,Q5_Col32 String,Q5_Col33 String,Q5_Col34 timestamp,Q5_Col35 String,Q5_Col36 String,Q5_Col37 String,Q5_Col38 String,Q5_Col39 String,Q5_Col40 String,Q5_Col41 String,Q5_Col42 String,Q5_Col43 String,Q5_Col44 String,Q5_Col45 String,Q5_Col46 timestamp,Q5_Col47 timestamp,Q5_Col48 timestamp,Q5_Col49 String,Q5_Col50 String,Q5_Col51 String,Q5_Col52 String,Q5_Col53 String,Q5_Col54 String,Q5_Col55 String,Q5_Col56 String,Q5_Col57 String,Q5_Col58 String,Q5_Col59 String,Q5_Col60 String,Q5_Col61 double,Q5_Col62 double,Q5_Col63 String,Q5_Col64 timestamp,Q5_Col65 String,Q5_Col66 timestamp,Q5_Col67 String,Q5_Col68 String,Q5_Col69 String,Q5_Col70 String,Q5_Col71 String,Q5_Col72 String,Q5_Col73 String,Q5_Col74 String,Q5_Col75 String,Q5_Col76 String,Q5_Col77 String,Q5_Col78 timestamp,Q5_Col79 timestamp,Q5_Col80 timestamp,Q5_Col81 String,Q5_Col82 String,Q5_Col83 String,Q5_Col84 String,Q5_Col85 String,Q5_Col86 String,Q5_Col87 String,Q5_Col88 String,Q5_Col89 String,Q5_Col90 String,Q5_Col91 String,Q5_Col92 String,Q5_Col93 double,Q5_Col94 String,Q5_Col95 String,Q5_Col96 String,Q5_Col97 String,Q5_Col98 String,Q5_Col99 String) WITH ('connector' = 'jdbc','url' = 'jdbc:mysql://localhost:3306/q5_db','table-name' = 'debit1_f1' ,'username'='root','password'='db10204','driver'='com.mysql.cj.jdbc.Driver','lookup.cache.ttl'='20s','lookup.cache.max-rows'='100')