# マイクラサーバー構築（案）

## 作成予定のマイクラサーバー
ロビー、建築、装置、資源、旧データ(Realmsで使っていたワールドをJava版に変換する)

## マイクラサーバー（ソフト）
Pufferfish  
https://github.com/pufferfish-gg/Pufferfish

## プロキシサーバー
Velocity  
※クライアントが 1.13 から対応

## プラグイン
| Plugin                     | Memo                                                                                                           |
|----------------------------|----------------------------------------------------------------------------------------------------------------|
| Advanced-Portals           | サーバー間の移動用ポータル<br/>https://github.com/sekwah41/Advanced-Portals/<br/>https://advancedportals.sekwah.com/ |
| MySQL Player Data Bridge   | サーバー間のプレイヤー情報を共有するためのプラグイン                                                           |
| GeyserSkinManager          | 統合版スキンを反映する<br/>https://github.com/Camotoy/GeyserSkinManager                                                                                         |
| Geyser                     | 統合版クライアントのパケットをJava版のパケットに変換するプラグイン<br/>https://geysermc.org/download                                             |
| Floodgate                  | 統合版クライアントを認証無しで接続可能にする<br/>https://geysermc.org/wiki/floodgate/setup                                                                   |
| LuckPerms                  | 高性能な権限管理プラグイン。コマンドはもちろん、Webページで権限の編集も可能。                                  |
| MCXboxBroadcastGeyser      | Xboxのゲーマータグのフレンド登録だけでサーバーに参加することができる補助クライアント。<br/>Geyserとの併用が必須。<br/>https://github.com/MCXboxBroadcast/Broadcaster   |
| ViaVersion                 | 新しいクライアントバージョンを接続可能にする (クライアントver > サーバーver の場合も接続可能になる)<br/>https://github.com/ViaVersion/ViaVersion            |
| ViaBackwards               | 古いクライアントバージョンを接続可能にする (クライアントが 1.8～最新版)<br/>https://github.com/ViaVersion/ViaBackwards                                        |
| WorldEdit                  | https://www.curseforge.com/minecraft/mc-mods/worldedit                                                                                                               |
| WorldGuard                 | 火,TNT,クリーパーなどを含めて各種の破壊からのワールド保護機能。<br/>https://dev.bukkit.org/projects/worldguard                                                |

※ MCXboxBroadcastGeyser はプラグインではなくサーバーっぽい感じでした。

## 作成するサーバー
1. Switch用特集サーバー (BedrockConnect)
2. Proxyサーバー (Velocity)
3. MySQLサーバー
4. ロビーサーバー (Minecraft:PufferfishMC)
5. 建築サーバー (Minecraft:PufferfishMC)
6. 装置サーバー (Minecraft:PufferfishMC)
7. 資源サーバー (Minecraft:PufferfishMC)
8. 旧サーバー (Minecraft:PufferfishMC)

## 備考

DNSを用意するのは Switch 用、Switchを無くせば「DNS」と「BedrockConnect」は不要になる。  
Multiverse-Core のほうが楽そうだがサーバー分散が可能なこちらの構図を考えてみた。  
  
nginx のリバースプロキシ機能でIPアドレスを非公開にできるのでセキュリティ対策になる？  

## 構成図

![システム構成図](システム構成図.drawio.svg)

## Docker イメージについて

可能な限り小さいイメージを使いたいため distroless をベースに Dockerfile を作成する予定で進める。  
  
必要なもの
1. MySQLのイメージはなさそう、プラグインは「[MySQL Experience Bridge](https://www.spigotmc.org/resources/mysql-experience-bridge.7783/)」が一番良さそうだが無理そう？
2. MongoDB Distroless [Image](https://github.com/tran4774/mongodb-distroless) ならありそう。プラグインは「[MongoDB Player Data Bridge 0.2](https://www.spigotmc.org/resources/mongodb-player-data-bridge.113091/)」
3. 出来ればDBはPostgreSQLを使いたいため「[MySQL Experience Bridge](https://www.spigotmc.org/resources/mysql-experience-bridge.7783/)」プラグインを改良するのも考える。コード量も小さいため結構楽そう？(Java言語は好まないため触りたくはないが・・・)
4. Java環境は「[Azul Zulu Distroless](https://hub.docker.com/r/azul/zulu-openjdk-distroless)」のDockerイメージを使う予定。CRaCをサポートしていてJavaアプリの起動が速いらしい。

### Dockerイメージの数

1. DB用 (MySQL, PostgreSQL, etc..)
2. ワールド用 PufferfishMC
3. その他Java実行環境

3種類の Dockerfile を作る事でイメージは作れそうかも？  
