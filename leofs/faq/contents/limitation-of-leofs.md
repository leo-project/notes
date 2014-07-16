## Feature
 - We have covered almost major [Amazon S3 REST API](http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html) but not all.
 - If you use [the Multipart upload API](http://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html), the size of a part must be less than the size of a chunked object in LeoFS.

SEE:
* [Amazon S3 API and Interface](http://leo-project.net/leofs/docs/s3_api.html)
* [Configuration of Gateway nodes](http://leo-project.net/leofs/docs/configuration_3.html)

## Operations
 - LeoFSのバージョンアップ時に、metadataで利用しているKVSを変更することはできない。将来的には変換ツールを提供予定
 - Compactionは手動で実行する必要がある。1.2でAuto Compactionを提供予定

## NFS

 - NFS実装はNFSv3のサブセット。ロック機構、認証機構、所有者、パーミッション管理は未実装（アルファ版）
 - NFSを利用する場合は、LeoFSのチャンクサイズを1MB以下にしないとディスク使用効率が悪化する。
