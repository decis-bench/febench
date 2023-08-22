<div align= "center">
    <h1> FEBench: A Benchmark for Real-Time Feature Extraction</h1>
</div>

<p align="center">
  <a href="#-leaderboard">Leaderboard</a> •
  <a href="#-data-and-query">Data and Query</a> •
  <a href="#-quickstart">QuickStart</a> •
  <a href="#-customized-implementation">Customized Implementation</a> •
  <a href="#-result-uploading">Result Uploading</a> •
  <a href="#-contact">Contact</a>
</p>



<br>

<div align="center">
<img src="imgs/example.png" width="600px">
</div>

<br>


🧗 FEBench is a novel benchmark specifically designed for real-time feature extraction (RTFE) within the domain of online AI inference services. These services are rapidly being deployed in diverse applications, including *finance, retail, manufacturing, energy, media, and more.*

  Despite the emergence of various RTFE systems capable of processing incoming data tuples using SQL-like languages, there remains a noticeable lack of studies on workload characteristics and benchmarks for RTFE.

  In close collaboration with our industry partners, FEBench addresses this gap by providing *selected datasets*, *query templates*, and a comprehensive *testing framework*, which signifcantly differs from existing database workloads and benchmarks like TPC-C.

👐 With FEBench, we preliminarily investigate the effectiveness of feature extraction systems together with advanced hardwares, focusing on aspects like overall latency, tail latency, and concurrency performance.

For further insights, please check out our detailed [Technical Report](https://github.com/decis-bench/febench/blob/main/report/febench.pdf) and [Standard Specification](https://github.com/decis-bench/febench/blob/main/report/Feature_Extraction_Benchmark_Standard_Specification.pdf)!

## 👫 Community

We deeply appreciate the invaluable effort contributed by our dedicated team of developers, supportive users, and esteemed industry partners.

- [National University of Singapore](https://nus.edu.sg/)
- [Tsinghua University](https://www.tsinghua.edu.cn/en/)
- [4Paradigm](https://en.4paradigm.com/index.html)
- [OpenMLDB](https://github.com/4paradigm/OpenMLDB)
- [Apache Flink](https://flink.apache.org/)
- [Intel](https://www.intel.com/)


<span id="-leaderboard"></span>

## 🏆 Leaderboard

This leaderboard showcases the performance of executing FEBench on various hardware configurations. Two performance metrics are adopted: *(i) Latency* defined with the commonly used `top percentiles' in the industry; *(ii) Throughput* measured in QPS, i.e., the number of requests processed per second.  
<br>

**Leaderboard - Latency**

| Contributor         | Hardware                                                     | Average TP50/90/99 Performance (ms) &nbsp; &nbsp; | Submit Date |
| ------------------- | ------------------------------------------------------------ | ------------------------------------------------- | ----------- |
| Tsinghua | [(Dual Xeon, 512GB DDR4, CentOS 7)](https://github.com/decis-bench/febench/blob/main/OpenMLDB/leaderboard/2_512_cent7.md) | 2.379/3.224/5.603                                 | 2023/2      |

**Leaderboard - Throughput**

| Contributor         | Hardware                                                     | Average Performance (ops/ms)  &nbsp; &nbsp; | Submit Date |
| ------------------- | ------------------------------------------------------------ | ------------------------------------------- | ----------- |
| Tsinghua | [(Dual Xeon, 512GB DDR4, CentOS 7)](https://github.com/decis-bench/febench/blob/main/OpenMLDB/leaderboard/2_512_cent7.md) | 4.301                                       | 2023/2      |

Note we utilize the performance results of **OpenMLDB** as the basis for ranking. To participate, kindly implement FEBench following our [Standard Specification](https://github.com/decis-bench/febench/blob/main/report/Feature_Extraction_Benchmark_Standard_Specification.pdf) and upload your results by following the [Result Uploading](#-result-uploading) guidelines.


<span id="-data-and-query"></span>

## &#x1F4DC;  Data and Query

We have conducted an analysis of both the schema of our datasets and the characteristics of the queries. Please refer to our detailed [data schema analysis](https://github.com/decis-bench/febench/blob/main/report/tableSchema.md) and [query analysis](https://github.com/decis-bench/febench/blob/main/report/queryAnalysis.md) for further information.

<span id="-quickstart"></span>

## 🐳 Quickstart

### Data Downloading

Download the datasets. Update \<folder\_path\> with the specific path you are using,

  ```sh
wget -r -np -R "index.html*"  -nH --cut-dirs=3  http://43.138.115.238/download/febench/data/  -P <folder_path>
  ```

> Note the data files are in parquet format.

Note that, the above server is located in China, if you are experiencing slow connection, you may try to download from OneDrive (this copy is compressed, please decompress after downloading): https://1drv.ms/f/s!At2bMwG7v7Dngbg21F0ELbZrhC7NBA?e=atHwQy

### Run in Docker

We have included a comprehensive testing procedure in a docker for you to try.

1. Download docker image.

```bash
docker pull lucky20020327/febench:v2.0
```

2. Run the image.

```bash
# note that you need download the data in advance and mount it into the container.
docker run -it -v <data path>:/home/febench/dataset <image id>
```

3. Enter the `env` directory and start the clusters.

```bash
cd /home/env/bin
./recover.sh
./start-all.sh
```

4. update the repository

```bash
git pull 
```

4. Enter `febench` directory and init the configuration.

```bash
cd /home/febench
export FEBENCH_ROOT=`pwd`
sed s#\<path\>#$FEBENCH_ROOT# ./OpenMLDB/conf/conf.properties.template > ./OpenMLDB/conf/conf.properties
sed s#\<path\>#$FEBENCH_ROOT# ./flink/conf/conf.properties.template > ./flink/conf/conf.properties
```

5. Run the benchmark according to Step 5 in *<a href="#-customized-implementation">Customized Implementation</a>*.

<span id="-customized-implementation"></span>

## ⚡️ Customized Implementation

You can build the cluster from the ground up, enabling you to customize the testing environment according to your needs.

In this section you'll find: (1) Prerequisites, (2) AI features, (3) OpenMLDB evaluation, (4) Flink evaluation.

### Prerequisites

Before executing the benchmarking scripts, ensure that your environment meets the following version requirements, assuming you've already correctly configured the target FE system.

- Java JDK: Version 1.8.0 or higher
- Maven: 3.8.0 (recommended)

### AI Features

In the *features* folder: Check out the features utilized in each of the 6 AI tasks, which are generated by the commercial automated ML tool [HCML](https://en.4paradigm.com/product/hypercycle_ml.html) (the simplified version is available at *https://github.com/4paradigm/AutoX*).

### OpenMLDB Evaluation

**Step 1:** Clone the repository

**Step 2:** Download and move the data files to the `dataset` directory of the repository

**Step 3:** [Start the OpenMLDB cluster](https://openmldb.ai/docs/zh/main/deploy/install_deploy.html). For a quick start, you can use the [docker](https://openmldb.ai/docs/zh/main/quickstart/openmldb_quickstart.html#id4), but note that the performance may not be optimal since all the components are deployed on a single physical machine.

> Please be aware that the default values for `spark.driver.memory` and `spark.executor.memory` may not be enough for your needs. If you encounter a `java.lang.OutOfMemoryError: Java heap space` error, you may need to increase them. You can refer to [this document](https://openmldb.ai/docs/zh/main/maintain/faq.html#java-lang-outofmemoryerror-java-heap-space) for guidance. One acceptable size for these parameters is 32G/32G.

**Step 4:** Modify the `conf.properties.template` file to create your own `conf.properties` file in the `./OpenMLDB/conf` directory, and update the configuration settings in the file accordingly, including the OpenMLDB cluster and the locations of data and queries. 

4.1  Modify the locations of data and query,

```sh
export FEBENCH_ROOT=`pwd`
# better to add file://
sed s#\<path\>#file://$FEBENCH_ROOT# ./OpenMLDB/conf/conf.properties.template > ./OpenMLDB/conf/conf.properties
sed s#\<path\>#$FEBENCH_ROOT# ./flink/conf/conf.properties.template > ./flink/conf/conf.properties
```

4.2 Modify the OpenMLDB cluster in `conf.properties` to your own,

```sh
# ./OpenMLDB/conf/conf.properties

ZK_CLUSTER=127.0.0.1:7181
ZK_PATH=/openmldb
```

**Step 5:** Compile and run the test

```bash
cd OpenMLDB
./compile_test.sh 
./test.sh <dataset_ID>
```

Example test result looks as follows
![image](./imgs/openmldb-jmh.png)


### Flink Evaluation

Repeat the 1-5 steps in [*OpenMLDB Evaluation*](#openmldb-evaluation). And there are a few more steps:

1. In Step 3, additionally start a disk-based storage engine (e.g., RocksDB in MySQL) to persist the Flink table data. Note (1) the listening port is set 3306 by default and (2) you need to preload all the secondary tables into the storage engine.

2. In Step 5, supply <dataset_ID> when running *compile_test.sh* script; and no parameter when running *test.sh*, e.g., 

```bash
./compile_test.sh 3 // compile and run the test of task3
./test.sh // rerun the test of task3
```

3. You will need to rerun *compile_test.sh* if you modify the file *conf.properties*. This is not required for *OpenMLDB Evaluation*.

![image](./imgs/flink-jmh.png)

<span id="-run-in-docker"></span>

## 🐳 Run in Docker
We have included a comprehensive testing procedure in a docker for you to try.

1. Download docker image.

```bash
docker pull vegatablechicken/febench:0.5.0
```

2. Run the image.

```bash
# note that you need download the data in advance and mount it into the container.
docker run -it -v <data path>:/work/febench/dataset <image id>
```

3. Start the clusters, addr is `localhost:7181`, path is `/openmldb``.

```bash
/work/init.sh
```

4. Enter `febench` directory and init the configuration.

```bash
cd /work/febench
export FEBENCH_ROOT=`pwd`
sed s#\<path\>#$FEBENCH_ROOT# ./OpenMLDB/conf/conf.properties.template > ./OpenMLDB/conf/conf.properties
sed s#\<path\>#$FEBENCH_ROOT# ./flink/conf/conf.properties.template > ./flink/conf/conf.properties
```

5. Run the benchmark according to Step 5 in *<a href="#-quickstart">QuickStart</a>*.

<span id="-result-uploading"></span>

##  📧 Result Uploading

The benchmark results are stored at \<Openmldb/flink>/logs. If you'd like to share your results, please feel free to [send us an email](mailto:febench2023@gmail.com). Please tell us your **institution (optional)**, **system configurations**, and **attach the result file** to the email. We appreciate your contribution.

Example of system configurations:

| Setting          | Value                                        |
| ---------------- | -------------------------------------------- |
| Memory           | 512 GB DDR4 2667 MHz                         |
| CPU              | 2x Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz |
| Network          | 1 Gbps                                       |
| OS               | CentOS 7                                     |
| Tablet Server    | 3                                            |
| Name Server      | 1                                            |
| OpenMLDB Version | v0.6.4                                       |

<span id="-citation"></span>  

## 📎 Citation

If you use FEBench in your research, please cite:

```bibtex
@article{zhou2023febench,
  author       = {Xuanhe Zhou and 
                  Cheng Chen and
                  Kunyi Li and
                  Bingsheng He and
                  Mian Lu and
                  Qiaosheng Liu and
                  Wei Huang and
                  Guoliang Li and
                  Zhao Zheng and
                  Yuqqiang Chen},
  title        = {FEBench: A Benchmark for Real-Time Relational Data Feature Extraction},
  journal      = {Proc. {VLDB} Endow.},
  year         = {2023}
}
```

<span id="-contact"></span>
## ✉️ Contact

- You may use the [Github Issues](https://github.com/decis-bench/febench/issues) to leave feedback or anything you want to discuss
- Email: febench2023@gmail.com
