#!/bin/sh

# clean workspace folder
rm -rf /workspaces/personal-obsidian
mkdir /workspaces/personal-obsidian
ln -s /workspaces/personal-obsidian ~/Projects
git init /workspaces/personal-obsidian

cd ~

exit 0
