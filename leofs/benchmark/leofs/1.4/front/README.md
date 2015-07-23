## front stress test
### Test list

|#|name|# of objects|recover-node's duration(min)|wd|cpt|mq_p|p_mx|p_r|i_mx|i_r|
|---:|:---|:-:|:-:|:-:|:-:|--:|--:|--:|--:|--:|--:|--:|  
|1|[20150717_1m_r8w2_60min_1](20150717_1m_r8w2_60min_1)|100000|No|Yes|Yes|**8**|1000|**2400**|3000|**250**|
|2|[20150721_1m_r99w1_4320min_1](20150721_1m_r99w1_4320min_1)|100000|No|Yes|Yes|**8**|1000|**2400**|3000|**250**|
|3|[20150722_1m_r29w1_360min_1](20150722_1m_r29w1_360min_1)|100000|No|Yes|Yes|**8**|3000|**1600**|3000|**500**|

- wd: Watchdog
- cpt: Auto-Compaction
- mq_p: num of MQ procs
- p_mx: num of batch procs max
- p_r : num of batch procs regular
- p_s: num of batch procs step
- i_mx: interval between batch procs max
- i_r: interval between batch procs regular
