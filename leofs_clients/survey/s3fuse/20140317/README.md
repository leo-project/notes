Title
=====
[s3fuse](https://code.google.com/p/s3fuse/) HTTP Object Request and Response analysis of s3fuse
e.g. $cp ./local-file /mount/directory

Purpose
=======
* How "Upload" or "cp" operation carried out in Application Layer

How to test
===========
Install fresh LeoFS,tcpdump, and wireshark utility to Analyse packet header.   

* LeoFS cluster information
    * Server: CentOS 6.3
    * LeoFS : 1.0.0-pre3(checkout develop brach with latest patches)
    * s3fuse: 0.15(https://github.com/s3fs-fuse/s3fs-fuse)
    * fuse:   2.8.4
    * Consistency: N:3, R:1, D:1, W:2
    * Storage Node:4, Manger:2, Gateway:1, and Replica:2

* Test Procedure:
    * Created Octet-stream Binary file with size 1 MB
    * 'tcpdump' utility running in background with file save and filter option "e.g.  $tcpdump -n -i lo -s 0 -w s3fuse.log src or dst port 8080"
    * Create sample bucket 'test' and mount it on directory. "e.g.$s3fuse -o allow_other /mnt/s3fuse" config file as same as given READE.md
    * Upload 1MB file and test log file into wireshark utility for the request and packet pattern observation.
    * In above result we uploaded one object size of 1 MB but total number of objects shows 3 
    * WireShark Packet log Observation:
        1. Too Many 'HEAD' Request.
        2. Extra PUT request.
        3. UnExpected PUT request.
        4. Spending Operation TIME two time and space two time than actual.
        5. Unexpected time-stamp change after upload operation.
* Outputs :
    * In two seconds around 10 HEAD Object Request founded.
    * 3 PUT Object Request founded First. Second and Third PUT Request Content-Length according to order 0B,1MB,0B.
    * Last Put Object Request having **x-amz-copy-source field** ***Malicious or Extra Packet which is might be responsible for time-stamp change.
```
PUT /test/REAME.temp HTTP/1.1
Host: localhost:8080
Accept: */*
Authorization: AWS 05236:LP6n4zojwLfweHZcFbmL0o65Rlk=
Content-Type: application/octet-stream
Date: Mon, 17 Mar 2014 06:48:15 GMT
x-amz-copy-source: /test/REAME.temp
x-amz-copy-source-if-match: "b6d81b360a5672d80c27430f39153e2c"
x-amz-meta-s3fuse-ctime: 0
x-amz-meta-s3fuse-gid: 498
x-amz-meta-s3fuse-lu-etag: "b6d81b360a5672d80c27430f39153e2c"
x-amz-meta-s3fuse-mode: 0755
x-amz-meta-s3fuse-mtime: 1395038895
x-amz-meta-s3fuse-sha256: 1e49e9921b750b1d13299abf9288e19bee5b99b0d89fb8fc591cedf0dc14a968
x-amz-meta-s3fuse-uid: 498
x-amz-metadata-directive: REPLACE
Content-Length: 0
Expect: 100-continue

```
    * LeoFs 'du $stoarage_cluster' gives following strange results for 1 MB file upload operation:
``` 
     active number of objects: 1
  total number of objects: 3
   active size of objects: 1048803.0
    total size of objects: 2097833.0
     ratio of active size: 49.99%
    last compaction start: ____-__-__ __:__:__
      last compaction end: ____-__-__ __:__:__
 active number of objects: 1
  total number of objects: 3
   active size of objects: 1048803.0
    total size of objects: 2097833.0
     ratio of active size: 49.99%
    last compaction start: ____-__-__ __:__:__
      last compaction end: ____-__-__ __:__:__
 active number of objects: 0
  total number of objects: 0
   active size of objects: 0
    total size of objects: 0
     ratio of active size: 0%
    last compaction start: ____-__-__ __:__:__
      last compaction end: ____-__-__ __:__:__
 active number of objects: 0
  total number of objects: 0
   active size of objects: 0
    total size of objects: 0
     ratio of active size: 0%
    last compaction start: ____-__-__ __:__:__
      last compaction end: ____-__-__ __:__:__
```
    * For the big size file if we observe upload progress, size and time-stamp. "e.g. watch timestamp s3cmd ls s3:\\bucketname\filename" It chages timestamp of file two times.

Disadvantages 
=============
* Waste of Bandwidth and storage space. frequently storage compaction required.
* Due to too many Head request stress on server and network packet collision possibility.
* Double time spending for every operation and wrong timestamp of object creation.
     