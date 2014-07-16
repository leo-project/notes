## Feature
 - LeoFS have covered almost major [Amazon S3 REST API](http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html) but not all.
 - If you use [the Multipart upload API](http://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html), the size of a part of an object should be less than the size of a chunked object in LeoFS.

SEE:
* [Amazon S3 API and Interface](http://leo-project.net/leofs/docs/s3_api.html)
* [Configuration of Gateway nodes](http://leo-project.net/leofs/docs/configuration_3.html)

## Operations
 - When you upgrade your LeoFS, you can not change the metadata storage as [KVS](http://en.wikipedia.org/wiki/Key/value_store#Key.E2.80.93Value_or_KV_stores)  (`bitcask` or `leveldb` can be used in LeoFS) used by LeoFS Storage. In the future, we will provide the data converting tool which enables to take over the metadata.
 - Compaction is needed to execute manually for now. We're planning to provide the feature `Auto Compaction` with LeoFS v1.2.

SEE:
* [Configuration of Storage nodes](http://leo-project.net/leofs/docs/configuration_2.html)
* [Upgrade your old version LeoFS to v1.0.2](http://leo-project.net/leofs/docs/admin_guide_5.html)
* [The roadmap of LeoFS](http://leo-project.net/leofs/docs/faq_1.html#is-there-the-roadmap-of-leofs)

## NFS

 - NFS implemantation with LeoFS v1.1 is a subset of [NFS v3](http://www.ietf.org/rfc/rfc1813.txt). Lock manager protocol, Authentication, and Owner/Permission management are not covered.
 - If you use LeoFS with NFS, you should set the size of a chunked object in LeoFS  to `1MB (1048576Bytes)`, otherwise the efficiency of disk utilization can be decreased.

SEE:
* [Configuration of Gateway nodes](http://leo-project.net/leofs/docs/configuration_3.html)
* [NFS R/W transfer block size is limited up to 1MB](https://github.com/leo-project/leofs/issues/198)
