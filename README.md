Obsidian for private (remote) use
=================================

> [!NOTE]
> This image is based on my [gbraad-devenv/fedora](https://github.com/gbraad-devenv/fedora) image, and is therefore personalized;
> it uses  `Gerard` as user with my [dotfiles](https://github.com/gbraad/dotfiles) and tailored to use services exposed by my [homelab](https://github.com/gbraad-homelab) setup.
> For a more generic image, have a look at [spotsnel-apps/personal-obsidian](https://github.com/spotsnel-apps/personal-obsidian)


## Usage instructions

```
$ podman run -d --name obsidian --cap-add=NET_ADMIN --cap-add=NET_RAW --device=/dev/net/tun --device=/dev/fuse ghcr.io/gbraad-apps/obsidian:latest
$ podman exec obsidian tailscale up
$ ip=`podman exec obsidian tailscale ip -4`
$ echo "Open Obsidian at https://${ip}:8444"
```

... and then open `https://[tailscale_ip]:8444` as shown
