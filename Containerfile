ARG BASE_IMAGE="ghcr.io/gbraad-devenv/fedora/rdesktop"
ARG BASE_VERSION=41

FROM ${BASE_IMAGE}:${BASE_VERSION}

USER root

RUN cd /tmp \
    && wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/Obsidian-1.7.7.AppImage \
    && chmod +x Obsidian-1.7.7.AppImage \
    && ./Obsidian-1.7.7.AppImage --appimage-extract \
    && mv squashfs-root /opt/obsidian \
    && rm -f Obsidian-1.7.7.AppImage \
    && find /opt/obsidian -type d -exec chmod 755 {} \;

USER gbraad

RUN echo "exec /opt/obsidian/obsidian --no-sandbox" >> $HOME/.config/i3/config

USER root
# ensure to become root for systemd
#ENTRYPOINT ["/sbin/init"]
