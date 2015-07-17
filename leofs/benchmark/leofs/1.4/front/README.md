## front stress test
### Test list

|#|name|# of objects|recover-node's duration(min)|wd|cpt|mq_p|p_mx|p_r|p_s|i_mx|i_r|i_s|
|---:|:---|:-:|:-:|:-:|:-:|--:|--:|--:|--:|--:|--:|--:|  
|1|[20150717_1m_r8w2_60min_1](20150717_1m_r8w2_60min_1)|100000|No|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|

- wd: Watchdog
- cpt: Auto-Compaction
- mq_p: num of MQ procs
- p_mx: num of batch procs max
- p_r : num of batch procs regular
- p_s: num of batch procs step
- i_mx: interval between batch procs max
- i_r: interval between batch procs regular
- i_s: interval between batch procs step
