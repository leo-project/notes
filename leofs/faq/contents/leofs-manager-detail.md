*Manager* generates and manages a routing table, which is called [RING]() and based on [consistent hashing](http://en.wikipedia.org/wiki/Consistent_hashing).

*Manager* always monitors every [Storage](leofs-storage-detail.md) and [Gateway](leofs-gateway-detail.md) of status and [RING]() in order to keep running LeoFS and consistency of a [RING](). And also, it distributes [RING]() to [Storage](leofs-storage-detail.md) and [Gateway](leofs-gateway-detail.md).

In addition, *Manager* provides [LeoFS administration commands](http://leo-project.net/leofs/docs/admin_guide.html) to be able to easily operate LeoFS.
*LeoFS administration commands* already cover entire LeoFS functions.
