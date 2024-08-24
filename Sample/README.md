# サンプル用に作成した Docker ファイル

## システム構成図

![システム構成図](システム構成図.drawio.svg)

## リンク

1. [CoreDNS](https://github.com/coredns/coredns/releases/tag/v1.11.3)
2. [BedrockConnect](https://github.com/Pugmatt/BedrockConnect/releases/download/1.49/BedrockConnect-1.0-SNAPSHOT.jar)
3. [Pufferfish](https://ci.pufferfish.host/job/Pufferfish-1.21/11/artifact/build/libs/pufferfish-paperclip-1.21.1-R0.1-SNAPSHOT-mojmap.jar)

CoreDNS のみ debian Slim なので、機会を見て Distroless で再構築予定

## プラグイン

1. [Geyser](https://geysermc.org/download)
2. [GeyserSkinManager](https://github.com/Camotoy/GeyserSkinManager)
3. [Floodgate](https://geysermc.org/wiki/floodgate/setup)
4. [LuckPerms](https://luckperms.net/)
5. [ViaVersion](https://github.com/ViaVersion/ViaVersion)
6. [ViaBackwards](https://github.com/ViaVersion/ViaBackwards)

## 追加でいれるもの

1. [MCXboxBroadcast](https://github.com/MCXboxBroadcast/Broadcaster/releases)

## 入れられなかったプラグイン

1. [WorldEdit](https://www.curseforge.com/minecraft/mc-mods/worldedit)
2. [WorldGuard](https://dev.bukkit.org/projects/worldguard)

## 課題

1. Githubからこのサンプルを取得し、`docker compose up -d` のコマンドのみで遊べる状態まで持っていきたい。(OP権限などの設定で不可能？)
2. Minecraftサーバーコンテナの `/opt/srv/minecraft/server` 配下にある `Pufferfish.jar` 以外をホスト側とリンクしたい。
