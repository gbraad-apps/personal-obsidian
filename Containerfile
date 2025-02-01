ARG BASE_IMAGE="ghcr.io/gbraad-devenv/fedora/rdesktop"
ARG BASE_VERSION=41

FROM ${BASE_IMAGE}:${BASE_VERSION}

ARG VERSION=1.8.4

USER root

RUN cd /tmp \
    && wget https://github.com/obsidianmd/obsidian-releases/releases/download/v${VERSION}/Obsidian-${VERSION}.AppImage \
    && chmod +x Obsidian-${VERSION}.AppImage \
    && ./Obsidian-${VERSION}.AppImage --appimage-extract \
    && mv squashfs-root /opt/obsidian \
    && rm -f Obsidian-${VERSION}.AppImage \
    && find /opt/obsidian -type d -exec chmod 755 {} \; \
    && git config -f /etc/rdesktop/rdesktop.ini rdesktop.title "Personal Obsidian ${VERSION}" \
    && git config -f /etc/rdesktop/rdesktop.ini rdesktop.exec "/opt/obsidian/obsidian --no-sandbox"
# ensure to become root for systemd
#ENTRYPOINT ["/sbin/init"]
