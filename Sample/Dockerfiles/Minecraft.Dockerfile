####################################################################################################
# Alpine Linux
# Git からリリースされている BedrockConnect の JAR ファイルをダウンロードする。
####################################################################################################
FROM alpine:latest AS downloader
RUN wget -P /tmp https://ci.pufferfish.host/job/Pufferfish-1.21/11/artifact/build/libs/pufferfish-paperclip-1.21.1-R0.1-SNAPSHOT-mojmap.jar
RUN mv /tmp/pufferfish-paperclip-1.21.1-R0.1-SNAPSHOT-mojmap.jar /tmp/pufferfish.jar

####################################################################################################
# Switch 用 特集サーバー
# https://github.com/Pugmatt/BedrockConnect
####################################################################################################
# FROM gcr.io/distroless/java21
FROM azul/zulu-openjdk-distroless:21-latest

ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

WORKDIR /opt/srv/minecraft/server
# USER minecraft

VOLUME "/opt/srv/minecraft/config"
VOLUME "/opt/srv/minecraft/worlds"
VOLUME "/opt/srv/minecraft/plugins"
VOLUME "/opt/srv/minecraft/data"
VOLUME "/opt/srv/minecraft/logs"

COPY --from=downloader /tmp /opt/srv/minecraft/server

EXPOSE 25565/tcp
EXPOSE 25565/udp
CMD ["-jar", "-XX:+UseG1GC", "-XX:+UnlockExperimentalVMOptions", "-XX:MaxGCPauseMillis=100", "-XX:+DisableExplicitGC", "-XX:TargetSurvivorRatio=90", "-XX:G1NewSizePercent=50", "-XX:G1MaxNewSizePercent=80", "-XX:G1MixedGCLiveThresholdPercent=35", "-XX:+AlwaysPreTouch", "-XX:+ParallelRefProcEnabled", "-Dusing.aikars.flags=mcflags.emc.gs", "-server", "-Dcom.mojang.eula.agree=true", "-Xmx4G", "-Xms4G", "/opt/srv/minecraft/server/pufferfish.jar", "--nojline", "--bukkit-settings", "/opt/srv/minecraft/config/bukkit.yml", "--plugins", "/opt/srv/minecraft/plugins", "--world-dir", "/opt/srv/minecraft/worlds", "--spigot-settings", "/opt/srv/minecraft/config/spigot.yml", "--commands-settings", "/opt/srv/minecraft/config/commands.yml", "--config", "/opt/srv/minecraft/config/server.properties", "--paper-settings", "/opt/srv/minecraft/config/pufferfish.yml"]
