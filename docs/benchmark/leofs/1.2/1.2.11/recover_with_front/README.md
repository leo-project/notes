## Benchmark Results
### Front operations w/recover-node and auto-compaction

|#|link|# of objects|recover-node's duration(min)|wd|cpt|mq_p|p_mx|p_r|p_s|i_mx|i_r|i_s|
|:---|:---|:-:|:-:|:-:|:-:|--:|--:|--:|--:|--:|--:|--:|  
|1|[20150612_recover_node_1.2.11-dev](20150612_recover_node_1.2.11-dev)|300000|16.0min|No|Yes|**2**|1000|**100**|10|3000|**500**|50|
|2|[20150616_recover_node_1.2.11-dev2](20150616_recover_node_1.2.11-dev2)|300000|12.0min|No|No|**2**|1000|**200**|10|3000|**500**|50|
|3|[20150616_recover_node_1.2.11-dev3](20150616_recover_node_1.2.11-dev3)|300000|7.5min|No|No|**8**|1000|**800**|10|3000|**500**|50|
|4|[20150617_recover_node_1.2.11-dev3](20150617_recover_node_1.2.11-dev3)|300000|6.8min|No|No|**8**|1000|**1600**|10|3000|**500**|50|
|5|[20150617_recover_node_1.2.11-dev3_2](20150617_recover_node_1.2.11-dev3_2)|300000|6.67min|Yes|No|**8**|1000|**2400**|10|3000|**500**|50|
|6|[20150618_recover_node_1.2.11-dev3](20150618_recover_node_1.2.11-dev3)|300000|7.33min|Yes|No|**8**|1000|**4800**|10|3000|**500**|50|
|7|[20150618_recover_node_1.2.11-dev3_2](20150618_recover_node_1.2.11-dev3_2)|300000|7.33min|Yes|No|**8**|1000|**1600**|10|3000|**250**|50|
|8|[20150619_recover_node_1.2.11-dev4](20150619_recover_node_1.2.11-dev4)|300000|7.83min|Yes|No|**8**|1000|**2400**|10|3000|**250**|50|
|9|[20150622_recover_node_1.2.11-dev5](20150622_recover_node_1.2.11-dev5)|300000|8.33min|Yes|No|**8**|1000|**2400**|10|3000|**250**|50|
|10|[20150623_recover_node_1.2.11-dev6](20150623_recover_node_1.2.11-dev6)|300000|9.52min|Yes|No|**8**|1000|**2400**|10|3000|**250**|50|
|11|[20150624_recover_node_1.2.11-dev7](20150624_recover_node_1.2.11-dev7)|300000|7.83min|Yes|No|**8**|1000|**2400**|10|3000|**250**|50|
|12|[20150625_recover_node_1.2.11-dev8](20150625_recover_node_1.2.11-dev8)|300000|9.67min|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|
|13|[20150626_recover_node_1.2.11-dev9](20150626_recover_node_1.2.11-dev9)|300000|9.33min|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|
|14|[20150626_recover_node_1.2.11-dev10](20150626_recover_node_1.2.11-dev10)|300000|10.01min|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|
|15|[20150629_recover_node_1.2.11-dev11](20150629_recover_node_1.2.11-dev11)|300000|6.67min|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|
|16|[20150630_recover_node_1.2.11-dev12](20150630_recover_node_1.2.11-dev12)|300000|7.33min|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|
|17|[20150702_recover_node_1.2.11](20150702_recover_node_1.2.11)|300000|7.67min|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|
|18|[20150708_recover_node_1.2.12-dev2](20150708_recover_node_1.2.12-dev2)|300000|8.18min|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|
|19|[20150708_recover_node_1.2.12-dev2_2](20150708_recover_node_1.2.12-dev2_2)|300000|6.67min|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|
|20|[20150708_recover_node_1.2.12-dev2_3](20150708_recover_node_1.2.12-dev2_3)|300000|6.83min|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|
|21|[20150710_recover_node_1.2.12-dev3](20150710_recover_node_1.2.12-dev3)|300000|7.7min|Yes|Yes|**8**|1000|**2400**|10|3000|**250**|50|

- wd: Watchdog
- cpt: Auto-Compaction
- mq_p: num of MQ procs
- p_mx: num of batch procs max
- p_r : num of batch procs regular
- p_s: num of batch procs step
- i_mx: interval between batch procs max
- i_r: interval between batch procs regular
- i_s: interval between batch procs step
