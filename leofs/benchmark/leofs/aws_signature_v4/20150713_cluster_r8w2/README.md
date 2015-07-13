## Benchmark LeoFS 1.4-pre1

### Purpose
Compare the overhead of AWS Signature V2/V4 authentication (R: 80%, W: 20%)

## Test Cases
* v2: AWS Signature V2
* v4: AWS Signature V4 (Authorization Header, Precomputed SHA-256)

### Enviroment
* OS: CentOS release 6.5 (Final)
* Erlang/OTP: 17.5
* LeoFS: v1.4-pre1
* LeoFS cluster settings:
```
 [System Confiuration]
-----------------------------------+----------
 Item                              | Value    
-----------------------------------+----------
 Basic/Consistency level
-----------------------------------+----------
                    system version | 1.2.11
                        cluster Id | leofs_1
                             DC Id | dc_1
                    Total replicas | 2
          number of successes of R | 1
          number of successes of W | 1
          number of successes of D | 1
 number of rack-awareness replicas | 0
                         ring size | 2^128
-----------------------------------+----------
 Multi DC replication settings
-----------------------------------+----------
        max number of joinable DCs | 2
           number of replicas a DC | 1
-----------------------------------+----------
 Manager RING hash
-----------------------------------+----------
                 current ring-hash | 3b4d7a8e
                previous ring-hash | 3b4d7a8e
-----------------------------------+----------

 [State of Node(s)]
-------+-------------------------------+--------------+----------------+----------------+----------------------------
 type  |             node              |    state     |  current ring  |   prev ring    |          updated at         
-------+-------------------------------+--------------+----------------+----------------+----------------------------
  S    | storage_0@192.168.100.14      | running      | 3b4d7a8e       | 3b4d7a8e       | 2015-07-13 14:09:59 +0900
  S    | storage_1@192.168.100.15      | running      | 3b4d7a8e       | 3b4d7a8e       | 2015-07-13 14:09:59 +0900
  S    | storage_2@192.168.100.16      | running      | 3b4d7a8e       | 3b4d7a8e       | 2015-07-13 14:09:59 +0900
  S    | storage_3@192.168.100.17      | running      | 3b4d7a8e       | 3b4d7a8e       | 2015-07-13 14:09:59 +0900
  S    | storage_4@192.168.100.18      | running      | 3b4d7a8e       | 3b4d7a8e       | 2015-07-13 14:09:59 +0900
  G    | gateway_0@192.168.100.13      | running      | 3b4d7a8e       | 3b4d7a8e       | 2015-07-13 14:10:02 +0900
-------+-------------------------------+--------------+----------------+----------------+----------------------------
```

* basho-bench Configuration:
    * # of concurrent processes: 64
    * Duration: 10 mins
    * R:W = 8:2
    * Value size groups(byte):
        * 1024.. 10240: 24%
        * 10241.. 102400: 30%
        * 102401.. 819200: 30%
        * 819201..1572864: 16%
    * basho_bench driver: [basho_bench_driver_leofs.erl](https://github.com/windkit/leofs/blob/add147a7038d077c05e2c91a679c682a0b67c764/test/src/basho_bench_driver_leofs.erl)
    * Configuration file:
      * [v2.conf](v2/leofs_default_put.config)
      * [v4.conf](v4/leofs_default_put_v4.config)

### OPS and Latency:
* v2
![v2](v2/summary.png)
* v4
![v4](v4/summary.png)
