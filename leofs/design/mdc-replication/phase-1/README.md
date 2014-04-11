# LeoFS's Multi Data Center Replication (Phase 1)

If you look at the big idea at LeoFS, what we're really focused on is **High Scalability**, **High Availability** and **High Cost Performance Ratio** because as you know, unstructured data have been exponentially increasing day by day, so we need to build **Global Scale Storage System** at low cost.

I've been considering how realize LeoFS's multi data center replication more simply without SPOF - *Single Point Of Failure* and degraded the performance.

We designed the multi data center replication as the follows.


## Set configuration of clusters
![slide-002](slides/slide-002.jpg)

First, it is necessary that you set [the configurations](http://leo-project.net/leofs/docs/configuration.html#the-consistency-level) which are *consistency-level*, *max number of joinnable clusters* and *number of replicas a data center* both the local cluster and the remote cluster(s).

Also, the 1st phase of multi data center replicaion suppored *asynchronous replication between clusters*


## Join between clusters
![slide-003](slides/slide-003.jpg)

Next, you execute [join-cluster](http://leo-project.net/leofs/docs/admin_guide.html#join-cluster-communicate-between-the-local-cluster-and-a-remote-cluster) on the manager-cosole in order to communicate between the clusters. It is necessary that you take notice of the configuration - *max number of joinnable clusters*. When the set value is exceeded, leo_manager will reject your request.

Finally, you confirm that the preliminary work is complete and correct with [cluster-status](http://leo-project.net/leofs/docs/admin_guide.html#cluster-status-retrieve-current-status-of-clusters)


## Replication - 3 replicas are stored into the local cluster
![slide-004](slides/slide-004.jpg)

We adopted that the way of the multi data center replication is **aynchronous-replication** between clusters at the 1st phase.

*leo_storage* is prior to replicate an object in the local cluster. If successful that, it is stacked into a container in order to realize *the bulk transfer*. On the other hand the process was fail, it is not stacked.


## Replication - Stacking objects into leo_storage(s)
![slide-005](slides/slide-005.jpg)

An object with a metadata is stacked into a container for replication to remote cluster(s).

The default capacity of the stacking object container is [32MB](https://github.com/leo-project/leo_storage/blob/1.0.0/priv/leo_storage.conf#L106). the stacked object is transfered after the capacity over. Also, when not received requests for [30sec](https://github.com/leo-project/leo_storage/blob/1.0.0/priv/leo_storage.conf#L109), the objects in the container by stacked now is transfered. You're able to rewrite both values.


## Replication - Transfer stacked objects to remote cluster(s)
![slide-006](slides/slide-006.jpg)

A stacked objects is compressed with LZ4 in order to reduce network traffic. Destination nodes - *primary and secondary* are randomly chosen from nodes of a destination cluster in order to restrict unbalanced requests.

A accepted node uncompresses a received file - *a compressed stacked objects*, then original objects are replicated into its cluster.


## Comapare replicated objects and fix inconsistent objects
![slide-007](slides/slide-007.jpg)

The node of the local cluster receives metadatas of trasfered objects, then compare them between clusters in order to find and fix inconsistent objects eventually. Inconsistent objects are stacked into the container, again.


## Wrap up

We designed this mechanism/function without make a sacrifice of the performance and the availability but it is now 1st phase. So we're going to improve and increase it, going forward.
