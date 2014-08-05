## Benchmark LeoFS v1.1.0

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.1.0
* LeoFS cluster settings:

```
[System config]
                System version : 1.1.0
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : 480c1258
                Prev ring hash : 480c1258
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 480c1258       | 480c1258       | 2014-08-04 11:00:07 +0900
  S    | leofs15@192.168.100.15      | running      | 480c1258       | 480c1258       | 2014-08-04 11:00:07 +0900
  S    | leofs16@192.168.100.16      | running      | 480c1258       | 480c1258       | 2014-08-04 11:00:07 +0900
  S    | leofs17@192.168.100.17      | running      | 480c1258       | 480c1258       | 2014-08-04 11:00:07 +0900
  S    | leofs18@192.168.100.18      | running      | 480c1258       | 480c1258       | 2014-08-04 11:00:07 +0900
  G    | leofs13@192.168.100.13      | running      | 480c1258       | 480c1258       | 2014-08-04 11:00:13 +0900

```

* basho-bench Configuration:
    * Duration: 720 minutes
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        *   1024..10240:   24%
        *  10241..102400:  30%
        * 102401..819200:  30%
        * 819201.. 1572864:16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r99w1_720min.conf](20140804_110125/1m_r99w1_720min.conf)

### OPS and Latency:

![ops-latency](20140804_110125/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20140804_110124/sar_1_20140804_110124_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20140804_110124/sar_3_20140804_110124_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20140804_110124/sar_3_20140804_110124_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20140804_110124/sar_3_20140804_110124_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20140804_110124/sar_3_20140804_110124_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20140804_110124/sar_2_20140804_110124_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20140804_110124/sar_3_20140804_110124_dev8-16-t1.png)
![Storage-1](leofs14_20140804_110124/sar_3_20140804_110124_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20140804_110124/sar_3_20140804_110124_dev8-16-t1.png)
![Storage-2](leofs15_20140804_110124/sar_3_20140804_110124_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20140804_110124/sar_3_20140804_110124_dev8-16-t1.png)
![Storage-3](leofs16_20140804_110124/sar_3_20140804_110124_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20140804_110124/sar_3_20140804_110124_dev8-16-t1.png)
![Storage-4](leofs17_20140804_110124/sar_3_20140804_110124_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20140804_110124/sar_2_20140804_110124_dev8-16-t1.png)
![Storage-5](leofs18_20140804_110124/sar_2_20140804_110124_dev8-16-t2.png)


#### Summary

* Total of network traffic: 5.90 Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
gateway_0 |     9.8  |    708.0  |    717.8
storage_0 |     5.1  |      2.9  |      8.0
storage_1 |     4.5  |      2.9  |      7.4
storage_2 |     4.5  |      2.9  |      7.4
storage_3 |     4.6  |      2.9  |      7.5
storage_4 |     4.6  |      2.9  |      7.5
total     |    33.1  |    722.5  |    755.6
