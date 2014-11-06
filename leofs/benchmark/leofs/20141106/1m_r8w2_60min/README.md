## Benchmark LeoFS v1.2.0 with watchdog

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.2.0
* LeoFS cluster settings:

```
[System config]
                System version : 1.2.0
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : 7aae6818
                Prev ring hash : 7aae6818
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 7aae6818       | 7aae6818       | 2014-11-06 09:46:12 +0900
  S    | leofs15@192.168.100.15      | running      | 7aae6818       | 7aae6818       | 2014-11-06 09:46:12 +0900
  S    | leofs16@192.168.100.16      | running      | 7aae6818       | 7aae6818       | 2014-11-06 09:46:11 +0900
  S    | leofs17@192.168.100.17      | running      | 7aae6818       | 7aae6818       | 2014-11-06 09:46:12 +0900
  S    | leofs18@192.168.100.18      | running      | 7aae6818       | 7aae6818       | 2014-11-06 09:46:12 +0900
  G    | leofs13@192.168.100.13      | running      | 7aae6818       | 7aae6818       | 2014-11-06 09:46:18 +0900

```

* basho-bench Configuration:
    * Duration: 60 minutes
    * # of concurrent processes: 64
    * # of keys
    * Value size groups(byte):
        *   1024..10240:   24%
        *  10241..102400:  30%
        * 102401..819200:  30%
        * 819201.. 1572864:16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r8w2_60min.conf](20141106_094721/1m_r8w2_60min.conf)

### OPS and Latency:

![ops-latency](20141106_094721/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20141106_094720/sar_1_20141106_094720_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20141106_094720/sar_3_20141106_094720_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20141106_094720/sar_3_20141106_094720_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20141106_094720/sar_3_20141106_094720_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20141106_094720/sar_3_20141106_094720_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20141106_094720/sar_2_20141106_094720_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20141106_094720/sar_3_20141106_094720_dev8-16-t1.png)
![Storage-1](leofs14_20141106_094720/sar_3_20141106_094720_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20141106_094720/sar_3_20141106_094720_dev8-16-t1.png)
![Storage-2](leofs15_20141106_094720/sar_3_20141106_094720_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20141106_094720/sar_3_20141106_094720_dev8-16-t1.png)
![Storage-3](leofs16_20141106_094720/sar_3_20141106_094720_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20141106_094720/sar_3_20141106_094720_dev8-16-t1.png)
![Storage-4](leofs17_20141106_094720/sar_3_20141106_094720_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20141106_094720/sar_2_20141106_094720_dev8-16-t1.png)
![Storage-5](leofs18_20141106_094720/sar_2_20141106_094720_dev8-16-t2.png)


#### Summary

* Total of network traffic: 7.40 Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
storage_0 |     53.7 |      31.7 |      85.4
storage_1 |     48.8 |      36.6 |      85.4
storage_2 |     51.3 |      37.1 |      88.4
storage_3 |     51.3 |      36.6 |      87.9
storage_4 |     48.8 |      36.1 |      84.9
gateway_0 |     94.7 |     420.0 |     514.7
total     |    348.6 |     598.1 |     946.7
