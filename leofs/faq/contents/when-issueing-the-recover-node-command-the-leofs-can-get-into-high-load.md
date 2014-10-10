Since the recover-node command can lead to issueing lots of disk I/O and consume network bandwidth,
if you issue the recover-node to multiple nodes at once, LeoFS can get into high load and become unresponsive.
So we recommend users issueing recover-node one by one.
if this solution don't work for you, you can control how much recover-node consume system resources by changing MQ related parameters in [leo_storage.conf](http://leo-project.net/leofs/docs/configuration_2.html). 
