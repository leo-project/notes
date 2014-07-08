Gateway consists of Fast HTTP-Server - [Cowboy](https://github.com/extend/cowboy), the API handler and the cache mecanism. It provides [the REST-API](http://leo-project.net/leofs/docs/rest_api.html) and [Amazon S3-API](http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html). You're able to easily access LeoFS with S3-Clients such as [s3cmd](http://s3tools.org/s3cmd), [DragonDisk](http://www.dragondisk.com/), program languages - Erlang, Java, Ruby, Python and Go-lang.

A client requests an object or a bucket operation to Gateway then Gateway requests the message of operation to a storage-node.

A destination storage node is decided by the routing-table, which is called RING. RING is generated and provided at Manager and which is based on consistent-hashing.

Also, Gateway provides built-in support for the object-cache mechanism in order to realize Keeping high performance and reduction of traffic between Gateway and Storage.
