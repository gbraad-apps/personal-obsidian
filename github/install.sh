#!/bin/sh

# clean workspace folder
rm -rf /workspaces/private-obsidian
mkdir /workspaces/private-obsidian
ln -s /workspaces/private-obsidian ~/Projects
git init /workspaces/private-obsidian

cd ~

exit 0
