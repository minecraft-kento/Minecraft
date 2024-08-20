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
| GeyserSkinManager          | 統合版スキンを反映する                                                                                         |
| Geyser                     | 統合版クライアントのパケットをJava版のパケットに変換するプラグイン                                             |
| Floodgate                  | 統合版クライアントを認証無しで接続可能にする                                                                   |
| LuckPerms                  | 高性能な権限管理プラグイン。コマンドはもちろん、Webページで権限の編集も可能。                                  |
| MCXboxBroadcastGeyser      | Xboxのゲーマータグのフレンド登録だけでサーバーに参加することができる補助クライアント。<br/>Geyserとの併用が必須。   |
| ViaVersion                 | 新しいクライアントバージョンを接続可能にする (クライアントver > サーバーver の場合も接続可能になる)            |
| ViaBackwards               | 古いクライアントバージョンを接続可能にする (クライアントが 1.8～最新版)                                        |
| WorldEdit                  |                                                                                                                |
| WorldGurad                 | 火,TNT,クリーパーなどを含めて各種の破壊からのワールド保護機能。                                                |

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

![システム構成図](mc_servers.drawio.svg)
