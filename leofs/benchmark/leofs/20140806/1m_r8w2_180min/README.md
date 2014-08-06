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
             Current ring hash : faa85a90
                Prev ring hash : faa85a90
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at         
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | faa85a90       | faa85a90       | 2014-08-05 14:02:13 +0900
  S    | leofs15@192.168.100.15      | running      | faa85a90       | faa85a90       | 2014-08-05 14:02:13 +0900
  S    | leofs16@192.168.100.16      | running      | faa85a90       | faa85a90       | 2014-08-05 14:02:13 +0900
  S    | leofs17@192.168.100.17      | running      | faa85a90       | faa85a90       | 2014-08-05 14:02:13 +0900
  S    | leofs18@192.168.100.18      | running      | faa85a90       | faa85a90       | 2014-08-05 14:02:13 +0900
  G    | leofs13@192.168.100.13      | running      | faa85a90       | faa85a90       | 2014-08-05 14:02:19 +0900

```

* basho-bench Configuration:
    * Duration: 180 minutes
    * # of concurrent processes: 64
    * # of keys: 100000
    * Value size groups(byte):
        *   1024..10240:   24%
        *  10241..102400:  30%
        * 102401..819200:  30%
        * 819201.. 1572864:16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/leo-project/leofs/blob/develop/test/src/basho_bench_driver_leofs.erl)
    * Configuration file: [1m_r8w2_180min.conf](20140805_140333/1m_r8w2_180min.conf)

### OPS and Latency:

![ops-latency](20140805_140333/summary.png)

### Network Traffic
#### Chart of Each Nodes

* Gateway-1
![Gateway-1](leofs13_20140805_140332/sar_1_20140805_140332_p1p1-if1.png)

* Storage-1
![Storage-1](leofs14_20140805_140332/sar_3_20140805_140332_p1p1-if1.png)

* Storage-2
![Storage-2](leofs15_20140805_140332/sar_3_20140805_140332_p1p1-if1.png)

* Storage-3
![Storage-3](leofs16_20140805_140332/sar_3_20140805_140332_p1p1-if1.png)

* Storage-4
![Storage-4](leofs17_20140805_140332/sar_3_20140805_140332_p1p1-if1.png)

* Storage-5
![Storage-5](leofs18_20140805_140332/sar_2_20140805_140332_p1p1-if1.png)


### Disk
#### Chart of Each Nodes (Storage)

* Storage-1
![Storage-1](leofs14_20140805_140332/sar_3_20140805_140332_dev8-16-t1.png)
![Storage-1](leofs14_20140805_140332/sar_3_20140805_140332_dev8-16-t2.png)

* Storage-2
![Storage-2](leofs15_20140805_140332/sar_3_20140805_140332_dev8-16-t1.png)
![Storage-2](leofs15_20140805_140332/sar_3_20140805_140332_dev8-16-t2.png)

* Storage-3
![Storage-3](leofs16_20140805_140332/sar_3_20140805_140332_dev8-16-t1.png)
![Storage-3](leofs16_20140805_140332/sar_3_20140805_140332_dev8-16-t2.png)

* Storage-4
![Storage-4](leofs17_20140805_140332/sar_3_20140805_140332_dev8-16-t1.png)
![Storage-4](leofs17_20140805_140332/sar_3_20140805_140332_dev8-16-t2.png)

* Storage-5
![Storage-5](leofs18_20140805_140332/sar_2_20140805_140332_dev8-16-t1.png)
![Storage-5](leofs18_20140805_140332/sar_2_20140805_140332_dev8-16-t2.png)


#### Summary

* Total of network traffic: 5.92 Gbps
* Itemized results:

   Node   |Read(MB/s)|Write(MB/s)|Total(MB/s)
----------|---------:|----------:|---------------:
gateway_0 |     70.3 |     341.8 |    412.1
storage_0 |     44.9 |      27.3 |     72.2
storage_1 |     41.0 |      27.3 |     68.3
storage_2 |     41.1 |      27.3 |     68.4
storage_3 |     41.1 |      27.3 |     68.4
storage_4 |     41.1 |      27.8 |     68.9
total     |    279.5 |     478.8 |    758.3
