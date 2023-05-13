
/*
 * Copyright 2023 4Paradigm
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com._4paradigm.openmldb.benchmark;

import com._4paradigm.openmldb.sdk.SdkOption;
import com._4paradigm.openmldb.sdk.SqlExecutor;
import com._4paradigm.openmldb.sdk.impl.SqlClusterExecutor;

import java.util.Properties;

public class BenchmarkConfig {
    public static String ZK_CLUSTER = "127.0.0.1:6181";
    public static String ZK_PATH="/onebox";

    public static int WINDOW_NUM = 2;
    public static int WINDOW_SIZE = 1000;
    public static int JOIN_NUM = 2;
    public static int PK_BASE = 1000000;
    public static long TS_BASE = 1652232079000l;
    public static int DATASET_NUM = 0;
    public static int DATASET_ID = 0;

    public static String DATABASE_C[];

    public static String DEPLOY_NAME_C[];

    public static String DATA_FOLDER_C[];

    public static String DEPLOY_SQL_C[];

    public static String CREATE_SQL_C[];

    public static String DROP_SQL_C[];

    private static SqlExecutor executor = null;
    private static SdkOption option = null;

    public static int PK_NUM = 1;
    public static int PK_MAX = 0;
    static {
        try {
            Properties prop = new Properties();
            prop.load(BenchmarkConfig.class.getClassLoader().getResourceAsStream("conf.properties"));
            ZK_CLUSTER = prop.getProperty("ZK_CLUSTER");
            ZK_PATH = prop.getProperty("ZK_PATH");
            TS_BASE = Long.parseLong(prop.getProperty("TS_BASE"));
            PK_BASE = Integer.parseInt(prop.getProperty("PK_BASE"));

            DATASET_NUM = Integer.parseInt(prop.getProperty("DATASET_NUM"));
            try {
                DATASET_ID = Integer.parseInt(prop.getProperty("DATASET_ID"));
            } catch (Exception e) {
                DATASET_ID = 0;
            }


            DATABASE_C = new String[DATASET_NUM];
            DEPLOY_NAME_C = new String[DATASET_NUM];
            DATA_FOLDER_C = new String[DATASET_NUM];
            DEPLOY_SQL_C = new String[DATASET_NUM];
            CREATE_SQL_C = new String[DATASET_NUM];
            DROP_SQL_C = new String[DATASET_NUM];

            for(int i = 0; i < DATASET_NUM; ++i) {
                DATABASE_C[i] = prop.getProperty("DATABASE_C"+i);
                DEPLOY_NAME_C[i] = prop.getProperty("DEPLOY_NAME_C"+i);
                DATA_FOLDER_C[i] = prop.getProperty("DATA_FOLDER_C"+i);
                CREATE_SQL_C[i] = prop.getProperty("CREATE_SQL_C"+i);
                DROP_SQL_C[i] = prop.getProperty("DROP_SQL_C"+i);
                DEPLOY_SQL_C[i] = prop.getProperty("DEPLOY_SQL_C"+i);
            }

            WINDOW_NUM = Integer.valueOf(prop.getProperty("WINDOW_NUM"));
            WINDOW_SIZE = Integer.valueOf(prop.getProperty("WINDOW_SIZE"));
            JOIN_NUM = Integer.valueOf(prop.getProperty("JOIN_NUM"));
            PK_NUM = Integer.valueOf(prop.getProperty("PK_NUM", "100000"));
            PK_MAX = Integer.valueOf(prop.getProperty("PK_MAX", "0"));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static SqlExecutor GetSqlExecutor(boolean enableDebug) {
        if (executor != null) {
            return executor;
        }
        SdkOption sdkOption = new SdkOption();
        sdkOption.setSessionTimeout(30000);
        sdkOption.setZkCluster(BenchmarkConfig.ZK_CLUSTER);
        sdkOption.setZkPath(BenchmarkConfig.ZK_PATH);
        sdkOption.setEnableDebug(enableDebug);
        sdkOption.setRequestTimeout(1000000);
        sdkOption.setMaxSqlCacheSize(500);
        // sdkOption.setEnableDebug(true);
	option = sdkOption;
        try {
            executor = new SqlClusterExecutor(option);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return executor;
    }
}
