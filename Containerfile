FROM ghcr.io/gbraad-devenv/fedora/rdesktop:41

USER gbraad

RUN mkdir -p ~/Downloads ~/Applications \
    && cd ~/Downloads \
    && wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/Obsidian-1.7.7.AppImage \
    && chmod +x Obsidian-1.7.7.AppImage \
    && ./Obsidian-1.7.7.AppImage --appimage-extract \
    && mv squashfs-root ~/Applications/Obsidian \
    && rm -f Obsidian-1.7.7.AppImage \
    && echo "exec ~/Applications/Obsidian/obsidian --no-sandbox" >> ~/.config/i3/config

USER root
# ensure to become root for systemd
#ENTRYPOINT ["/sbin/init"]
