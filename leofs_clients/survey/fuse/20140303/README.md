Title
=====
[s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse) and [s3fuse](https://code.google.com/p/s3fuse/) performance test


Purpose
=======
* Compare performance of [s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse) and [s3fuse](https://code.google.com/p/s3fuse/)
* Confirm performance effect of leveldb


How to test
===========
Measure the time of `ls` command on mouted directory with the `time` command.

* Test cases
  * Case1
  ```
  /s3fs-fuse
  `-- bucket1        # execute ls here
      |-- object1
      |-- object2
      |-- ...
      `-- object10000
  ```

  * Case2
  ```
  /s3fs-fuse
  `-- bucket1        # execute ls here
      |-- object1
      |-- object2
      |-- ...
      |-- object10000
      |
      |-- directory1
      |   `-- object1
      |-- directory2
      |   `-- object1
      |-- ...
      `-- directory1000
          `-- object1
  ```

  * Case3
  ```
  /s3fs-fuse
  `-- bucket1
      |-- object1
      |-- object2
      |-- ...
      |-- object10000
      |
      |-- directory1    # execute ls here
      |   `-- object1
      |-- directory2
      |   `-- object1
      |-- ...
      `-- directory1000
          `-- object1
  ```

  * Case4
  ```
  /s3fs-fuse
  `-- bucket1        # execute ls here
      |-- object1
      |-- object2
      |-- ...
      |-- object20000
      |
      |-- directory1
      |   `-- object1
      |-- directory2
      |   `-- object1
      |-- ...
      `-- directory1000
          `-- object1
  ```

  * Case5
  ```
  /s3fs-fuse
  `-- bucket1        # execute ls here
      |-- object1
      |-- object2
      |-- ...
      |-- object100000
      |
      |-- directory1
      |   `-- object1
      |-- directory2
      |   `-- object1
      |-- ...
      `-- directory1000
          `-- object1
  ```

  * Case6
  ```
  /s3fs-fuse
  |-- bucket1
  |   |-- object1
  |   |-- object2
  |   |-- ...
  |   |-- object100000
  |   |
  |   |-- directory1
  |   |   `-- object1
  |   |-- directory2
  |   |   `-- object1
  |   |-- ...
  |   `-- directory1000
  |       `-- object1
  `-- bucket2           # execute ls here
      |-- object1
      |-- object2
      |-- ...
      `-- object10000
  ```

* LeoFS cluster information
    * Server:       CentOS 6.3
    * LeoFS :       1.0.0-pre3
    * fuse:         2.9.3
    * s3fuse:       0.15-1
    * s3fs-fuse:    1.76
    * consistency:  N:1, R:1, D:1, W:1
    * # of servers: G:1, S:3


Results
=======
* Metadata storage = **bitcask**

| Case | Return data             | s3fuse     | s3fs-fuse  |
| ---- | ----------------------- | ---------- | ---------- |
| 1    | 10,000 obj              | 21.550s    | 26.631s    |
| 2    | 10,000 obj + 1,000 dir  | 25.566s    | 31.497s    |
| 3    | 1 obj                   | 0.295s     | 1.170s     |
| 4    | 20,000 obj + 1,000 dir  | 1m24.149s  | 1m26.722s  |
| 5    | 100,000 obj + 1,000 dir | 14m34.517s | 13m45.185s |
| 6    | 10,000 obj              | 40.001s    | 38.176s    |

* Metadata storage = **leveldb**

| Case | Return data             | s3fuse     | s3fs-fuse  |
| ---- | ----------------------- | ---------- | ---------- |
| 1    | 10,000 obj              | 20.765s    | 25.565s    |
| 2    | 10,000 obj + 1,000 dir  | 23.175s    | 29.625s    |
| 3    | 1 obj                   | 0.019s     | 0.043s     |
| 4    | 20,000 obj + 1,000 dir  | 1m19.911s  | 1m27.954s  |
| 5    | 100,000 obj + 1,000 dir | 14m12.332s | 14m7.882s  |
| 6    | 10,000 obj              | 20.113s    | 26.145s    |

Conclusion
==========
* s3fuse is a little faster than s3fs-fuse on the small number of objects.
* leveldb is unaffected by other buckets. Case6 show almost same performance with case1 and case3 show good performance.