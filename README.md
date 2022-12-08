<div align="center">

-----
A Benchmark for Real-Time Realtional Data Feature Extraction.


[**What is FEBench?**](#-what-is-febench)
| [**Getting Started**](#%EF%B8%8F-quickstart)
| [**Contributing**](#%EF%B8%8F-contributing)
</div>


## 💡 What is FEBench?

As online AI inference services have been rapidly deployed in many emerging applications such as fraud detection and recommenda- tion, we have witnessed various systems developed for real-time feature extraction (RTFE) to compute real-time features over incoming new data tuples. Also, the RTFE procedures can be expressed in SQL like languages. 

However, there is not any study about the workload characteristics and benchmarks for RTFE, specifically in comparison with existing database workloads and benchmarks (such as TPC-C). Thus, we have cooperated with our industry partners and built a real-time feature extraction benchmark named FEBench. FEBench consists of selected datasets, query templates, and testing framework. We utilize FEBench to investigate the effectiveness of feature extraction systems and find all the tested systems have their own problems in different aspects (e.g., overall latency, tail latency, and concurrency performance). 

See the detailed [technical report](https://github.com/decis-bench/febench/blob/main/paper/febench.pdf)!

## ⚡️ Quickstart

1. Clone and enter this repository

2. Download the datasets and move the data files to the dataset directory

  ```sh
  wget -r -np -R "index.html*"  http://119.28.136.39/download/febench/data/; cp -r <dataset directory> ./dataset
  ```

> Note the data files are in parquet format.

3. Start the target system

4. Rename the config template (/conf/conf.properties.template) into your own config file (/conf/conf.properties), and update the settings in the file 

  ```sh
HOST=127.0.0.1:xxxx
...

DATABASE=C3
DEPLOY_NAME=C3_service
DATA_FOLDER_C3=./dataset/C3/
DEPLOY_SQL_C3=./query/C3/deploy.sql
CREATE_SQL_C3=./query/C3/create.sql
DROP_SQL_C3=./query/C3/drop.sql
...

  ```

> Note you can start a docker for ease of environment management.


5. Run the testing script

- Run the compile_test.sh file (for the first time),

```bash
./compile_test.sh <dataset_ID>
```

- Otherwise,

```bash
./test.sh <dataset_ID>
```

## ✉️ Contributing
FEBench is developed as an open platform to attract industry and academia to collaborate on the benchmark and further development of RTFE. Reach out to Mian Lu (lumian@4paradigm.com) if you would like to get involved or contribute!
