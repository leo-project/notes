## Benchmark LeoFS v1.1.4

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.1.4(develop)
* LeoFS cluster settings:

```
[System config]
                System version : 1.1.4
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : 7a163fd9
                Prev ring hash : 7a163fd9
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 7a163fd9       | 7a163fd9       | 2014-10-10 16:49:08 +0900
  S    | leofs15@192.168.100.15      | running      | 7a163fd9       | 7a163fd9       | 2014-10-10 16:49:08 +0900
  S    | leofs16@192.168.100.16      | running      | 7a163fd9       | 7a163fd9       | 2014-10-10 16:49:08 +0900
  S    | leofs17@192.168.100.17      | running      | 7a163fd9       | 7a163fd9       | 2014-10-10 16:49:08 +0900
  S    | leofs18@192.168.100.18      | running      | 7a163fd9       | 7a163fd9       | 2014-10-10 16:49:08 +0900
  G    | leofs13@192.168.100.13      | running      | 7a163fd9       | 7a163fd9       | 2014-10-10 16:49:14 +0900

```

* basho-bench Configuration:
    * Duration: 480 minutes
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        *   1024..10240:   24%
        *  10241..102400:  30%
        * 102401..819200:  30%
        * 819201.. 1572864:16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r9w1_480min.conf](20141010_165025/1m_r9w1_480min.conf)

### OPS and Latency:

![ops-latency](20141010_165025/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20141010_165024/sar_1_20141010_165024_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20141010_165024/sar_3_20141010_165024_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20141010_165024/sar_3_20141010_165024_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20141010_165024/sar_3_20141010_165024_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20141010_165024/sar_3_20141010_165024_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20141010_165024/sar_2_20141010_165024_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20141010_165024/sar_3_20141010_165024_dev8-16-t1.png)
![Storage-1](leofs14_20141010_165024/sar_3_20141010_165024_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20141010_165024/sar_3_20141010_165024_dev8-16-t1.png)
![Storage-2](leofs15_20141010_165024/sar_3_20141010_165024_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20141010_165024/sar_3_20141010_165024_dev8-16-t1.png)
![Storage-3](leofs16_20141010_165024/sar_3_20141010_165024_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20141010_165024/sar_3_20141010_165024_dev8-16-t1.png)
![Storage-4](leofs17_20141010_165024/sar_3_20141010_165024_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20141010_165024/sar_2_20141010_165024_dev8-16-t1.png)
![Storage-5](leofs18_20141010_165024/sar_2_20141010_165024_dev8-16-t2.png)


#### Summary

* Total of network traffic: 5.66 Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
storage_0 |     26.8 |      17.1 |      43.7
storage_1 |     26.4 |      17.6 |      44.0
storage_2 |     26.4 |      17.6 |      44.0
storage_3 |     26.4 |      16.6 |      43.0
storage_4 |     26.8 |      18.0 |      44.8
gateway_0 |     48.8 |     439.5 |     488.3
total     |    181.6 |     526.4 |     707.8
