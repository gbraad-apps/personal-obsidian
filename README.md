Obsidian for private (remote) use
=================================

> [!NOTE]
> This image is based on my [gbraad-devenv/fedora](https://github.com/gbraad-devenv/fedora) image, and is therefore personalized;
> it uses  `gbraad` as user with my [dotfiles](https://github.com/gbraad/dotfiles) and tailored to use services exposed by my [homelab](https://github.com/gbraad-homelab) setup.


## Usage instructions

```
$ podman run -d --name obsidian ghcr.io/gbraad-apps/obsidian:latest
$ podman exec -it obsidian tailscale up
$ podman exec obsidian tailscale ip
```

... and then open `https://[tailscale_ip]:8444`
