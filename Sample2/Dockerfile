####################################################################################################
# Alpine Linux
# ViaProxy の JAR ファイルをダウンロードする。
####################################################################################################
FROM alpine:latest AS downloader
RUN wget -P /tmp https://ci.viaversion.com/view/All/job/ViaProxy/lastSuccessfulBuild/artifact/build/libs/ViaProxy-3.3.4-SNAPSHOT.jar

####################################################################################################
# Minecraft Proxy サーバー
# https://github.com/ViaVersion/ViaProxy
####################################################################################################
# FROM gcr.io/distroless/java21
FROM azul/zulu-openjdk-distroless:21-latest
COPY --from=downloader /tmp/ViaProxy-*.jar /app/ViaProxy.jar
WORKDIR /app
EXPOSE 19132/udp
CMD ["-jar", "/app/ViaProxy.jar", "config", "viaproxy.yml"]
