## Delete Bucket test LeoFS v1.1.3

### Environment

* OS: CentOS release 6.5 (Final)
* Erlang/OTP: R16B03-1
* LeoFS: v1.1.2
* LeoFS cluster settings:

```
status
[System config]
                System version : 1.1.3
                    Cluster Id : leofs_1
                         DC Id : dc_1
                Total replicas : 3
           # of successes of R : 1
           # of successes of W : 2
           # of successes of D : 2
 # of DC-awareness replicas    : 0
                     ring size : 2^128
             Current ring hash : 7f02a8e7
                Prev ring hash : 7f02a8e7
[Multi DC replication settings]
         max # of joinable DCs : 2
            # of replicas a DC : 1

[Node(s) state]
-------+-----------------------------+--------------+----------------+----------------+----------------------------
 type  |            node             |    state     |  current ring  |   prev ring    |          updated at
-------+-----------------------------+--------------+----------------+----------------+----------------------------
  S    | leofs14@192.168.100.14      | running      | 7f02a8e7       | 7f02a8e7       | 2014-09-18 12:46:42 +0900
  S    | leofs15@192.168.100.15      | running      | 7f02a8e7       | 7f02a8e7       | 2014-09-18 12:46:42 +0900
  S    | leofs16@192.168.100.16      | running      | 7f02a8e7       | 7f02a8e7       | 2014-09-18 12:46:42 +0900
  S    | leofs17@192.168.100.17      | running      | 7f02a8e7       | 7f02a8e7       | 2014-09-18 12:46:42 +0900
  S    | leofs18@192.168.100.18      | running      | 7f02a8e7       | 7f02a8e7       | 2014-09-18 12:46:42 +0900
  G    | leofs13@192.168.100.13      | running      | 7f02a8e7       | 7f02a8e7       | 2014-09-18 12:46:48 +0900
```
* # of keys: 100000

### Delete bucket:

* avs file extractor [listup_avs.rb](https://github.com/firejun/leofs_utils/blob/master/tools/listup_avs.rb)
* avs file list of before 'delete-bucket' [before_delete_bucket.txt](before_delete_bucket.txt)
* avs file list of after 'delete-bucket' [after_delete_bucket.txt](after_delete_bucket.txt)
* Compare result [compare_delete_bucket.txt](compare_delete_bucket.txt)

* Store data of 100000 keys.

* Delete bucket
```
delete-bucket ${bucket} ${access-key-id}
```

* Check disk usage
- Before compaction
```
du leofs14@192.168.100.14
 active number of objects: 66002
  total number of objects: 264008
   active size of objects: 9628995
    total size of objects: 22844658178
     ratio of active size: 0.04%
    last compaction start: ____-__-__ __:__:__
      last compaction end: ____-__-__ __:__:__
```

* Execute Compaction after 'delete-bucket'
```
compact start leofs14@192.168.100.14 all
OK
```

* Check status
```
compact status leofs14@192.168.100.14
        current status: running
 last compaction start: 2014-09-19 13:34:49 +0900
         total targets: 8
  # of pending targets: 5
  # of ongoing targets: 3
  # of out of targets : 0

compact status leofs14@192.168.100.14
        current status: idling
 last compaction start: 2014-09-19 13:34:49 +0900
         total targets: 8
  # of pending targets: 8
  # of ongoing targets: 0
  # of out of targets : 0
```

* Check disk usage
- After compaction
```
du leofs14@192.168.100.14
 active number of objects: 0
  total number of objects: 0
   active size of objects: 0
    total size of objects: 0
     ratio of active size: 0%
    last compaction start: 2014-09-19 13:36:17 +0900
      last compaction end: 2014-09-19 13:36:50 +0900
```

* Result of 'ls'
```
/data/object
total 32
lrwxrwxrwx 1 leofs leofs  30 Sep 19 13:35 0.avs -> /data/object/0.avs_63578320489
-rw-r--r-- 1 leofs leofs 194 Sep 19 13:34 0.avs_63578320489
lrwxrwxrwx 1 leofs leofs  30 Sep 19 13:35 1.avs -> /data/object/1.avs_63578320489
-rw-r--r-- 1 leofs leofs 194 Sep 19 13:34 1.avs_63578320489
lrwxrwxrwx 1 leofs leofs  30 Sep 19 13:35 2.avs -> /data/object/2.avs_63578320489
-rw-r--r-- 1 leofs leofs 194 Sep 19 13:34 2.avs_63578320489
lrwxrwxrwx 1 leofs leofs  30 Sep 19 13:36 3.avs -> /data/object/3.avs_63578320533
-rw-r--r-- 1 leofs leofs 194 Sep 19 13:35 3.avs_63578320533
lrwxrwxrwx 1 leofs leofs  30 Sep 19 13:36 4.avs -> /data/object/4.avs_63578320533
-rw-r--r-- 1 leofs leofs 194 Sep 19 13:35 4.avs_63578320533
lrwxrwxrwx 1 leofs leofs  30 Sep 19 13:36 5.avs -> /data/object/5.avs_63578320533
-rw-r--r-- 1 leofs leofs 194 Sep 19 13:35 5.avs_63578320533
lrwxrwxrwx 1 leofs leofs  30 Sep 19 13:36 6.avs -> /data/object/6.avs_63578320577
-rw-r--r-- 1 leofs leofs 194 Sep 19 13:36 6.avs_63578320577
lrwxrwxrwx 1 leofs leofs  30 Sep 19 13:36 7.avs -> /data/object/7.avs_63578320577
-rw-r--r-- 1 leofs leofs 194 Sep 19 13:36 7.avs_63578320577
```

* This test was successful.
