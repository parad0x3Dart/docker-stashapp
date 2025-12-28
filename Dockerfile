ARG VERSION
FROM docker.io/stashapp/stash:${VERSION}
RUN apk --no-cache add intel-media-driver py3-blessings py3-ruamel.yaml py3-six \
 && pip3 install --user --no-cache-dir --break-system-packages stashapp-tools yamldiff \
 && mkdir -p /etc/stash \
 && echo "#!/bin/sh" > /entrypoint.sh \
 && echo "cp /config /etc/stash/config.yml" >> /entrypoint.sh \
 && echo "exec stash --config /etc/stash/config.yml --nobrowser" >> /entrypoint.sh \
 && chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
LABEL maintainer="parad0x3Dart" \
    org.opencontainers.image.title="ghcr.io/parad0x3dart/stashapp" \
    org.opencontainers.image.url="https://github.com/parad0x3Dart/docker-stashapp" \
    org.opencontainers.image.source="https://github.com/parad0x3Dart/docker-stashapp" \
    org.opencontainers.image.licenses="MIT"
