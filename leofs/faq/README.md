# LeoFS 
## LeoFS fundamentals
* What's LeoFS?
* What's difference from block storage?
* Does LeoFS support NFS?
* What are typical uses for LeoFS?
* What's architecture of LeoFS?
* How does LeoFS store objects?
* What's the role of Gateway?
* What's the role of Manager?
* What language is LeoFS written in?
* What's the roadmap for LeoFS?


## LeoFS for administrators
## Install LeoFS
* What's required machine spec?
* ディスク構成について
* rpmをインストールするときにバージョンが古いと怒られる

### Configuration
#### Commons
* 設定ファイルにはIPアドレスとホスト名のどちらを記載すべきか
* オブジェクト名で使用可能な特殊文字
* バケット名のルールはあるか

#### Gateway
* ``[Cache]`` 設定ファイルで ``config.cache_max_content_len`` の設定値
* ``[Cache]`` ``config.cache_disk_threshold_len`` の設定値

#### Manager
* ``[Consistency]`` ``[MDC-Replication]`` ``Total replicas`` と ``DC-awareness replicas`` の違いは

#### Storage
* ``[Storage]`` ブロックサイズの設定はあるか


### LeoFS operation
#### Commons
* 起動ユーザについて
* 停止時の注意点
* バージョンアップ方法
* アップデート方法は？
* バケットの制限はあるか
* 起動中のLeoFSに新しい設定ファイルを反映させる方法はあるか

#### Manager
* ``[Consistency]`` 冗長度は変えられるか
* ``[Rebalance]`` リバランスを止めることができるか
* ``[Rebalance]`` ``[Recovery]`` リバランス・リカバーの速度変更はどうするか

#### Storage
* ``[Compaction]`` コンパクション時にノードを停止させる必要があるか
* ``[Compaction]`` コンパクションは自動で行われるか
* ノード追加したときのデータはどこにいくか
* エラー検知時にノードの自動追加・削除がされるか

#### Gateway
* ``[Cache]``キャッシュのエクスパイア時間の設定方法


### Trouble shooting
* ディスクフルとなった時の対応
* コンパクション時にhttp_errorが頻発する
* インストールは問題ないのに Storage ノードが起動しない

## LeoFS for application developers
* How can I access to LeoFS?
* When others update an object, how can I get the newest file?
* If I remove a object, does LeoFS remove it from disk?
* How do I do a compaction?

## Inside LeoFS
* How does LeoFS work on Multi-DC replication?
* キャッシュメカニズムはどうなっているか




