## Recover node with front stress test
### Test list

|name|wd|cpt|mq_p|p_mx|p_r|p_s|i_mx|i_r|i_s|
|:---|:-:|:-:|--:|--:|--:|--:|--:|--:|--:|  
[20150515_recover_node_1.2.9](20150515_recover_node_1.2.9)|No|No|8|10000|5000|250|1000|10|10|
[20150519_recover_node_1.2.9](20150519_recover_node_1.2.9)|Yes|Yes|8|10000|5000|250|1000|10|10|
[20150520_recover_node_1.2.9](20150520_recover_node_1.2.9)|Yes|Yes|8|10000|5000|250|1000|10|10|
[20150521_recover_node_1.2.10_dev](20150521_recover_node_1.2.10_dev)|Yes|Yes|8|10000|5000|250|1000|10|10|
[20150528_recover_node_1.2.10](20150528_recover_node_1.2.10)|Yes|Yes|8|10000|5000|250|1000|10|10|
[20150601_recover_node_1.2.10_default](20150601_recover_node_1.2.10_default)|Yes|Yes|8|5000|3000|250|1000|10|10|
[20150604_recover_node_1.2.10_default2](20150604_recover_node_1.2.10_default2)|Yes|No|8|5000|3000|250|1000|10|10|
[20150612_recover_node_1.2.11-dev](20150612_recover_node_1.2.11-dev)|No|Yes|2|1000|100|10|3000|500|50|
[20150616_recover_node_1.2.11-dev2](20150616_recover_node_1.2.11-dev2)|No|Yes|2|1000|200|10|3000|500|50|

- wd: Watchdog
- cpt: Auto-Compaction
- mq_p: num of MQ procs
- p_mx: num of batch procs max
- p_r : num of batch procs regular
- p_s: num of batch procs step
- i_mx: interval between batch procs max
- i_r: interval between batch procs regular
- i_s: interval between batch procs step
