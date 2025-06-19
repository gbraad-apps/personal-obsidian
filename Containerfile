ARG BASE_IMAGE="ghcr.io/gbraad-devenv/fedora/rdesktop"
ARG BASE_VERSION=41

FROM ${BASE_IMAGE}:${BASE_VERSION}

USER root

RUN cd /tmp \
    && VERSION=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/') \
    && wget https://github.com/obsidianmd/obsidian-releases/releases/download/${VERSION}/Obsidian-${VERSION#v}.AppImage \
    && chmod +x Obsidian-${VERSION#v}.AppImage \
    && ./Obsidian-${VERSION}.AppImage --appimage-extract \
    && mv squashfs-root /opt/obsidian \
    && rm -f Obsidian-${VERSION#v}.AppImage \
    && find /opt/obsidian -type d -exec chmod 755 {} \; \
    && git config -f /etc/rdesktop/rdesktop.ini rdesktop.title "Personal Obsidian ${VERSION}" \
    && git config -f /etc/rdesktop/rdesktop.ini rdesktop.exec "/opt/obsidian/obsidian --no-sandbox"

# ensure to become root for systemd
#ENTRYPOINT ["/sbin/init"]
