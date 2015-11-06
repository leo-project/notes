# Benchmark leo_erasure
## Purpose
Compare Encoding Throughput of RS (10,4,8) between ISA-L and JErasure

## Test Cases
* ISA-L (v2.14.0)
    * [https://01.org/intel®-storage-acceleration-library-open-source-version]()
* JErasure (2.0)
    * [https://github.com/leo-project/jerasure.git]()
* Encoding
    * Object size: 5MB
    * Coding: Reed-Solomon Code [K:10, M:4, W:8]
    * Concurrency: 30

## Environment
* Setup Server (`ser`)
    * CPU: 2x Intel Xeon X5650
* Erlang: Erlang/OTP 17.5

## Benchmark results
### Server
#### ISA-L
![ser_isars](ser_isars_t30/summary.png)
#### JErasure
![ser_rs](ser_rs_t30/summary.png)
