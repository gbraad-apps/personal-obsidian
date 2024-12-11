Obsidian for private (remote) use
=================================


## Usage instructions

```
$ podman run -d --name obsidian ghcr.io/gbraad-apps/obsidian:latest
$ podman exec -it obsidian su - gbraad
$ kasmvncserver 
$ sudo systemctl enable --now tailscaled
$ sudo tailscale up
$ tailscale ip
```

... and then open `https://[tailscale_ip]:8444`
