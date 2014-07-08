*Gateway* consists of the fast HTTP-Server - [Cowboy](https://github.com/extend/cowboy), the API handler and the cache mecanism. It provides [the REST-API](http://leo-project.net/leofs/docs/rest_api.html) and [Amazon S3-API](http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html). You're able to easily access LeoFS with S3-Clients such as [s3cmd](http://s3tools.org/s3cmd), [DragonDisk](http://www.dragondisk.com/), program languages - [Erlang](https://github.com/gleber/erlcloud), [Java](https://github.com/aws/aws-sdk-java), [Ruby](https://github.com/aws/aws-sdk-ruby), [Python](https://github.com/boto/boto), [Go-lang](https://github.com/rlmcpherson/s3gof3r) and so on.

A client requests an object or a bucket operation to *Gateway* then *Gateway* requests the message of operation to a storage-node.

A destination storage node is decided by the routing-table. It is called [RING](leofs-ring-detail.md) which is generated and provided at [Manager](leofs-manager-detail.md) and which is based on consistent-hashing.

Also, Gateway provides built-in support for the object-cache mechanism in order to realize Keeping high performance and reduction of traffic between *Gateway* and [Storage](leofs-storage-detail.md).
