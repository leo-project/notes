*Storage* consists of object and the metadata storage. In addition, it includes replicator and repairer in order to realise  [eventualy consistency](http://en.wikipedia.org/wiki/Eventual_consistency). 

*The object storage* manages and stores both an object and a metadata, which merges as a needle.
*The metadata storage* manages and stores attributes of an object which includes filename, size, checksum, and so on. And it depends of [bitcask](https://github.com/basho/bitcask) or [leveldb](https://github.com/basho/eleveldb).


LeoFS supports to handle a large size object since v0.12. The purpose of this function is 2 things:

* 1st one is to equalize disk usage of every storage node.
* 2nd one is to realize high I/O efficiency and high availability.
