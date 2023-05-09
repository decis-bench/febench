/*
 * Copyright 2021 4Paradigm
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com._4paradigm.openmldb.benchmark;

import com._4paradigm.openmldb.proto.NS;
import com._4paradigm.openmldb.sdk.SqlExecutor;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import org.slf4j.*;
import org.apache.log4j.PropertyConfigurator;

import java.sql.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.FileInputStream;




import org.apache.hadoop.conf.Configuration;
import org.apache.avro.generic.GenericData;
import org.apache.avro.generic.GenericData.Record;
import org.apache.parquet.avro.AvroParquetReader;
import org.apache.hadoop.fs.Path;
import org.apache.parquet.hadoop.ParquetReader;
import com._4paradigm.openmldb.proto.Type;
import java.util.concurrent.atomic.LongAdder;
import java.io.File;




@BenchmarkMode(Mode.SampleTime)
@OutputTimeUnit(TimeUnit.MICROSECONDS)
@State(Scope.Benchmark)



@Threads(5)
@Fork(value = 1, jvmArgs = {"-Xms8G", "-Xmx8G"})
@Warmup(iterations = 2)
@Measurement(iterations = 5, time = 60)

public class OpenMLDBPerfBenchmark_Cluster {
    private static int dataSetID;

    private SqlExecutor executor;
    private String database;
    private String deployName;
    private String datafolder;
    private String deploySQLPath;
    private String dropSQLPath;
    private String createSQLPath;
    private int windowNum;
    private int windowSize;
    private int joinNum;
    // private final static Logger logger = LoggerFactory.getLogger(OpenMLDBPerfBenchmark_Cluster.class);
    
    
    private static LongAdder current_row = new LongAdder();
    
    private int round = 0;
    private int total_load_amount = 0;
    
    private long round_gap = 10000000000L;

    private int unionNum = 0; 
    private Map<String, TableSchema> tableSchemaMap = new HashMap<>();
    private Map<String, String> colMaxMin = new HashMap<>();
    private Random random;
    private List<Integer> pkList = new ArrayList<>();

    private List<Record> recordList = new ArrayList<>();

    
    private void executeSQLFromFile(String filePath) {
        System.out.println("executeSQLFromFile("+filePath+")");
        StringBuilder builder = new StringBuilder();
        try{
            BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(filePath)));
            String line;
            while ((line = reader.readLine()) != null) {
                Util.executeSQL(line, executor);
                builder.append(line).append("\n");
            }
        }
        catch (Exception e) {
            throw new RuntimeException("", e);
        }
    }

    public OpenMLDBPerfBenchmark_Cluster() {
        dataSetID = BenchmarkConfig.DATASET_ID;
        System.out.println("loading conf of dataset["+dataSetID+"]");
        executor = BenchmarkConfig.GetSqlExecutor(true);
        deployName = BenchmarkConfig.DEPLOY_NAME_C[dataSetID];
        database = BenchmarkConfig.DATABASE_C[dataSetID];
        datafolder = BenchmarkConfig.DATA_FOLDER_C[dataSetID];
        deploySQLPath = BenchmarkConfig.DEPLOY_SQL_C[dataSetID];
        dropSQLPath = BenchmarkConfig.DROP_SQL_C[dataSetID];
        createSQLPath = BenchmarkConfig.CREATE_SQL_C[dataSetID];
        
        
        joinNum = BenchmarkConfig.JOIN_NUM;
        windowNum = BenchmarkConfig.WINDOW_NUM;
        windowSize = BenchmarkConfig.WINDOW_SIZE;
        random = new Random(System.currentTimeMillis());
        if (BenchmarkConfig.PK_MAX > 0) {
            for (int i = 0; i < BenchmarkConfig.PK_NUM; i++) {
                int pk = random.nextInt(BenchmarkConfig.PK_MAX);
                if (!pkList.contains(pk)) {
                    pkList.add(pk);
                }
            }
        }

        // PropertyConfigurator.configure("conf/log4j.properties");
    }

    public void create() {
        try {
            Util.executeSQL("CREATE DATABASE IF NOT EXISTS " + database + ";", executor);
            Util.executeSQL("USE " + database + ";", executor);
            executeSQLFromFile(createSQLPath);
        }
        catch (Exception e) {
            throw new RuntimeException("Test abort because creating database failed", e);
        }
        
    }

    public void drop() {
        try{
            Util.executeSQL("USE " + database + ";", executor);
            Util.executeSQL("DROP DEPLOYMENT " + deployName + ";", executor);
            executeSQLFromFile(dropSQLPath);
            Util.executeSQL("DROP DATABASE " + database + ";", executor);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deploy() {
        System.out.println(deploySQLPath);
        StringBuilder builder = new StringBuilder();
        try{
            BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(deploySQLPath)));
            String line;
            while ((line = reader.readLine()) != null) {
                builder.append(line).append("\n");
            }
	    } catch (Exception e){
	        e.printStackTrace();
	    }
        try{
            Util.executeSQL("USE " + database + ";", executor);
            Util.executeSQL("SET @@execute_mode='online';", executor);
            Util.executeSQL("DEPLOY " + deployName + " " + builder.toString(), executor);
        }
        catch (Exception e){
            throw new RuntimeException("Test abort because the deployment failed");
        }
    }


    public void onlineLoad(String path, String table) {
        String loadDataSQL = "LOAD DATA INFILE '"+ path + table + "' INTO TABLE " + table + " options(format='parquet', header=true, mode='append');";
        Util.executeSQLSync(loadDataSQL, executor);;
    }
    
    
    
    public void load(String folderPath) {
        switch (dataSetID) {
            case 0:
            case 1: {
                break;
            }
            case 2: {
                load2(folderPath);
                break;
            }
            case 3: {
                load3(folderPath);
                break;
            }
            case 4: {
                load4(folderPath);
                break;
            }
            case 5: {
                load5(folderPath);
                break;
            }
        }
    }

    public void load2(String folderPath) {
        try {
            Util.executeSQL("SET @@execute_mode='online';", executor);
            
            List<String> tables = new ArrayList<>();
            tables.add("benchmark");
            tables.add("test");
            tables.add("windforecasts_wf1");
            tables.add("windforecasts_wf2");
            tables.add("windforecasts_wf3");
            tables.add("windforecasts_wf4");
            tables.add("windforecasts_wf5");
            tables.add("windforecasts_wf6");
            tables.add("windforecasts_wf7");

            tables.forEach(t -> onlineLoad(folderPath, t));

        } catch (Exception e) {
            throw new RuntimeException("test abort because the loading phase of Q2 failed", e);
        }

    }

    public void load3(String folderPath) {
        try {
            Util.executeSQL("SET @@execute_mode='online';", executor);
            
            List<String> tables = new ArrayList<>();
            tables.add("product_sku");
            tables.add("product_item");
            tables.add("order_cancel_return");
            tables.add("shipping_sku");
            tables.add("order_sales");
            tables.add("order_sales1");
            tables.add("order_sales2");
            tables.add("order_sales3");
            tables.add("order_sales4");
            tables.add("feedback");

            tables.forEach(t -> onlineLoad(folderPath, t));

        } catch (Exception e) {
            throw new RuntimeException("test abort because the loading phase of Q3 failed", e);
        }

    }

    public void load4(String folderPath) {
        try {
            Util.executeSQL("SET @@execute_mode='online';", executor);
            
            List<String> tables = new ArrayList<>();
            tables.add("action");
            tables.add("bo_POS_CASH_balance");
            tables.add("bo_bureau");
            tables.add("bo_bureau_balance");
            tables.add("bo_credit_card_balance");
            tables.add("bo_installment_payment");
            tables.add("bo_part");
            tables.add("bo_previous_applicatio");

            tables.forEach(t -> onlineLoad(folderPath, t));

        } catch (Exception e) {
            throw new RuntimeException("test abort because the loading phase of Q4 failed", e);
        }

    }

    public void load5(String folderPath) {
        try {
            Util.executeSQL("SET @@execute_mode='online';", executor);
            
            List<String> tables = new ArrayList<>();
            tables.add("feedback");
            tables.add("feedback_1");
            tables.add("feedback_2");
            tables.add("feedback_3");
            tables.add("feedback_4");
            tables.add("sag_efs_tbproduct_F_b");
            tables.add("sag_efs_tbproduct_F_b_1");
            tables.add("sag_efs_tbproduct_F_b_2");
            tables.add("sag_efs_tbproduct_F_b_3");
            tables.add("sag_efs_tbproduct_F_b_4");
            tables.add("CUST_f7");
            tables.add("CUST_f7_1");
            tables.add("CUST_f7_2");
            tables.add("CUST_f7_3");
            tables.add("CUST_f7_4");
            tables.add("LINK2_f6");
            tables.add("LINK2_f6_1");
            tables.add("LINK2_f6_2");
            tables.add("LINK2_f6_3");
            tables.add("LINK2_f6_4");
            tables.add("LINK1_f5");
            tables.add("LINK1_f5_1");
            tables.add("LINK1_f5_2");
            tables.add("LINK1_f5_3");
            tables.add("LINK1_f5_4");
            tables.add("AUM_f4");
            tables.add("AUM_f4_1");
            tables.add("AUM_f4_2");
            tables.add("AUM_f4_3");
            tables.add("AUM_f4_4");
            tables.add("debit3_f3");
            tables.add("debit3_f3_1");
            tables.add("debit3_f3_2");
            tables.add("debit3_f3_3");
            tables.add("debit3_f3_4");
            tables.add("debit2_f2");
            tables.add("debit2_f2_1");
            tables.add("debit2_f2_2");
            tables.add("debit2_f2_3");
            tables.add("debit2_f2_4");
            tables.add("debit1_f1");
            tables.add("debit1_f1_1");
            tables.add("debit1_f1_2");
            tables.add("debit1_f1_3");
            tables.add("debit1_f1_4");

            tables.forEach(t -> onlineLoad(folderPath, t));

        } catch (Exception e) {
            throw new RuntimeException("test abort because the loading phase of Q5 failed", e);
        }

    }


    private void addTableSchema(String dbName, String tableName) {
        NS.TableInfo tableInfo = null;
        try {
            tableInfo = executor.getTableInfo(dbName, tableName);
            TableSchema schema = new TableSchema(tableInfo);
            tableSchemaMap.put(tableName, schema);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addSchema() {
        addTableSchema(database, "train");
    }

    long convertINT96toLong(String int96String){
        long NANO_SECONDS_PER_DAY = 86400_000_000_000L;
        long JULIAN_EPOCH_OFFSET_DAYS = 2440588;

        String[] tmp = int96String.split(",");
        int[] int96Bytes = new int[tmp.length];
        for(int i=0; i< tmp.length; ++i){
            int96Bytes[i]=Integer.parseInt(tmp[i].replaceAll("\\s|\\[|\\]", ""));
            
        }

        
        int julianDay = 0;
        int index = int96Bytes.length;
        
        while (index > 8) {
            index--;
            julianDay <<= 8;
            julianDay += int96Bytes[index] & 0xFF;
        }

        
        long nanos = 0;
        
        while (index > 0) {
            index--;
            nanos <<= 8;
            nanos += int96Bytes[index] & 0xFF;
        }
        return ((julianDay - JULIAN_EPOCH_OFFSET_DAYS)*NANO_SECONDS_PER_DAY+nanos)/1000000;
    }

    
    
    

    private void readParquet(String dataFilePath){
        System.out.println("readParquet dataFilePath:"+dataFilePath);
        Configuration conf = new Configuration();
        conf.set("parquet.avro.readInt96AsFixed", "true");
        try {
            ParquetReader<Record> reader = AvroParquetReader
                .<GenericData.Record>builder(new Path(dataFilePath))
                .withConf(conf)
                .build();
            GenericData.Record result;
            
            while ((result = reader.read()) != null) {
                switch (dataSetID) {
                    case 0: {
                        result.put("pickup_datetime",convertINT96toLong(result.get("pickup_datetime").toString()));
                        result.put("dropoff_datetime",convertINT96toLong(result.get("dropoff_datetime").toString()));
                        break;
                    }
                    case 1: {
                        result.put("Date",convertINT96toLong(result.get("Date").toString()));
                        break;
                    }
                    case 2: {
                        result.put("date",convertINT96toLong(result.get("date").toString()));
                        break;
                    }
                    case 3: {
                        
                        
                        break;
                    }
                    case 4: {
                        
                        break;
                    }
                    case 5: {
                        
                        break;
                    }
                    default:
                        break;
                }
                recordList.add(result);
                ++total_load_amount;
            }
            reader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void readParquetFolder(String folderPath){
        switch (dataSetID) {
            case 0: {
                String filePath;
                for(int i=0; i<40; ++i){
                    if(i < 10){
                        filePath = folderPath + "train/part-0000"+i+"-8a55dd20-601e-4d69-b252-79b729bdaa4f-c000.snappy.parquet";
                    }else{
                        filePath = folderPath + "train/part-000"+i+"-8a55dd20-601e-4d69-b252-79b729bdaa4f-c000.snappy.parquet";
                    }
                    readParquet(filePath);
                }
                break;
            }
            case 1: {
                String filePath = folderPath + "train/part-00000-dc35485a-f7fc-4279-8343-162e08b0c42b-c000.snappy.parquet";
                readParquet(filePath);
                break;
            }
            case 2: {
                String filePath = folderPath + "train/part-00000-2f466a55-8a91-410a-b1e7-3822921aa045-c000.snappy.parquet";
                readParquet(filePath);
                break;
            }
            case 3: { 
                String filePath = folderPath + "flatten_request/part-00000-8c54161a-2ecd-4025-a657-793f9cd569d2-c000.snappy.parquet";
                
                
                readParquet(filePath);
                
                break;
            }
            
            case 4: {
                int[] fs_number=new int[]{1}; 
                
                int i;
                for(int j=0; j<fs_number.length; ++j){
                    i=fs_number[j];
                    String filePath = folderPath + "flattenRequest/part-0000" + i + "-b0861947-7aaa-4e44-9d41-e5776246c48c-c000.snappy.parquet";
                    readParquet(filePath);
                }
                break;
            }
            case 5: {
                String filePath;
                for(int i=0; i<=99; ++i){
                
                    if(i<10){
                        filePath = folderPath + "flatten_request/part-0000" + i + "-a0b142f8-1171-4704-b5c3-ed80fc29fec8-c000.snappy.parquet";
                    }else if(i>=10 && i<100){
                        filePath = folderPath + "flatten_request/part-000" + i + "-a0b142f8-1171-4704-b5c3-ed80fc29fec8-c000.snappy.parquet";
                    }else{
                        filePath = folderPath + "flatten_request/part-00" + i + "-a0b142f8-1171-4704-b5c3-ed80fc29fec8-c000.snappy.parquet";
                    }
                    readParquet(filePath);
                }
                break;
            }
        }
         
    }


    public void initEnv_manual() {
                
    	drop();
        create();
        deploy();
        load(datafolder);

    }

    @Setup
    public void initEnv() {

        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            e.printStackTrace();
        }
        addSchema();

        readParquetFolder(datafolder);
    }

    @TearDown
    public void cleanEnv() {
        
    }


    public boolean FeatureExtractionAndInsert(String deployName,
                                           String tableName,
                                           long g_row_id,
                                           SqlExecutor executor) throws SQLException {
        long round_id = g_row_id/total_load_amount;
        int row_id = (int)(g_row_id%total_load_amount);

        TableSchema tableSchema = tableSchemaMap.get(tableName);
        String dbName = tableSchema.getDataBase();
        List<Type.DataType> schema = tableSchema.getSchema();
        Set<Integer> index = tableSchema.getIndex();
        Set<Integer> tsIndex = tableSchema.getTsIndex();
        PreparedStatement requestPs = executor.getCallablePreparedStmt(dbName, deployName);
        ResultSetMetaData metaData = requestPs.getMetaData();
        GenericData.Record record = recordList.get(row_id);

        
        StringBuilder builder = new StringBuilder();
        builder.append("insert into ").append(tableName).append(" values(");

        if (schema.size() != metaData.getColumnCount()) {
            return false;
        }

        for (int i = 0; i < metaData.getColumnCount(); i++) {
            if (i > 0) {
                builder.append(", ");
            }
            int columnType = metaData.getColumnType(i + 1);
            if (columnType == Types.VARCHAR) {
                String tmp = String.valueOf(record.get(i));
                requestPs.setString(i + 1, tmp);
                builder.append("\"").append(tmp).append("\"");
            } else if (columnType == Types.DOUBLE) {
                double tmp;
                if(null!=record.get(i)){
                    tmp = (double)record.get(i);
                }else{
                    tmp = 0.0;
                }
                requestPs.setDouble(i + 1, tmp);
                builder.append(tmp);
            } else if (columnType == Types.FLOAT) {
                float tmp = (float)record.get(i);
                requestPs.setFloat(i + 1, tmp);
                builder.append(tmp);
            } else if (columnType == Types.INTEGER) {
                int tmp = (int)record.get(i);
                requestPs.setInt(i + 1, tmp);
                builder.append(tmp);
            } else if (columnType == Types.BIGINT) {
                long tmpl = (long)record.get(i);
                requestPs.setLong(i + 1, tmpl);
                builder.append(tmpl);
            } else if (columnType == Types.TIMESTAMP) {
                long tmpl = round_id*round_gap+(long)record.get(i); 
                Timestamp tmp = new Timestamp(tmpl);
                requestPs.setTimestamp(i + 1, tmp);
                builder.append(tmpl);
            }
            else{
                System.out.println(record.get(i));
                System.out.println(record.get(i).getClass());
                System.out.println("ERR i: "+i+ " columnType: "+columnType);
            }
        }
        builder.append(");");
        
        ResultSet resultSet = requestPs.executeQuery();
        
        String insertSQL = builder.toString();
        
        if(g_row_id%100000==0){
            System.out.println("g_row_id:"+ g_row_id +" total_load_amount:"+total_load_amount+" round_id: "+round_id+" row_id:"+row_id);
            System.out.println("inserSQL: " + insertSQL);
            
            
            resultSet.next();
            Map<String, String> val = Util.extractResultSet(resultSet);
            for (String key : val.keySet()) {
                System.out.println("Key = " + key + ", Value = " + val.get(key));
            }
        }
        PreparedStatement pstmt = null;
        try{
            pstmt = executor.getInsertPreparedStmt(dbName, insertSQL);
            pstmt.execute();
        }catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    
                    pstmt.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return true;
    }


    @Benchmark
    public void executeDeployment() {
        current_row.increment();
        try {
            if(!FeatureExtractionAndInsert(deployName, "train", current_row.longValue(), executor)){
                System.out.println("Err!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        int dataSetID = BenchmarkConfig.DATASET_ID;
        int dataSetNUM = BenchmarkConfig.DATASET_NUM;

        OpenMLDBPerfBenchmark_Cluster init_cluster = new OpenMLDBPerfBenchmark_Cluster();
        init_cluster.initEnv_manual();

        if(dataSetID > dataSetNUM || dataSetID < 0) {
            System.out.println("Err! Invalid dataSetID");
            return;
        }
        try {
            Options opt = new OptionsBuilder()
                    .include(OpenMLDBPerfBenchmark_Cluster.class.getSimpleName())
                    .forks(1)
                    .build();
            new Runner(opt).run();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
