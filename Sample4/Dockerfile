FROM alpine:latest AS downloader
RUN apk add bash git
RUN git clone -b @jsprismarine/server@0.6.0 https://github.com/JSPrismarine/JSPrismarine.git /usr/src/app

FROM node:22-slim AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack use pnpm@latest
RUN corepack enable

FROM base AS build
COPY --from=downloader /usr/src/app /app
WORKDIR /app
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm run build
CMD [ "pnpm", "start" ]
