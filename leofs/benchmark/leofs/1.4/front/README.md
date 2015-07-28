## front stress test
### Test list

|#|name|# of objects|operations - read(%):write(%)|watchdog|auto-compaction|# of mq-procs|max batch-procs|# of batch-procs(regular)|# of batch-procs(max)|interval between batch-procs(msec)|
|---:|:---|:-:|:-:|:-:|:-:|--:|--:|--:|--:|--:|--:|--:|  
|1|[20150717_1m_r8w2_60min_1](20150717_1m_r8w2_60min_1)|100000|80%:20%|Yes|Yes|8|1000|2400|3000|250|
|2|[20150721_1m_r99w1_4320min_1](20150721_1m_r99w1_4320min_1)|100000|99%:1%|Yes|Yes|8|1000|2400|3000|250|
|3|[20150722_1m_r29w1_360min_1](20150722_1m_r29w1_360min_1)|100000|96.7%:3.3%|Yes|Yes|8|3000|1600|3000|500|
|4|[20150723_1m_r29w1_360min_1](20150723_1m_r29w1_360min_1)|100000|96.7%:3.3%|Yes|Yes|8|3000|1600|3000|500|
|5|[20150727_1m_r29w1_720min_1](20150727_1m_r29w1_720min_1)|100000|96.7%:3.3|Yes|Yes|8|3000|1600|3000|500|
|6|[20150728_1m_r19w1_360min_1](20150728_1m_r19w1_360min_1)|100000|95%:5%|Yes|Yes|8|3000|1600|3000|500|
