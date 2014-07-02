## LeoFS fundamentals
* What's LeoFS?
* What's difference from block storage?
* Does LeoFS support NFS?
* What are typical uses for LeoFS?
* What's architecture of LeoFS?
* How does LeoFS store objects?
* What's the role of Manager?
* キャッシュメカニズムはどうなっているか
* キャッシュの時間
* オブジェクト名で使用可能な特殊文字
* バケット名のルールはあるか
* How does LeoFS work on Multi-DC replication?
* How do I do a compaction?
* What language is LeoFS written in?
* What's the roadmap for LeoFS?

## LeoFS for administrators
## Install LeoFS
* What's required machine spec?
* ディスク構成について
* rpmをインストールするときにバージョンが古いと怒られる

### Configuration
* 設定ファイルにはIPアドレスとホスト名のどちらを記載すべきか
* 設定ファイルでconfig.cache_max_content_lenの設定値
* config.cache_disk_threshold_lenの設定値
* Total replicasとDC-awareness replicasの違いは
* ブロックサイズの設定はあるか

### Launch and stop LeoFS
* 起動ユーザについて
* 停止時の注意点

### The way of LeoFS operation
* コンパクション時にノードを停止させる必要があるか
* 冗長度は変えられるか
* バージョンアップ方法
* バケットの制限はあるか
* 起動中のLeoFSに新しい設定ファイルを反映させる方法はあるか
* リバランスを止めることができるか
* リバランス・リカバーの速度変更はどうするか
* ノード追加したときのデータはどこにいくか
* アップデート方法は？
* コンパクションは自動で行われるか
* エラー検知時にノードの自動追加・削除がされるか

### Trouble shooting
* ディスクフルとなった時の対応
* コンパクション時にhttp_errorが頻発する
* インストールは問題ないのに Storage ノードが起動しない

## LeoFS for application developer
* How can I access to LeoFS?
* When others update an object, how can I get the newest file?
* If I remove a document, does LeoFS remove it from disk?
