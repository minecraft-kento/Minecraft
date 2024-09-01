FROM alpine:latest AS downloader
WORKDIR /tmp/git
RUN apk add bash git
RUN git clone -b "@jsprismarine/server@0.6.0" "https://github.com/JSPrismarine/JSPrismarine.git" /tmp/git
# CMD ["bash"]

FROM node:22-slim
WORKDIR /app/JSPrismarine
COPY --from=downloader /tmp/git /app/JSPrismarine
RUN corepack enable && \
    corepack prepare pnpm@latest --activate
# RUN pnpm install
# RUN pnpm run build
# CMD [ "pnpm", "run", "start" ]
CMD ["/bin/sh"]
