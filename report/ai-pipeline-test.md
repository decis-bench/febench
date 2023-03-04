# AI pipeline test (online car purchase platform)

### Experiment Setting

The server and client use the same configuration as below.

| CPU                                                          | Memory | Storage | OS                            |
| ------------------------------------------------------------ | ------ | ------- | ----------------------------- |
| 40 Cores 2.2 GHz Xeon(R) E5-2630 (2 sockets, 640KB/2.5MB/25MB for L1/L2/L3 caches of each socket) | 500 GB | 7.3 TB  | CentOS-7.9 with kernel 3.10.0 |

### Experimental Results

The statistic of request and response time are shown below.

![image](../imgs/ai-pipeline-1.png)

#### Predict Service (online)

This section shows the experiment result of predict in online mode.

The first picture shows the overall time consumed by the predictor(include RTFE, scoring and other overheads). The second picture shows the time of RTFE and scoring respectively.

![image](../imgs/ai-pipline-predict.png)

![image](../imgs/ai-pipline-fe.png)

#### Predict Service (batch)

This section shows the experiment result of predict in batch mode. The meaning of the pictures below are the same as the former section.


![image](../imgs/ai-pipeline-batch.png)

![image](../imgs/ai-pipeline-batch-fe.png)