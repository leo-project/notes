## Feature
 - LeoFS have covered almost major [Amazon S3 REST API](http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html) but not all.
 - If you use [the Multipart upload API](http://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html), the size of a part must be less than the size of a chunked object in LeoFS.

SEE:
* [Amazon S3 API and Interface](http://leo-project.net/leofs/docs/s3_api.html)
* [Configuration of Gateway nodes](http://leo-project.net/leofs/docs/configuration_3.html)

## Operations
 - When you upgrade your LeoFS, you can not change the [KVS](http://en.wikipedia.org/wiki/Key/value_store#Key.E2.80.93Value_or_KV_stores)(`bitcask` or `leveldb` can be used in LeoFS) used by LeoFS Storage. In future, LeoFS will provide a tool which enable to change the KVS.
 - Compaction is needed to execute manually for now. In future, LeoFS will provide the feature `Auto Compaction` with LeoFS v1.2.

SEE:
* [Configuration of Storage nodes](http://leo-project.net/leofs/docs/configuration_2.html)
* [Upgrade your old version LeoFS to v1.0.2](http://leo-project.net/leofs/docs/admin_guide_5.html)

## NFS

 - NFS実装はNFSv3のサブセット。ロック機構、認証機構、所有者、パーミッション管理は未実装（アルファ版）
 - NFSを利用する場合は、LeoFSのチャンクサイズを1MB以下にしないとディスク使用効率が悪化する。
