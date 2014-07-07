We're mainly focused on is **High Availability**, **High Scalability** and **High Cost Performance Ratio** because unstructured data such as image, movie, event-data, log and so on, they have been exponentially increasing in our services day by day, so we needed to build the cloud storage with all them.

LeoFS consists of 3 core components - [Gateway](leofs-gateway-detail.md), [Storage](leofs-storage-detail.md) and [Manager](leofs-manager-detail.md). The role of each component is clearly defined.

![LeoFS architecture](images/leofs-architecture.png)

[Gateway](leofs-gateway-detail.md) handles http-request and http-response from any clients when using REST-API OR S3-API. Also, it is already built-in support for the object-cache mechanism.

[Storage](leofs-storage-detail.md) handles *GET*, *PUT* and *DELETE*, Also it has replicator and recoverer in order to keep running and keep consistency.

[Manager](leofs-manager-detail.md) always monitors Gateway(s) and Storage(s). Main monitoring status are node-status and RING(logical routing-table) checksum for keep running and keep consistency.


Also, What we carefully desined LeoFS is 3 things:
* Keep running and No SPOF
* To keep high-performance, regardless of the kind of data and amout data
* To provide easy administration, we already provide LeoFS CUI and GUI console.
