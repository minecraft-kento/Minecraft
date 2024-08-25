####################################################################################################
# Alpine Linux
# Git からリリースされている BedrockConnect の JAR ファイルをダウンロードする。
####################################################################################################
FROM alpine:latest AS downloader
RUN wget -P /tmp https://github.com/Pugmatt/BedrockConnect/releases/download/1.49/BedrockConnect-1.0-SNAPSHOT.jar

####################################################################################################
# Switch 用 特集サーバー
# Minecraft support version for 1.21.20
# https://github.com/Pugmatt/BedrockConnect
####################################################################################################
# FROM gcr.io/distroless/java21
FROM azul/zulu-openjdk-distroless:21-latest
COPY --from=downloader /tmp /
WORKDIR /
EXPOSE 19132/udp
CMD ["-Xms256M", "-Xmx256M", "-jar", "BedrockConnect-1.0-SNAPSHOT.jar", "nodb=true"]


#####################################################################################################
## Switch 用 特集サーバー (version: Google Distroless Java)
## https://github.com/Pugmatt/BedrockConnect
#####################################################################################################
## Google Distrolles Java
# FROM gcr.io/distroless/java21
# COPY --from=downloader /tmp /
# WORKDIR /
# EXPOSE 19132/udp
# CMD ["BedrockConnect-1.0-SNAPSHOT.jar", "nodb=true"]
