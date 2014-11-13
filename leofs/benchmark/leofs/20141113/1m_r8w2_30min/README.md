## Benchmark LeoFS v1.2.1

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.2.1
* LeoFS cluster settings:

```
[System config]
                System version : 1.2.1
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : c5843fd7
                Prev ring hash : c5843fd7
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | c5843fd7       | c5843fd7       | 2014-11-13 15:31:41 +0900
  S    | leofs15@192.168.100.15      | running      | c5843fd7       | c5843fd7       | 2014-11-13 15:31:41 +0900
  S    | leofs16@192.168.100.16      | running      | c5843fd7       | c5843fd7       | 2014-11-13 15:31:41 +0900
  S    | leofs17@192.168.100.17      | running      | c5843fd7       | c5843fd7       | 2014-11-13 15:31:41 +0900
  S    | leofs18@192.168.100.18      | running      | c5843fd7       | c5843fd7       | 2014-11-13 15:31:41 +0900
  G    | leofs13@192.168.100.13      | running      | c5843fd7       | c5843fd7       | 2014-11-13 15:31:48 +0900

```

* basho-bench Configuration:
    * Duration: 30 minutes
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        *   1024..10240:   24%
        *  10241..102400:  30%
        * 102401..819200:  30%
        * 819201.. 1572864:16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r8w2_30min.conf](20141113_153757/1m_r8w2_30min.conf)

### OPS and Latency:

![ops-latency](20141113_153757/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20141113_153756/sar_1_20141113_153756_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20141113_153756/sar_3_20141113_153756_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20141113_153756/sar_3_20141113_153756_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20141113_153756/sar_3_20141113_153756_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20141113_153756/sar_3_20141113_153756_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20141113_153756/sar_2_20141113_153756_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20141113_153756/sar_3_20141113_153756_dev8-16-t1.png)
![Storage-1](leofs14_20141113_153756/sar_3_20141113_153756_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20141113_153756/sar_3_20141113_153756_dev8-16-t1.png)
![Storage-2](leofs15_20141113_153756/sar_3_20141113_153756_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20141113_153756/sar_3_20141113_153756_dev8-16-t1.png)
![Storage-3](leofs16_20141113_153756/sar_3_20141113_153756_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20141113_153756/sar_3_20141113_153756_dev8-16-t1.png)
![Storage-4](leofs17_20141113_153756/sar_3_20141113_153756_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20141113_153756/sar_2_20141113_153756_dev8-16-t1.png)
![Storage-5](leofs18_20141113_153756/sar_2_20141113_153756_dev8-16-t2.png)


#### Summary

* Total of network traffic: 2.34 Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
storage_0 |     17.1 |      11.2 |      28.3
storage_1 |     15.1 |      11.0 |      26.1
storage_2 |     15.6 |      11.2 |      26.8
storage_3 |     15.6 |      11.0 |      26.6
storage_4 |     16.1 |      11.7 |      27.8
gateway_0 |     29.3 |     128.0 |     157.3
total     |    108.8 |     184.1 |     292.9
